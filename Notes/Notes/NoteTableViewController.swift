//
//  NoteTableViewController.swift
//  Notes
//
//  Created by Jeff Norton on 7/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {

    // MARK - General
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.sharedController.notes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("notesTableCell", forIndexPath: indexPath)

        let note = NoteController.sharedController.notes[indexPath.row]
        
        cell.textLabel?.text = note.title
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        
        let dateString = formatter.stringFromDate(note.timestamp)
        
        cell.detailTextLabel?.text = "\(dateString)"

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            let note = NoteController.sharedController.notes[indexPath.row]
            NoteController.sharedController.deleteNote(note)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // How am I getting there?
        
        // No prep work needed for the "addToDetail" segue
            
        if segue.identifier == "exitingToDetail" {
            
            // Where am I going?
            if let noteDetailViewController = segue.destinationViewController as? NoteDetailViewController {
                
                // What am I taking with me?
                
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    let note = NoteController.sharedController.notes[index]
                    
                    // Is it packed?
                    noteDetailViewController.note = note
                    
                }
            }
        }
    }
    

}
