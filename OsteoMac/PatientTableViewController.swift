//
//  PatientTableViewController.swift
//  OsteoMac
//
//  Created by flav on 09/05/2016.
//  Copyright © 2016 lwinged. All rights reserved.
//

import Cocoa


protocol PatientDelegate: class {
    //patientID later
    func didSelectedPatient(patient: [String: String])
}

class PatientTableViewController: NSViewController {
    
    @IBOutlet weak var searchBar: NSSearchField!
    @IBOutlet weak var tableView: NSTableView!
    
    let kPatientNameCellID = "PatientNameCellID"
    
    //tmp CoreData
    //let kPatients = ["toto", "tutu", "titi"]
    let kPatients = [["firstName": "toto", "lastName": "toto1", "email": "toto@toto.com", "address": "3 rue du toto",
        "phoneNumber": "0634440325", "doctor": "Dr.Toto", "sports": "football"],
                      ["firstName": "tutu", "lastName": "tutu1", "email": "tutu@tutu.com", "address": "3 rue du tutu",
                        "phoneNumber": "0634440326", "doctor": "Dr.Tutu", "sports": "football"],
                      ["firstName": "titi", "lastName": "titi1", "email": "titi@titi.com", "address": "3 rue du titi",
                        "phoneNumber": "0634440327", "doctor": "Dr.Titi", "sports": "basketball"]]
    
    var result:[[String: String]] = []
    
    weak var delegate: PatientDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        if let detailVC = self.parentViewController?.childViewControllers[1] as? PatientDetailViewController {
            self.delegate = detailVC
        }
        
        //load data
        self.result = self.kPatients
    }
    
    @IBAction func tapOnValidationButton(sender: AnyObject) {
        //tmp filter begin with in CoreData
        self.result = self.kPatients.filter { return ($0 as[String: String])["firstName"] == self.searchBar.stringValue }
        
        if self.result.count == 0 {
            self.result = self.kPatients
        }
        self.tableView.reloadData()
    }
}

// MARK: NSTableView

// MARK: - NSTableView Data Source

extension PatientTableViewController: NSTableViewDataSource {

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.result.count
    }
}


// MARK: - NSTableView Delegate

extension PatientTableViewController: NSTableViewDelegate {
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeViewWithIdentifier(self.kPatientNameCellID, owner: nil) as? NSTableCellView where self.result.count > 0 {
            cell.textField?.stringValue = self.result[row]["firstName"]!
            return cell
        }
        return nil
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        if let table = notification.object as? NSTableView where table.selectedRow < self.result.count && table.selectedRow >= 0 {
            let patient = self.result[table.selectedRow]
            self.delegate?.didSelectedPatient(patient)
        }
    }
}