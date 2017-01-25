//
//  SetDetector.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

class setDetector {
    
    func detectSet (incomingArray: [String]) -> (String, [String]) {
        
        var thereAreSets = false
        var whichIndexFound = 0
        
        // Check to see if sets, if so set as true
        // Defining the words that count as set
        
        let setWords = ["sets","set"]
        
        let incomingArrayCount = incomingArray.count
        let numberOfSetWords = setWords.count
        
        for each in 0..<incomingArrayCount {
            
            
            var currentWord = ("\(incomingArray[each])")
            
            if setWords.contains(currentWord)
                
            {
                thereAreSets = true
                print ("There was sets")
                whichIndexFound = each
                break
            }
            
            
            
            
        }
        
        // Grab the amount of the weight
        
        if thereAreSets == true {
            
            let theSetsAre = incomingArray[whichIndexFound - 1]
            
            // Remove the word pounds
            
            print ("Current array values: \(incomingArray)")
            
            var newArray = incomingArray
            newArray.remove(at: whichIndexFound)
            
            print ("Removed one, current array values: \(newArray)")
            
            newArray.remove(at: whichIndexFound - 1)
            
            print ("Removed two, current array values: \(newArray)")
            
            return (theSetsAre,newArray)
            
        }
            
        else {
            return ("NA",incomingArray)
        }
        
    }
    
}
