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
    var correctLetterLocation = [String: [Int]]()
    
    var numWrong = 0
    @IBOutlet weak var numWrongGuesses: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        var phrase: String = hangmanPhrases.getRandomPhrase()
        correct = phrase
        print(phrase)
        discovered.insert(" ")
        
        //
        phrase = phrase.replacingOccurrences(of: " ", with: "")
        for c in 0..<phrase.characters.count {
            let letter = String(phrase[phrase.index(phrase.startIndex, offsetBy: c)])
            if let locations = correctLetterLocation[letter] {
                correctLetterLocation[letter] = locations + [c]
            } else {
                correctLetterLocation[letter] = [c]
            }
        }
        //
        
        placeBlanks(phrase: phrase)
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
    
//    func placeBlanks(phrase: String) {
//        let words: [String] = phrase.components(separatedBy: " ")
//        var blanks: String = ""
//        for word in words {
//            for _ in 0..<word.characters.count {
//                blanks += "_ "
//            }
//            blanks += " "
//        }
//        phraseBlanks.text = blanks
//    }
    
//    func replaceBlanks(locations: [Int], letter : String) {
//        var blanks = phraseBlanks.text!
//        for loc in locations {
//            var count = loc
//            var changeLoc = 0;
//            for c in 0..<blanks.characters.count {
//                if count == 0 {
//                    break
//                } else if blanks[blanks.index(blanks.startIndex, offsetBy: c)] == "_"{
//                    count -= 1
//                    changeLoc = c
//                }
//            }
//            blanks = blanks.substring(to: changeLoc) + letter + blanks.substring(from: changeLoc + 1)
//        }
//    }

    @IBAction func checkGuess(_ sender: Any) {
        if let letter: String = guessTextField.text {
            if let _ = correctLetterLocation[letter] {
                discovered.insert(letter)
                placeBlanks(phrase: correct)
//                replaceBlanks(locations : locations, letter: letter)
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
