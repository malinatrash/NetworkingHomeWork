//
//  ViewController.swift
//  NetworkingHomeWork
//
//  Created by Pavel Naumov on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var factTypeSegmentedControl: UISegmentedControl!
    
    private var link: String {
        "http://numbersapi.com/\(numberTextField.text ?? "0")/\(defineType())?json"
    }
    
    private func defineType() -> String {
        switch factTypeSegmentedControl.selectedSegmentIndex {
        case 0: return "math"
        default: return "trivia"
        }
    }
    
    @IBAction func getFactButtonPressed() {
        
    }
}

