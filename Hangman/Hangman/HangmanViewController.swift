//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var phraseBlanks: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet var guessButton: UIView!
    var correct = ""
    var discovered = Set<String>()
    var correctLetters = Set<String>()
    
    var numWrong = 0
    @IBOutlet weak var numWrongGuesses: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        correct = phrase
        print(phrase)
        discovered.insert(" ")
        
        let nospaces = phrase.replacingOccurrences(of: " ", with: "")
        for letter in Array(nospaces.characters) {
            correctLetters.insert(String(letter))
            print(letter)
        }
        placeBlanks(phrase: phrase)
        guessTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func placeBlanks(phrase: String) {
        var blanks: String = ""
        for c in 0..<phrase.characters.count {
            let letter = String(phrase[phrase.index(phrase.startIndex, offsetBy: c)])
            if discovered.contains(letter) {
                blanks += letter
            } else {
                blanks += "_ "
            }
        }
        phraseBlanks.text = blanks
    }

    @IBAction func checkGuess(_ sender: Any) {
        if let letter: String = guessTextField.text {
            if correctLetters.contains(letter) {
                discovered.insert(letter)
                placeBlanks(phrase: correct)
            } else {
                numWrong += 1
                numWrongGuesses.text = String(numWrong)
            }
        }
        guessTextField.text = ""
    }


    @IBAction func tapA(_ sender: UIButton) {
        guessTextField.text = "A"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapB(_ sender: UIButton) {
        guessTextField.text = "B"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapC(_ sender: UIButton) {
        guessTextField.text = "C"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapD(_ sender: UIButton) {
        guessTextField.text = "D"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapE(_ sender: UIButton) {
        guessTextField.text = "E"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapF(_ sender: UIButton) {
        guessTextField.text = "F"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapG(_ sender: UIButton) {
        guessTextField.text = "G"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapH(_ sender: UIButton) {
        guessTextField.text = "H"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapI(_ sender: UIButton) {
        guessTextField.text = "I"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapJ(_ sender: UIButton) {
        guessTextField.text = "J"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapK(_ sender: UIButton) {
        guessTextField.text = "K"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapL(_ sender: UIButton) {
        guessTextField.text = "L"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapM(_ sender: UIButton) {
        guessTextField.text = "M"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapN(_ sender: UIButton) {
        guessTextField.text = "N"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapO(_ sender: UIButton) {
        guessTextField.text = "O"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapP(_ sender: UIButton) {
        guessTextField.text = "P"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    @IBAction func tapQ(_ sender: UIButton) {
        guessTextField.text = "Q"
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
