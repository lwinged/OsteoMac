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
    func didSelectedPatient(name: String)
}

class PatientTableViewController: NSViewController {
    
    @IBOutlet weak var searchBar: NSSearchField!
    @IBOutlet weak var tableView: NSTableView!
    
    let kPatientNameCellID = "PatientNameCellID"
    
    //tmp CoreData
    let kPatients = ["toto", "tutu", "titi"]
    var result:[String] = []
    
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
        self.result = self.kPatients.filter { return $0 == self.searchBar.stringValue }
        
        if self.result.count == 0 {
            self.result = self.kPatients
        }
        self.tableView.reloadData()
    }
}

extension PatientTableViewController: NSTableViewDataSource {

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.result.count
    }
}


extension PatientTableViewController: NSTableViewDelegate {
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeViewWithIdentifier(self.kPatientNameCellID, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = self.result[row]
            return cell
        }
        return nil
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        if let table = notification.object as? NSTableView where table.selectedRow < self.result.count && table.selectedRow >= 0 {
            let name = self.result[table.selectedRow]
            self.delegate?.didSelectedPatient(name)
        }
    }
}