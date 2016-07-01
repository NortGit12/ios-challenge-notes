//
//  Note.swift
//  Notes
//
//  Created by Jeff Norton on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    // MARK: - Properties
    
    var title: String
    var text: String
    var timestamp: NSDate
    
    private let titleKey = "titleKey"
    private let textKey = "textKey"
    private let timestampKey = "timestampKey"
    
    var dictionaryCopy: [String : AnyObject] {
        
        return [titleKey: title, textKey: text, timestampKey: timestamp]
        
    }
    
    // MARK: - Initializers
    
    init(title: String, text: String) {
        
        self.title = title
        self.text = text
        self.timestamp = NSDate()
        
    }
    
    init?(dictionary: [String : AnyObject]) {
        
        guard let title = dictionary[titleKey] as? String, text = dictionary[textKey] as? String, timestamp = dictionary[timestampKey] as? NSDate else {
            return nil
        }
        
        self.title = title
        self.text = text
        self.timestamp = timestamp
        
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    
    return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
    
}