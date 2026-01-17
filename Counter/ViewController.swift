//
//  ViewController.swift
//  Counter
//
//  Created by Mobile Device on 15.01.2026.
//

import UIKit

class ViewController: UIViewController {

    private var value: Int = 0

    @IBOutlet private weak var valueCounterLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var historyTestView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.tintColor = UIColor.red
        closeButton.tintColor = UIColor.black
        historyTestView.text = "История изменений:"
        historyTestView.isScrollEnabled = true
        historyTestView.isUserInteractionEnabled = true
        historyTestView.alwaysBounceVertical = true
        historyTestView.showsVerticalScrollIndicator = true
    }

    private func addDateToTextView() -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: currentDate)
    }

    @IBAction private func plusButtonDidTap(_ sender: Any) {
        value += 1
        valueCounterLabel.text = "\("Значение счётчика: ")\(value)"
        historyTestView.text.append("\n\(addDateToTextView())\(" Значение изменено на +1")")
    }

    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if value > 0 {
            value -= 1
            valueCounterLabel.text = "\("Значение счётчика: ")\(value)"
            historyTestView.text.append("\n\(addDateToTextView())\(" Значение изменено на -1")")
        } else {
            historyTestView.text.append("\n\(addDateToTextView())\(" Попытка уменьшить значение счётчика ниже 0")")
        }
    }

    @IBAction private func countDidResetTap(_ sender: Any) {
        value = 0
        valueCounterLabel.text = "\("Значение счётчика: ")\(value)"
        historyTestView.text.append("\n\(addDateToTextView())\(" Значение сброшено")")
    }
}
