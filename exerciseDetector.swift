//
//  exerciseDetector.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

class exerciseDetector {
    
    func detectExercise (incomingArray: [String]) -> (String, [String]) {
        
        print("The incoming array is \(incomingArray)")
        
        let threeWordExercises = ["horse back riding","brazilian jiu jitsu","verticle leg lifts","vertical leg lifts","verticle leg lift","vertical leg lift","triceps pull downs","triceps pull down","dumbbell pull overs","dumbbell pull over","one arm curls","one arm curl","standing calf raises","standing calf raise","standing bicep curls","standing bicep curl","standing barbell curls","standing bar curls","standing bar curl","side leg raises","side leg raise","seated calfs raises","seated calfs raise","seated calf raises","seated calf raise","seated biceps curls","seated biceps curl","seated bicep curls","seated bicep curl","reverse trunk twists","reverse trunk twist","reverse sit ups","reverse sit up","rear deltoid raises","rear deltoid raise","over head presses","over head press","leg pull ins","leg pull in","lateral pull downs","lateral pull down","lateral arm raises","lateral arm raise","lat pull ins","lat pull in","lat pull downs","lat pull down","lat arm raises","lat arm raise","incline dumbbell fly","incline dumbbell flies","incline dumbbell curls","incline dumbbell curl","incline bench presses","incline bench press","front barbell raises","front barbell raise","flat dumbbell presses","flat dumbbell press","flat dumbbell fly","flat dumbbell flies","dumbbell kick backs","dumbbell kick back","dumbbell incline laterals","dumbbell incline lateral","decline dumbbell fly","decline dumbbell flies","decline bench presses","decline bench press","cable cross overs","cable cross over","bent arm lateral"]
        
        let oneWordExercises = ["yoga","walked","walk","walking","tennis","swimming","swum","swam","swim","surfed","surfing","surf","stretch","squash","softball","soccer","skiing","ski","skied","skated","skating","skateboarding","skateboarded","skateboard","sailing","sailed","sail","running","ran","run","rugby","rowed","rowing","racquetball","pilates","stretched","stretching","lacrosse","kickball","kayaking","hunting","hockey","hiking","handball","hackeysack","gymnastics","golf","frisbees","frisbee","footballs","football","fished","fishing","fenced","fencing","dived","diving","danced","dancing","croquet","cricket","crewing","crewed","canoed","canoeing","calisthenics","BJJ","boxed","boxing","bowled","bowling","biked","bike","bicycled","bicycle","cycled","cycle","bellydance","bellydanced","bellydancing","basketballs","basketball","baseball","badminton","backpacked","backpack","backpacking","archery","aerobics","aerobic","squats","squat","situp","pushups","pushup","pullups","pullup","pullovers","pullover","lunges","lunge","kickbacks","kickback","hyperextensions","hyperextension","dips","dip","deadlifts","deadlift","chinups","chinup","butterfly","butterflies","treadmill","stairmaster"]
        
        let twoWordExercises = ["stationary bike","soft ball","ice skated","ice skating","skate boarding","skate boarded","skate board","rope jumped","rope jump","jump rope","jump roped","jumped ropes","speed ropes","speed roping","speed roped","roller blades","roller blading","rock climb","climbed rocks","rock climbed","rock climbing","kick ball","jumping jack","jumping jacks","jet skiing","horseback riding","horse riding","hand ball","hackey sacks","hackey sack","foot balls","foot ball","elliptical trainers","elliptical trainer","circuit training","jiu jitsu","bi cycle","bi cycled","belly dance","belly danced","belly dancing","wrist roller","wrist curl","wrist rollers","wrist curls","upright rows","upright row","tricep extensions","tricep extension","toe presses","toe press","dumbbell pullovers","dumbbell pullover","trunk twists","trunk twist","sit ups","sit up","side laterals","side lateral","side bends","side bend","shoulder shrugs","shoulder shrug","shoulder presses","shoulder press","seated rows","seated row","reverse situps","reverse situp","push ups","push up","pull up","pull overs","pull over","pull ups","pelvic lifts","pelvic lift","pectoral fly","pectoral flies","overhead presses","overhead press","military presses","military press","mid rows","mid row","machine squats","machine squat","machine fly","machine flies","leg raises","leg raise","leg pullins","leg pullin","leg pullings","leg pulling","leg presses","leg press","leg extensions","leg extension","leg curls","leg curl","lateral raises","lateral raise","lateral pulldowns","lateral pulldown","lat raises","lat raise","lat pulldowns","lat pulldown","hyper extensions","hyper extension","hip flexors","hip flexor","hip abductions","hip abduction","heel raises","heel raise","hack squats","hack squat","front squats","front squat","front raises","front raise","dumbbell rows","dumbbell row","dumbbell presses","dumbbell press","dumbbell kickbacks","dumbbell kickback","dumbbell fly","dumbbell flies","deltoid raises","deltoid raise","chin ups","chin up","chest presses","chest press","calf raises","calf raise","cable crossovers","cable crossover","biceps curls","biceps curl","bicep curls","bicep curl","bench presses","bench press","barbell rows","barbell row","barbell raises","barbell raise","barbell pullovers","barbell pullover","barbell curls","barbell curl","bar dips","bar dip","bar curl","back extensions","back extension","back butterfly","back butterflies","arm raises","arm raise","abdominal crunch","abdominal twists","abdominal twist","abdominal crunches","stair master","stair masters"]
        
        let oneWordExercisesCount = oneWordExercises.count
        let twoWordExercisesCount = twoWordExercises.count
        let threeWordExercisesCount = threeWordExercises.count
        
        var exercise = "NA"
        
        // Finish exercise definisions
        
        // Check three word exercises against string
        
        var firstWord = 0
        var secondWord = 1
        var thirdWord = 2
        
        repeat {
            
            var currentWord = (incomingArray[firstWord]) + " " + (incomingArray[secondWord] + " " + incomingArray[thirdWord])
            
            for eachExercise in 0..<threeWordExercisesCount
            {
                if currentWord == threeWordExercises[eachExercise]
                {
                    exercise = currentWord
                    return (exercise,incomingArray)
                }
                else
                { print ("There is no match between \(currentWord) and \(twoWordExercises[eachExercise])") }
            }
            
            firstWord = firstWord + 1
            secondWord = secondWord + 1
            thirdWord = thirdWord + 1
            
        } while thirdWord <= ((incomingArray.count) - 1)
        
        
        // Matching exercises that are two words in length
        // Make two word pairings from the array
        
        firstWord = 0
        secondWord = 1
        
        repeat {
            
            var currentWord = (incomingArray[firstWord]) + " " + (incomingArray[secondWord])
            
            for eachExercise in 0..<twoWordExercisesCount
            {
                if currentWord == twoWordExercises[eachExercise]
                {
                    exercise = currentWord
                    return (exercise,incomingArray)
                }
                else
                { print ("There is no match between \(currentWord) and \(twoWordExercises[eachExercise])") }
            }
            
            firstWord = firstWord + 1
            secondWord = secondWord + 1
            
        } while secondWord <= ((incomingArray.count) - 1)
        
        // Finished with two word pairings
        // Start 1 word matching
        
        let arrayLength = incomingArray.count
        for eachWord in 0..<arrayLength {
            
            print ("Array started")
            
            var currentWord = incomingArray[eachWord]
            
            for eachExercise in 0..<oneWordExercisesCount
            {
                if currentWord == oneWordExercises[eachExercise]
                { print ("There's a match, it's \(currentWord)")
                    exercise = currentWord
                }
                else
                { print ("There is no match") }
            }
            
        }
        
        // Finish with 1 word matching
        
        print ("End of Exercise Detection, values are Exercise: \(exercise) and outgoing Array:\(incomingArray)")
        return (exercise,incomingArray)
        
    }
    
}
