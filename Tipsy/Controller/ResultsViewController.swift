//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Fabian Schäfle on 07.02.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var guests: Int = 2
    var billPerGuest: Float = 0.0
    var tipPercentage: Int = 0
    var zuWenig: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Filling in the voids!
        totalLabel.text = String(format: "%.2f", billPerGuest)
        
        settingsLabel.text = "Für " + String(guests) + " Leutz mit lächerlichen " + String(tipPercentage) + "% Trinkegeld!"
        
        // is there a little more change needed to get exactly to the desired tip?
        if zuWenig! > 0 {
            settingsLabel.text = settingsLabel.text! + " Die " + String(zuWenig!) + " Pfennig die dann zu wenig sind, muss einer noch dazusteuern"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
