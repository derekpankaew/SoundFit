/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The primary view controller. The speach-to-text engine is managed an configured here.
*/

import UIKit
import Speech

public class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    

    
    
    
    // MARK: Properties
    
    // Set the locale
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    
    // Unsure what this does ^^
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    // I think this sets recognitionTast variable to the current status of the recognition
    private var recognitionTask: SFSpeechRecognitionTask?
    
    // Also not entirely sure what this does ^^
    private let audioEngine = AVAudioEngine()
    
    // Name textView the text view
    @IBOutlet var textView : UITextView!
    
    // Name the exercise view
    
    
    @IBOutlet weak var exerciseView: UITextView!
    
    // Text field for how many pushups
    @IBOutlet weak var howManyPushups: UITextView!
   
    @IBOutlet weak var numberOfSets: UITextView!
    
    @IBOutlet weak var howMuchWeight: UITextView!
    
    // Name and connect recordButton with the button
    @IBOutlet var recordButton : UIButton!
    
    // MARK: UIViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable the record buttons until authorization has been granted.
        recordButton.isEnabled = false
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        // Need to understand delegates ^^ seems important
        speechRecognizer.delegate = self
        
        // Checks for authorization
        // Gives case by case for what to do depending on authorization status
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            /*
                The callback may not be called on the main thread. Add an
                operation to the main queue to update the record button's state.
            */
            OperationQueue.main.addOperation {
                switch authStatus {
                    case .authorized:
                        self.recordButton.isEnabled = true

                    case .denied:
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("User denied access to speech recognition", for: .disabled)

                    case .restricted:
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("Speech recognition restricted on this device", for: .disabled)

                    case .notDetermined:
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("Speech recognition not yet authorized", for: .disabled)
                }
            }
        }
    }
    
    private func startRecording() throws {

        // Cancel the previous task if it's running.
        if let recognitionTask = recognitionTask {
            recognitionTask.cancel()
            self.recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSessionCategoryRecord)
        try audioSession.setMode(AVAudioSessionModeMeasurement)
        try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode = audioEngine.inputNode else { fatalError("Audio engine has no input node") }
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") }
        
        // Configure request so that results are returned before audio recording is finished
        recognitionRequest.shouldReportPartialResults = true
        
        // A recognition task represents a speech recognition session.
        // We keep a reference to the task so that it can be cancelled.
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            
            if let result = result {
                let spokenSentence = result.bestTranscription.formattedString
                isFinal = result.isFinal
                self.textView.text = spokenSentence
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.recordButton.isEnabled = true
                self.recordButton.setTitle("Start Recording", for: [])
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        try audioEngine.start()
        
        textView.text = "(Go ahead, I'm listening)"
    }

    // MARK: SFSpeechRecognizerDelegate
    
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            recordButton.isEnabled = true
            recordButton.setTitle("Start Recording", for: [])
        } else {
            recordButton.isEnabled = false
            recordButton.setTitle("Recognition not available", for: .disabled)
        }
    }
    
    // MARK: Interface Builder actions
    
    @IBAction func recordButtonTapped() {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            recordButton.isEnabled = false
            // recordButton.setTitle("Stopping", for: .disabled)
            
            
            // Starting code for number of reps
            // Grab transcribed text, loop through, detect if it's a number, if so display it in the window
            
            let theSentence = textView.text.lowercased()
            
            //Separate String into Array, standardize text (no caps / punctuation)
            
            let textProcessor = arrayMaker()
            var workingArray = textProcessor.makeMeAnArray(inputText: theSentence)
            
            // Set the weight performed, if none available return NA
            // weight is the weight, workingArray contains string of remaining words
            
            let weightProcessor = weightDetector()
            let checkingWeight = weightProcessor.detectWeights(incomingArray: workingArray)
            
            let weight = checkingWeight.0
            workingArray = checkingWeight.1
            
            self.howMuchWeight.text = weight
            
            
            // Set the distance performed, if none available return NA
            // distance is the distance, workingArray contains string of remaining words
            
            let distanceProcessor = distanceDetector()
            let checkingDistance = distanceProcessor.detectDistance(incomingArray: workingArray)
            let distance = checkingDistance.0
            workingArray = checkingDistance.1
            
            // Set the time performed, if none available return NA
            // time is the time, workingArray contains string of remaining words
            
            let timeProcessor = timeDetector()
            let checkingTime = timeProcessor.detectTime(incomingArray: workingArray)
            let time = checkingTime.0
            workingArray = checkingTime.1
            
            // Set the number of sets performed, if none available return NA
            // set is the set, workingArray contains string of remaining words
            
            let areThereSets = setDetector()
            let checkingSets = areThereSets.detectSet(incomingArray: workingArray)
            let sets = checkingSets.0
            workingArray = checkingSets.1
            
            self.numberOfSets.text = sets
            
            //Detect number of reps, doesn't change workingArray
            
            var arrayLength: Int = workingArray.count
            var numberOfReps = "NA"
            
            for text in 0..<arrayLength {
                let numbers = NSCharacterSet.decimalDigits
                if workingArray[text].rangeOfCharacter(from: numbers) != nil
                {
                    numberOfReps = workingArray[text]
                }
            }
            
            self.howManyPushups.text = numberOfReps
            
            // Set exercise performed, if none available return NA
            
            let whatExercise = exerciseDetector()
            let checkingExercise = whatExercise.detectExercise(incomingArray: workingArray)
            let exercise = checkingExercise.0
            workingArray = checkingExercise.1
            
            self.exerciseView.text = exercise.capitalized
            
            print("Current values are, Weight:\(weight) Distance:\(distance), Time: \(time), Sets: \(sets), Reps: \(numberOfReps), Exercise: \(exercise) and current array:\(workingArray)")
            

            
            /* OLD CODE ----
            var currentText = textView.text
            var sentenceInArray = currentText?.components(separatedBy: " ")
            print (sentenceInArray?[3])
            self.howManyReps.text = sentenceInArray?[3]
            */
            // End displaying of text
            
        } else {
            try! startRecording()
            // recordButton.setTitle("Stop recording", for: [])

        }
    }
}

