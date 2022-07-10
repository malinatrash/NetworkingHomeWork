//
//  ViewController.swift
//  NetworkingHomeWork
//
//  Created by Pavel Naumov on 08.07.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var factTypeSegmentedControl: UISegmentedControl!
    
    private var fact: Fact?
    
    var link: String {
        getLink()
    }
    
    private func getLink() -> String {
        switch factTypeSegmentedControl.selectedSegmentIndex {
        case 0: return "http://numbersapi.com/\(numberTextField.text ?? "0")/math?json"
        default: return "http://numbersapi.com/\(numberTextField.text ?? "0")/trivia?json"
        }
    }
    
    private func showFactInfoAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func getFactButtonPressed() {
        NetworkManager.shared.fetchDataWithAlamofire(link: link) { result in
            switch result {
            case .success(let fact):
                self.fact = fact
            case .failure(let error):
                print(error)
            }
            self.showFactInfoAlert(title: "Interesting fact", message: self.fact?.text ?? "")
        }
        
    }
}


