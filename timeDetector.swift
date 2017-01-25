//
//  timeDetector.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

class timeDetector {
    
    func detectTime (incomingArray: [String]) -> (String, [String]) {
        
        var thereIsTime = false
        var whichIndexFound = 0
        
        // Check to see if weight, if so set as true
        // Defining the words that count as weights
        
        let timeWords = ["minute","minutes","second","seconds"]
        
        let incomingArrayCount = incomingArray.count
        let numberOfTimeWords = timeWords.count
        
        for each in 0..<incomingArrayCount {
            
            
            var currentWord = ("\(incomingArray[each])")
            
            if timeWords.contains(currentWord)
                
            {
                thereIsTime = true
                print ("There was distance")
                whichIndexFound = each
                break
            }
            
            
            
            
        }
        
        // Grab the amount of the weight
        
        if thereIsTime == true {
            
            let theTimeIs = incomingArray[whichIndexFound - 1]
            
            // Remove the word pounds
            
            print ("Current array values: \(incomingArray)")
            
            var newArray = incomingArray
            newArray.remove(at: whichIndexFound)
            
            print ("Removed one, current array values: \(newArray)")
            
            newArray.remove(at: whichIndexFound - 1)
            
            print ("Removed two, current array values: \(newArray)")
            
            return (theTimeIs,newArray)
            
        }
            
        else {
            return ("NA",incomingArray)
        }
        
    }
    
}
