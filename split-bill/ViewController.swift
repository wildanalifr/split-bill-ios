//
//  ViewController.swift
//  split-bill
//
//  Created by Wildan on 24/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var percentTip: UILabel!
    @IBOutlet weak var textStepper: UILabel!

    @IBOutlet weak var btnCash: UIButton!
    @IBOutlet weak var btnCredit: UIButton!
    @IBOutlet weak var btnWallet: UIButton!
    
    var split = Split(amount:0, tip: 0.5, person: 0, method: .card)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnCash.isSelected = true
        percentTip.text = "50%"

        textField.keyboardType = .decimalPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func textChange(_ sender: UITextField) {

        guard let text = sender.text, !text.isEmpty else {
                print("Invalid input: empty text")
                return
            }
            
        // this happen to convert , to . because double is not accept this and make sure not have " "
            let cleanedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                                  .replacingOccurrences(of: ",", with: ".")
            
            guard let doubleAmount = Double(cleanedText) else {
                print("Invalid input: cannot convert '\(cleanedText)' to Double")
                return
            }
            
            print("Valid amount: \(doubleAmount)")
            split.changeAmount(doubleAmount)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func clickbtn(_ sender: UIButton) {
        //        print(sender.)
        //        anubtn.isSelected = false
        //        wkwkbtn.isSelected = false
        
        print(sender.titleLabel)
        
        sender.isSelected = true
    }
    
    @IBAction func changePercent(_ sender: UISlider) {
        let dataPercent = Int(sender.value * 100)
       
        let roundedNum = (sender.value * 100).rounded() / 100
        
        split.changeTip(roundedNum)
        percentTip.text = "\(dataPercent) %"
    }
    
    @IBAction func changeStepper(_ sender: UIStepper) {
        
        let dataStepper = Int(sender.value)
        
        split.changePerson(Int(sender.value))
        textStepper.text = String(dataStepper)
    }
    
    @IBAction func btnMethodClicked(_ sender: UIButton) {

        btnCash.isSelected = false
        btnCredit.isSelected = false
        btnWallet.isSelected = false
        sender.isSelected = true

        if sender.titleLabel?.text == "Cash" {
            split.changeMethod(.cash)
        }else if sender.titleLabel?.text == "Credit Card" {
            split.changeMethod(.card)
        }else {
            split.changeMethod(.wallet)
        }
    }
    
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.resultPaid = split.getResult()
            destinationVC.resultTip = String("\(split.getTip() * 100)%")
            destinationVC.resultMethod = split.getMethod().rawValue
            destinationVC.resultPerson = split.getPerson()
        }
    }
    
}

