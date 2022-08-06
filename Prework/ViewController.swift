//
//  ViewController.swift
//  Prework
//
//  Created by Aurona Liu on 7/31/22.
//

import UIKit

class ViewController: UIViewController{


    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var split: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var personalTotal: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var splitControl: UIStepper!
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var personpay: UILabel!
    
    var tipPercentages = [Settings.sharedInstance.custom,0.15,0.18,0.2,0.25]
    
    //override functions
    override func viewDidLoad() {
        super.viewDidLoad()
//        let name = String(format: "c%.f%",Settings.sharedInstance.custom*100)
//        if(Settings.sharedInstance.custom != 0.0) {
//            tipControl.setTitle(name, forSegmentAt: 0)
//
//        }
        // Do any additional setup after loading the view
        //round the button corner
        calculateButton.layer.cornerRadius = 15.0
        self.title = "Tip Calculator"
         switchColorAndCustom()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        switchColorAndCustom()
        billAmountText.becomeFirstResponder()
        }

    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    @IBAction func stepperChange(_ sender: UIStepper) {
        people.text = String(Int(sender.value))
    }
    /*
        calculate Tip button is called
        it retrieves the tip and adds to the total
     **/
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount from text field input
         let bill = Double(billAmountText.text!) ?? 0
        
        //get total tip by mutiplying tip * tip percentage
         let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
                
                let total = bill + tip
                let numOfPeo = Double(people.text!) ?? 0
                let personTotal = total / numOfPeo

                //update Tip Amount label
                tipAmount.text = String(format: "$%.2f",tip)
                //update total amount
                totalLabel.text = String(format: "$%.2f",total)
                personpay.text = String(format: "$%.2f",personTotal )
    }
    

    
    func switchColorAndCustom() {
        //segment
        // renew tipPercentages
            tipPercentages = [Settings.sharedInstance.custom,0.15,0.18,0.2,0.25]
            let name = String(format: "c%.f%",Settings.sharedInstance.custom*100)
            if(Settings.sharedInstance.custom != 0.0) {
            tipControl.setTitle(name, forSegmentAt: 0)
            }
        //color
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor
        billAmount.textColor = Settings.sharedInstance.textColor
        total.textColor = Settings.sharedInstance.textColor
        totalLabel.textColor = Settings.sharedInstance.textColor
        tipLabel.textColor = Settings.sharedInstance.textColor
        tipControl.tintColor = Settings.sharedInstance.textColor
        tipAmount.textColor = Settings.sharedInstance.textColor
        
        personpay.textColor = Settings.sharedInstance.textColor
        split.textColor = Settings.sharedInstance.textColor
        personalTotal.textColor = Settings.sharedInstance.textColor
        people.textColor = Settings.sharedInstance.textColor
        }

}

