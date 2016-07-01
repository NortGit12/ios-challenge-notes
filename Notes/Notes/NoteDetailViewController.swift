//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Jeff Norton on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var note: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextArea: UITextView!
    
    
    // MARK: - General

    override func viewDidLoad() {
        super.viewDidLoad()

        if let note = note {
            updateWith(note)
        }
    }
    
    func updateWith(note: Note) {
        
        titleTextField.text = note.title
        textTextArea.text = note.text
        
    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        guard let title = titleTextField.text, text = textTextArea.text else {
            return
        }
        
        if title.characters.count > 0 && text.characters.count > 0 {
            
            if let note = note {
                
                // Edited note
                
                note.title = title
                note.text = text
                
                NoteController.sharedController.updateNote(note)
                
            } else {
                
                // New note
                
                NoteController.sharedController.createNote(title, text: text)
                
            }
            
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        
        titleTextField.text = ""
        textTextArea.text = ""
        
    }

}
