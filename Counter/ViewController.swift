//
//  ViewController.swift
//  Counter
//
//  Created by user on 16.12.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Значение счётчика:"
        counterLabel.text = "0"
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:\n"
    }
    
    private func addHistoryMsg(_ message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        
        let stringToAdd = dateString + " " + message + "\n"
        let oldText = historyTextView.text ?? ""
        historyTextView.text = oldText + stringToAdd
        
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    private func changeCountText() {
        counterLabel.text = String(counter)
    }
    
    @IBAction private func plusButtonTouch(_ sender: Any) {
        counter += 1
        changeCountText()
        addHistoryMsg("Значение изменено на +1")
    }
    
    @IBAction private func minusButtonTouch(_ sender: Any) {
        if counter <= 0 {
            addHistoryMsg("попытка уменьшить значение счётчика ниже 0")
        } else {
            counter -= 1
            changeCountText()
            addHistoryMsg("Значение изменено на -1")
        }
    }
    
    @IBAction private func resetButtonTouch(_ sender: Any) {
        counter = 0
        changeCountText()
        addHistoryMsg("Значение сброшено")
    }
}

