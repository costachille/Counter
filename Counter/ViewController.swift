//
//  ViewController.swift
//  Counter
//
//  Created by Konstantin on 01.11.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabelView: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var plusChangeButton: UIButton!
    @IBOutlet weak var minusChangeButton: UIButton!
    @IBOutlet weak var resetCountButton: UIButton!
    
    private var counter = 0
    
    // начальное состояние
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabelView.text = "Значение счётчика: \(counter)"
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:"
    }

    // обновление счетчика
    private func updateCounter() {
        counterLabelView.text = "Значение счётчика: \(counter)"
    }
    
    // добавление истории с датой и временем
    private func addHistoryTextView(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "[dd.MM.yyyy HH:mm:ss]"
        let date = formatter.string(from: Date())
        
        historyTextView.text += "\n\(date): \(message)"
    }

    // кнопка уменьшения
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateCounter()
            addHistoryTextView("Значение изменено на -1")
        } else {
            addHistoryTextView("Попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    // кнопка увеличения
    @IBAction func plusButtonDidTap(_ sender: Any) {
        counter += 1
        updateCounter()
        addHistoryTextView("Значение изменено на +1")
    }
    
    // кнопка сброса
    @IBAction func resetButtonDidTap(_ sender: Any) {
        counter = 0
        updateCounter()
        addHistoryTextView("Значение сброшено")
    }
}
