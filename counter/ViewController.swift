//
//  ViewController.swift
//  counter
//
//  Created by Daniil on 02.04.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var clickAmount = 0
    var logs = ""
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var logField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        logField.text = "None data"
    }

    func updateCounterLabel() {
        logField.text = logs
        counterLabel.text = "Значение счетчика: \(String(clickAmount))"
    }
    
    func dateTime() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "[yyyy-MM-dd // HH:mm:ss]"
        let formattedDate = formatter.string(from: now)

        return formattedDate
    }

    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if clickAmount > 0 {
            clickAmount -= 1
            logs += "\(dateTime()): -1\n"
            updateCounterLabel()
        }
        else {
            logs += "\(dateTime()): попытка уменьшить значение счётчика ниже 0\n"
            updateCounterLabel()
        }
    }

    @IBAction func plusButtonTapped(_ sender: UIButton) {
        clickAmount += 1
        logs += "\(dateTime()): +1\n"
        updateCounterLabel()
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clickAmount = 0
        logs += "\(dateTime()): значение сброшено\n"
        updateCounterLabel()
    }
}
