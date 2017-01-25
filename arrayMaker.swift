//
//  arrayMaker.swift
//  Testing Language Processing Logic
//
//  Created by Derek Pankaew on 1/24/17.
//  Copyright © 2017 Derek Pankaew. All rights reserved.
//

import Foundation

// Sets up the code to remove puncutation marks

extension String {
    func removingCharacters(inCharacterSet forbiddenCharacters:CharacterSet) -> String
    {
        var filteredString = self
        while true {
            if let forbiddenCharRange = filteredString.rangeOfCharacter(from: forbiddenCharacters)  {
                filteredString.removeSubrange(forbiddenCharRange)
            }
            else {
                break
            }
        }
        
        return filteredString
    }
}

class arrayMaker {
    
    func makeMeAnArray (inputText: String) -> [String] {
        
        // Removing punctuation marks
        
        var removedPunctuation = inputText
        removedPunctuation = removedPunctuation.removingCharacters(inCharacterSet: CharacterSet.punctuationCharacters)
        
        // Lowercase the initial sentence
        
        let sentenceLowercased = removedPunctuation.lowercased()
        
        // Break sentence into Array
        
        var theArray = sentenceLowercased.components(separatedBy: " ")
        
        // Change 1-9 into numerical format
        
        for num in 0..<theArray.count {
            if theArray[num] == "one" {
                theArray[num] = "1"
            }
            if theArray[num] == "two" {
                theArray[num] = "2"
            }
            if theArray[num] == "three" {
                theArray[num] = "3"
            }
            if theArray[num] == "four" {
                theArray[num] = "4"
            }
            if theArray[num] == "five" {
                theArray[num] = "5"
            }
            if theArray[num] == "six" {
                theArray[num] = "6"
            }
            if theArray[num] == "seven" {
                theArray[num] = "7"
            }
            if theArray[num] == "eight" {
                theArray[num] = "8"
            }
            if theArray[num] == "nine" {
                theArray[num] = "9"
            }
            
            
        }

        
        return theArray
        
    }
    
    
    
}
