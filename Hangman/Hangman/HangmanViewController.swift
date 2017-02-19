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
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var guessed: [String] = []
    var correctLetters = Set<String>()
    
    var numWrong = 0
    @IBOutlet weak var numWrongGuesses: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        print(phrase)
        for c in 0..<phrase.characters.count {
            correctLetters.insert(String(phrase[phrase.index(phrase.startIndex, offsetBy: c)]))
        }
        placeBlanks(phrase: phrase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func placeBlanks(phrase: String) {
        let words: [String] = phrase.components(separatedBy: " ")
        var blanks: String = ""
        for word in words {
            for _ in 0..<word.characters.count {
                blanks += "_ "
            }
            blanks += " "
        }
        phraseBlanks.text = blanks
    }

    @IBAction func checkGuess(_ sender: Any) {
        if let letter: String = guessTextField.text {
            if (correctLetters.contains(letter)) {
                
            } else {
                numWrong += 1
                numWrongGuesses.text = String(numWrong)
            }
        }
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
