//
//  CalulatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalulatorViewController: UIViewController {

    // all the outlets we need!
    @IBOutlet weak var billTextField: UITextField!
    
    // could use an ID to identify the Buttons as well, but more easy now
    // to use the text on them
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // all the vars we need!
    var selectedTip: Float = 0.10
    var billPerGuest: Float = 0.0
    var guests = 2
    var overallBill: Float = 0.0
    var zuWenig: Int = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // remove Keyboard
        billTextField.endEditing(true)
        
        // delete focus on all 3 buttons
        ( zeroPctButton.isSelected, tenPctButton.isSelected, twentyPctButton.isSelected ) =
            (false, false, false)
        
        // highligt pressed button
        sender.isSelected = true
        
        // Set the selected Tip to the title - the % sign / 100 (percentage value)
        selectedTip = (Float(sender.currentTitle!.dropLast()) ?? 0.0) / 100.0
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        // just update the text on the splitlabel
        splitNumberLabel.text = String(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // fill the class variables for easy throwning around later
        
        overallBill = Float(billTextField.text!) ?? 0.0
        guests = Int(splitNumberLabel.text!)!
        
        // Take the bill, add the tip, divide by people and make sure there is no nil
        // while unwrapping the optionals
        
        billPerGuest = (overallBill + (overallBill * selectedTip)) / (Float(guests))
        
        // It's possible that there are a few cents missing
        
        zuWenig = Int(100 * ((overallBill + (overallBill * selectedTip)) - (Float(round(100 * billPerGuest) / 100) * Float(guests))))
        
        // Let's show them the results
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // gotta prepare for going to the next screen!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let resultsVC = segue.destination as! ResultsViewController
    
            // self not needed, using it anyways (remember in swift it's self, not this!
            resultsVC.guests = self.guests
            resultsVC.billPerGuest = self.billPerGuest
            resultsVC.tipPercentage = Int(self.selectedTip *  100)
            resultsVC.zuWenig = self.zuWenig
        }
    }
}

