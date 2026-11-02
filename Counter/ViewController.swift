//
//  ViewController.swift
//  Counter
//
//  Created by Konstantin on 01.11.2026.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var counterLabelView: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    // MARK: - Properties
    
    private var counter = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabelView.text = "Значение счётчика: \(counter)"
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:"
    }

    // MARK: - IBActions
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        guard counter > 0 else {
            addHistoryEntry("Попытка уменьшить значение счётчика ниже 0")
            return
        }
        counter -= 1
        updateCounter()
        addHistoryEntry("Значение изменено на -1")
    }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        counter += 1
        updateCounter()
        addHistoryEntry("Значение изменено на +1")
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        counter = 0
        updateCounter()
        addHistoryEntry("Значение сброшено")
    }
    
    // MARK: - Private Methods
    
    private func updateCounter() {
        counterLabelView.text = "Значение счётчика: \(counter)"
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "[dd.MM.yyyy HH:mm:ss]"
        return formatter
    }()
    
    private func addHistoryEntry(_ message: String) {
        let date = dateFormatter.string(from: Date())
        historyTextView.text += "\n\(date): \(message)"
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let range = NSRange(
            location: historyTextView.text.count - 1,
            length: 1
        )
        historyTextView.scrollRangeToVisible(range)
    }
}
