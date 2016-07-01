//
//  NoteController.swift
//  Notes
//
//  Created by Jeff Norton on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    // MARK: - Properties
    
    static let sharedController = NoteController()
    
    var notes: [Note] = []
    
    let storedNotesKey = "storedNotesKey"
    
    // MARK: - Initializers
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: Methods
    
    func createNote(title: String, text: String) {
        
        if title.characters.count > 0 && text.characters.count > 0 {
            
            let note = Note(title: title, text: text)
            notes.append(note)
            
            saveToPersistentStore()
        }
    }
    
    func updateNote(note: Note) {
        
        guard let index = notes.indexOf(note) else {
            return
        }
        
        let title = note.title
        let text = note.text
        
        if title.characters.count > 0 && text.characters.count > 0 {
            notes[index].title = title
            notes[index].text = text
        }
        
        saveToPersistentStore()
    }
    
    func deleteNote(note: Note) {
        
        guard let index = notes.indexOf(note) else {
            return
        }
        
        notes.removeAtIndex(index)
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
    
        NSUserDefaults.standardUserDefaults().setObject(notes.map{ $0.dictionaryCopy }, forKey: storedNotesKey)
    
    }
    
    func loadFromPersistentStore() {
    
        guard let notesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(storedNotesKey) as? [[String : AnyObject]] else {
            return
        }
        
        notes = notesDictionaryArray.flatMap{ Note(dictionary: $0) }
    
    }
    
}