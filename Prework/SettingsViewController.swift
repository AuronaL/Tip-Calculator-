//
//  SettingsViewController.swift
//  Prework
//
//  Created by Aurona Liu on 8/1/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    let state = "switch"
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var oneField: UITextField!
    @IBOutlet weak var customizeLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 15.0
        
        if (UserDefaults.standard.bool(forKey: "switch")) {
                    Settings.sharedInstance.backgroundColor = UIColor.black
                    Settings.sharedInstance.textColor = UIColor.white
                }
        else {
                    Settings.sharedInstance.backgroundColor = UIColor.white
                    Settings.sharedInstance.textColor = UIColor.black
                }
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor
        darkModeLabel.textColor = Settings.sharedInstance.textColor
        customizeLabel.textColor = Settings.sharedInstance.textColor
        oneLabel.textColor = Settings.sharedInstance.textColor
        
        if (UserDefaults.standard.bool(forKey: state)) {
                    switchButton.isOn = true
                } else {
                    switchButton.isOn = false
                }
    }
    
    /* Switch button **/
    @IBAction func switchMode(_ sender: Any) {
        UserDefaults.standard.set(switchButton.isOn, forKey: state)
                if (switchButton.isOn) {
                    Settings.sharedInstance.backgroundColor = UIColor.black
                    Settings.sharedInstance.textColor = UIColor.white
                    
                }
                else{
                    Settings.sharedInstance.backgroundColor = UIColor.white
                    Settings.sharedInstance.textColor = UIColor.black
                }
        
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor
        darkModeLabel.textColor = Settings.sharedInstance.textColor
        customizeLabel.textColor = Settings.sharedInstance.textColor
        oneLabel.textColor = Settings.sharedInstance.textColor
    }
    
    /* Save button **/
    @IBAction func save(_ sender: Any) {
        var rateText:String = oneField.text!
                 rateText=rateText.replacingOccurrences(of:"%", with: "")
        let rate  = Double(rateText) ?? 0
        Settings.sharedInstance.custom = rate/100
        //dismiss(animated: true, completion: nil)
       }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor
        darkModeLabel.textColor = Settings.sharedInstance.textColor
        customizeLabel.textColor = Settings.sharedInstance.textColor
        oneLabel.textColor = Settings.sharedInstance.textColor
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
