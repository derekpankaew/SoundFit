//
//  distanceDetector.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

class distanceDetector {
    
    func detectDistance (incomingArray: [String]) -> (String, [String]) {
        
        var thereIsDistance = false
        var whichIndexFound = 0
        
        // Check to see if weight, if so set as true
        // Defining the words that count as weights
        
        let distanceWords = ["mile","miles","km","lap","laps","kilometers"]
        
        let incomingArrayCount = incomingArray.count
        let numberOfDistanceWords = distanceWords.count
        
        for each in 0..<incomingArrayCount {
            
            
            var currentWord = ("\(incomingArray[each])")
            
            if distanceWords.contains(currentWord)
                
            {
                thereIsDistance = true
                print ("There was distance")
                whichIndexFound = each
                break
            }
            
            
            
            
        }
        
        // Grab the amount of the weight
        
        if thereIsDistance == true {
            
            let theDistanceIs = incomingArray[whichIndexFound - 1]
            
            // Remove the word pounds
            
            print ("Current array values: \(incomingArray)")
            
            var newArray = incomingArray
            newArray.remove(at: whichIndexFound)
            
            print ("Removed one, current array values: \(newArray)")
            
            newArray.remove(at: whichIndexFound - 1)
            
            print ("Removed two, current array values: \(newArray)")
            
            return (theDistanceIs,newArray)
            
        }
            
        else {
            return ("NA",incomingArray)
        }
        
    }
    
}
