//
//  weightDetector.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

class weightDetector {
    
    func detectWeights (incomingArray: [String]) -> (String, [String]) {
        
        var thereIsWeight = false
        var whichIndexFound = 0
        
        // Check to see if weight, if so set as true
        // Defining the words that count as weights
        
        let weightWords = ["pound","pounds","lb","lbs","kg","kilos","kilograms","kgs"]
        
        let incomingArrayCount = incomingArray.count
        let numberOfWeightWords = weightWords.count
        
        for each in 0..<incomingArrayCount {
            
            
            var currentWord = ("\(incomingArray[each])")
            
            if weightWords.contains(currentWord)
                
            {
                thereIsWeight = true
                print ("There was weight")
                whichIndexFound = each
                break
            }
            
            
            
            
        }
        
        // Grab the amount of the weight
        
        if thereIsWeight == true {
            
            let theWeightIs = incomingArray[whichIndexFound - 1]
            
            // Remove the word pounds
            
            print ("Current array values: \(incomingArray)")
            
            var newArray = incomingArray
            newArray.remove(at: whichIndexFound)
            
            print ("Removed one, current array values: \(newArray)")
            
            newArray.remove(at: whichIndexFound - 1)
            
            print ("Removed two, current array values: \(newArray)")
            
            
            return (theWeightIs,newArray)
            
        }
        
        else {
            return ("NA",incomingArray)
        }
        
    }
    
}







/*
 if currentWord == "pound" || currentWord == "pounds" || currentWord ==  || currentWord ==  || currentWord == "lb" || currentWord == "lbs" || currentWord == "kg" || currentWord == "kilos" || currentWord == "kgs"
 */



/*
 
 for eachWeightWord in 0..<numberOfWeightWords {
 
 if currentWord == weightWords[eachWeightWord] {
 thereIsWeight = true
 print ("Weight found")
 }
 
 else {
 print ("There is no match")
 }
 }
 
 */




