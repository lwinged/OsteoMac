//
//  ViewController.swift
//  OsteoMac
//
//  Created by flav on 09/05/2016.
//  Copyright © 2016 lwinged. All rights reserved.
//

import Cocoa

class PatientDetailViewController: NSViewController {

    @IBOutlet weak var lastNameTextField: NSTextField!
    @IBOutlet weak var firstNameTextField: NSTextField!
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var phoneNumberTextField: NSTextField!
    @IBOutlet weak var addressTextField: NSTextField!
    @IBOutlet weak var doctorTextField: NSTextField!
    @IBOutlet weak var sportsTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension PatientDetailViewController: PatientDelegate {

    func didSelectedPatient(patient: [String: String]) {
        self.lastNameTextField?.stringValue = patient["lastName"]!
        self.firstNameTextField?.stringValue = patient["firstName"]!
        self.emailTextField?.stringValue = patient["email"]!
        self.addressTextField?.stringValue = patient["address"]!
        self.phoneNumberTextField?.stringValue = patient["phoneNumber"]!
        self.doctorTextField?.stringValue = patient["doctor"]!
        self.sportsTextField?.stringValue = patient["sports"]!
    }

    @IBAction func goToConsultations(sender: NSButton) {
        print("Go to consultations")
    }
    
    @IBAction func savePatientDetail(sender: NSButton) {
        print("Save patient")
    }
    
}