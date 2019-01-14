//
//  ViewController.swift
//  ThreeLetterWord
//
//  Created by Jacob Smith on 1/8/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLetterLabel: UILabel!
    @IBOutlet var labels: [UILabel]!
    let alphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var blankView: UIView!
    
    var counter: Int = 0
    var currentLetter: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getAndSetLetters()
        
        
    }

    @IBAction func whenTapped(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: stackView)
        
        let selectedPointOnBlankView = sender.location(in: blankView)
        
        for label in labels {
            if label.frame.contains(selectedPoint) {
                label.text = currentLetter
            }
        }
        counter += 1
        checkIfTwentyFive()
        getAndSetLetters()
        
        
    }
    
    func getAndSetLetters() {
        currentLetter = alphabet[counter]
        currentLetterLabel.text = currentLetter
    }
    
    func checkIfTwentyFive() {
        if counter == 26 {
            counter = 0
            resetCounter()
        } else {
            return
        }
    }
    
    func resetCounter () -> Int {
        let alert = UIAlertController(title: "Resetting Letter", message: nil, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (arctic) in
            for label in self.labels {
                label.text = "?"
            }
        }
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        
        return 0
    }
    
    
    
}

