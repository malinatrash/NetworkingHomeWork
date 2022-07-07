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
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func getFactButtonPressed() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let fact = try JSONDecoder().decode(Fact.self, from: data)
                print(fact)
                self.showFactInfoAlert(title: "Interesting fact!", message: fact.text ?? "")
            } catch let error {
                self.showFactInfoAlert(title: "Error", message: "Some Error")
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

