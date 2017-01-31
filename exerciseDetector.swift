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
        
        let oneWordExercises = ["burpees","situps","lunges","pullups","pullups","chinup","chinups","curls","squats","deadlifts","dips","pushups","pushup","crunches","ran","run","swam","swim"]
        
        let twoWordExercises = ["mountain climbers","bench press","knee tucks","hack squats","back squats","hack squats","leg lifts","chin ups","muscle up","hand stands","ab roll outs","calf raise","chest flye","back extension","overhead press","lateral raise","hammer curls","tricep extensions","incline press","medball slams","leg press"]
        
        let oneWordExercisesCount = oneWordExercises.count
        let twoWordExercisesCount = twoWordExercises.count
        
        var exercise = "NA"
        
        // Finish exercise definisions
        
        // Matching exercises that are two words in length
        // Make two word pairings from the array
        
        var firstWord = 0
        var secondWord = 1
        
        repeat {
            
            var currentWord = (incomingArray[firstWord]) + " " + (incomingArray[secondWord])
            
            for eachExercise in 0..<twoWordExercisesCount
            {
                if currentWord == twoWordExercises[eachExercise]
                {
                    exercise = currentWord
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
