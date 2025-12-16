//
//  ViewController.swift
//  Counter
//
//  Created by user on 16.12.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Значение счётчика:"
        counterLabel.text = "0"
        historyText.text = "История изменений:\n"
    }
    
    private func addHistoryMsg(_ message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        
        let stringToAdd = dateString + " " + message + "\n"
        let oldText = historyText.text ?? ""
        historyText.text = oldText + stringToAdd
        
        let range = NSMakeRange(historyText.text.count - 1, 1)
        historyText.scrollRangeToVisible(range)
    }
    
    private func changeCountText() {
        counterLabel.text = String(counter)
    }
    
    @IBAction func plusButtonTouch(_ sender: Any) {
        counter += 1
        changeCountText()
        addHistoryMsg("Значение изменено на +1")
    }
    
    @IBAction func minusButtonTouch(_ sender: Any) {
        counter = counter <= 0 ? 0 : counter - 1
        changeCountText()
        addHistoryMsg("Значение изменено на -1")
    }
    
    @IBAction func resetButtonTouch(_ sender: Any) {
        counter = 0
        changeCountText()
        addHistoryMsg("Значение сброшено")
    }
}

