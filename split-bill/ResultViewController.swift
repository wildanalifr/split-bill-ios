//
//  ResultViewController.swift
//  split-bill
//
//  Created by Wildan on 25/02/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultPaid: Double = 0.0
    var resultPerson: Int = 0
    var resultTip: String = "0%"
    var resultMethod: String = ""

    @IBOutlet weak var textResultPaid: UILabel!
    @IBOutlet weak var textMethod: UILabel!
    @IBOutlet weak var textSplitBy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("text: \(resultPaid)")
        
        // Do any additional setup after loading the view.
        
        
        if resultPaid.isNaN || resultPaid.isInfinite{
            textResultPaid.text = "-"
        }
        else {
            textResultPaid.text = String(resultPaid)
        }
        
        textSplitBy.text = "Split by \(resultPerson) person, tip \(resultTip)"
        textMethod.text = "Method Payment: \(resultMethod)"
    }
    

  
    @IBAction func clickRecalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
