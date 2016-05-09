//
//  ViewController.swift
//  OsteoMac
//
//  Created by flav on 09/05/2016.
//  Copyright © 2016 lwinged. All rights reserved.
//

import Cocoa

class PatientDetailViewController: NSViewController {

    @IBOutlet weak var nameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension PatientDetailViewController: PatientDelegate {

    func didSelectedPatient(name: String) {
        self.nameTextField?.stringValue = name
    }

}