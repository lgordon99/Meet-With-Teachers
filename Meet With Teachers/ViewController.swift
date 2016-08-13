//
//  ViewController.swift
//  Meet With Teachers
//
//  Created by Lucia Gordon on 8/10/16.
//  Copyright © 2016 Lucia Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var daySlider: UISlider!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var periodSlider: UISlider!
    @IBOutlet weak var teacherPicker: UIPickerView!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var teachers: [String] = ["Ms. Lubman", "Mr. Lindow", "Ms. Spalding", "Ms. McCutcheon", "Mr. McClintock", "Mr. Tarbath", "Ms. LiCalsi", "Doctor Henry", "Mr. Raisher"]
    var day = "A"
    var period = "1"
    var time = "A1"
    var teacher = "Ms. Lubman"
    let lubman: [String] = ["A2", "A4", "A5", "A7", "B1", "B5", "B7", "C4", "D1", "D2", "D4", "D5", "D7", "E1", "E2", "E5", "F2", "F7", "G1", "G2", "G5", "G6", "H2", "H5", "I1", "I5", "I7", "J4", "J7"]
    let lindow: [String] = ["A6", "A7", "B1", "B2", "B4", "C2", "C4", "C6", "D6", "D7", "E6", "E7", "F1", "F2", "F4", "F5", "G5", "G6", "G7", "H1", "H7", "I1", "I2", "I4", "J2", "J4", "J6"]
    let spalding: [String] = ["A1", "A7", "B1", "B2", "B4", "B6", "C4", "C5", "C6", "C7", "D1", "D7", "E4", "E6", "E7", "F2", "F4", "F5", "F6", "F7", "G6", "G7", "H1", "H4", "I1", "I2", "I4", "I6", "J4", "J5", "J6", "J7"]
    let mcCutcheon: [String] = ["A6", "A7", "B1", "B2", "B4", "C2", "C4", "C5", "C6", "C7", "D1", "D6", "D7", "E6", "E7", "F1", "F2", "F4", "F5", "F7", "G5", "G6", "G7", "H1", "H7", "I1", "I2", "I4", "J2", "J4", "J5", "J6", "J7"]
    let mcClintock: [String] = ["A2", "A5", "A6", "A7", "B2", "B4", "B7", "C2", "C4", "C6", "D1", "D2", "D5", "D6", "E2", "E7", "F1", "F2", "F4", "F5", "F7", "G4", "G5", "H1", "H2", "H5", "H7", "I1", "I2", "I4", "J1", "J2", "J6"]
    let tarbath: [String] = ["A1", "A2", "A5", "A7", "B2", "B5", "B6", "C1", "C5", "C7", "D1", "D2", "D5", "E1", "E4", "E5", "E6", "F4", "F5", "F6", "F7", "G1", "G4", "G7", "H2", "H4", "H6", "I2", "I5", "I6", "J1", "J5", "J7"]
    let liCalsi: [String] = ["A1", "A2", "A4", "A5", "A6", "B5", "B6", "B7", "C1", "C2", "C5", "C6", "C7", "D1", "D2", "D4", "D5", "D6", "E1", "E2", "E4", "E5", "F1", "F4", "F5", "F6", "F7", "G1", "G2", "G4", "G5", "H2", "H4", "H5", "H6", "H7", "I4", "I5", "I6", "I7", "J1", "J2", "J5", "J7"]
    let henry: [String] = ["A4", "A6", "B1", "B4", "B5", "C1", "C2", "C6", "C7", "D4", "D6", "D7", "E1", "E5", "E6", "E7", "F1", "F5", "G1", "G2", "G5", "G6", "G7", "H1", "H6", "H7", "I4", "I5", "I7", "J2", "J4", "J5", "J6"]
    let raisher: [String] = ["A4", "A5", "A7", "B1", "B4", "B6", "C1", "C5", "D4", "D5", "D6", "D7", "E4", "E5", "E6", "F2", "F5", "F7", "G2", "G4", "G5", "G6", "G7", "H4", "H5", "H6", "I4", "I7", "J1", "J2", "J4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.teacherPicker.delegate = self
        self.teacherPicker.dataSource = self
        availabilityLabel.hidden = true
        resetButton.backgroundColor = UIColor.clearColor()
        resetButton.layer.cornerRadius = 20
        resetButton.layer.borderWidth = 4
        resetButton.layer.borderColor = UIColor.blueColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func resetButtonTapped(sender: AnyObject) {
        dayLabel.text = "Day: A"
        daySlider.setValue(1, animated: true)
        periodLabel.text = "Period: 1"
        periodSlider.setValue(1, animated: true)
        availabilityLabel.hidden = true
        day = "A"
        period = "1"
        time = "A1"
    }
    
    @IBAction func daySliderChanged(sender: AnyObject) {
        let currentValue = Int(daySlider.value)
        let numbersToLetters: [Int: String] = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H", 9: "I", 10: "J"]
        dayLabel.text = "Day: \(numbersToLetters[currentValue]!)"
        day = numbersToLetters[currentValue]!
        updateText()
    }
    
    @IBAction func periodSliderChanged(sender: AnyObject) {
        let currentValue = Int(periodSlider.value)
        periodLabel.text = "Period: \(currentValue)"
        period = String(currentValue)
        updateText()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teachers.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teachers[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: teachers[row], attributes: [NSFontAttributeName:UIFont(name: "Avenir", size: 15.0)!,NSForegroundColorAttributeName:UIColor.init(red: 0, green: 255, blue: 255, alpha: 1.0)])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        teacher = teachers[row]
        updateText()
    }
    
    func updateText () {
        availabilityLabel.hidden = false
        availabilityLabel.text = "Availability"
        time = day + period
        
        if teacher == "Ms. Lubman" {
            for item in lubman {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Mr. Lindow" {
            for item in lindow {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Ms. Spalding" {
            for item in spalding {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Ms. McCutcheon" {
            for item in mcCutcheon {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Mr. McClintock" {
            for item in mcClintock {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Mr. Tarbath" {
            for item in tarbath {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Ms. LiCalsi" {
            for item in liCalsi {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Doctor Henry" {
            for item in henry {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        } else if teacher == "Mr. Raisher" {
            for item in raisher {
                if time == item {
                    availabilityLabel.text = "\(teacher) is available to meet \(time)!"
                    break
                } else {
                    availabilityLabel.text = "\(teacher) is not available \(time). Click \"Reset\" to try another period."
                }
            }
        }
    }
}