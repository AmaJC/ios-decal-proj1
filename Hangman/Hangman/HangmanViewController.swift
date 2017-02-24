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
    @IBOutlet var guessButton: UIView!
    var correct = ""
    var discovered = Set<String>()
    var correctLetters = Set<String>()
    var numCorrect = 0
    var numWrong = 0
    @IBOutlet weak var numWrongGuesses: UILabel!
    lazy var pressed: [UIButton] = []
    lazy var alphabet: [UIButton] = [self.A, self.B, self.C, self.D, self.E, self.F, self.G, self.H, self.I, self.J, self.K, self.L, self.M, self.N, self.O, self.P, self.Q, self.R, self.S, self.T, self.U, self.V, self.W, self.X, self.Y, self.Z]
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
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
        numCorrect = correctLetters.count
        placeBlanks(phrase: phrase)
        imageDisplay.image = UIImage(named: "hangman1.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func restartGame() {
        correct = ""
        discovered = Set<String>()
        correctLetters = Set<String>()
        numCorrect = 0
        numWrong = 0
        numWrongGuesses.text = "0"
        for button in pressed {
            button.isEnabled = true
            button.setTitleColor(self.view.tintColor, for: .normal)
        }
        pressed = []
        for letter in alphabet {
            letter.isEnabled = true
        }
        viewDidLoad()
    }
    
    func preventAdditionalGuesses() {
        for letter in alphabet {
            letter.isEnabled = false
            letter.setTitleColor(self.view.tintColor, for: .normal)
        }
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
    
    func checkGuess(letter: String) {
        if correctLetters.contains(letter) {
            discovered.insert(letter)
            placeBlanks(phrase: correct)
            numCorrect -= 1
            if numCorrect <= 0 {
                let alert = UIAlertController(title: "You saved Oski!", message: "You won the game! Would you like to start another game?", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: {action in self.restartGame()}))
                alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {action in self.preventAdditionalGuesses()}))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            numWrong += 1
            numWrongGuesses.text = String(numWrong)
            switch numWrong {
                case 1:
                    imageDisplay.image = UIImage(named: "oski1.png")
                case 2:
                    imageDisplay.image = UIImage(named: "oski2.png")
                case 3:
                    imageDisplay.image = UIImage(named: "oski3.png")
                case 4:
                    imageDisplay.image = UIImage(named: "oski4.png")
                case 5:
                    imageDisplay.image = UIImage(named: "oski5.png")
                case 6:
                    imageDisplay.image = UIImage(named: "oski6.png")
            default:
                break
            }
            if numWrong >= 6 {
                let alert = UIAlertController(title: "You failed to save Oski.", message: "You made too many wrong guesses. Would you like to start a new game?", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: {action in self.restartGame()}))
                alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {action in self.preventAdditionalGuesses()}))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        restartGame()
    }
    @IBAction func giveUpButtonPressed(_ sender: UIButton) {
        phraseBlanks.text = correct
        preventAdditionalGuesses()
    }

    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var N: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var P: UIButton!
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var W: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var Z: UIButton!
    
    
    @IBAction func tapA(_ sender: UIButton) {
        checkGuess(letter: "A")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapB(_ sender: UIButton) {
        checkGuess(letter: "B")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapC(_ sender: UIButton) {
        checkGuess(letter: "C")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapD(_ sender: UIButton) {
        checkGuess(letter: "D")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapE(_ sender: UIButton) {
        checkGuess(letter: "E")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapF(_ sender: UIButton) {
        checkGuess(letter: "F")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapG(_ sender: UIButton) {
        checkGuess(letter: "G")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapH(_ sender: UIButton) {
        checkGuess(letter: "H")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapI(_ sender: UIButton) {
        checkGuess(letter: "I")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapJ(_ sender: UIButton) {
        checkGuess(letter: "J")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapK(_ sender: UIButton) {
        checkGuess(letter: "K")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapL(_ sender: UIButton) {
        checkGuess(letter: "L")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapM(_ sender: UIButton) {
        checkGuess(letter: "M")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapN(_ sender: UIButton) {
        checkGuess(letter: "N")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapO(_ sender: UIButton) {
        checkGuess(letter: "O")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapP(_ sender: UIButton) {
        checkGuess(letter: "P")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapQ(_ sender: UIButton) {
        checkGuess(letter: "Q")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapR(_ sender: UIButton) {
        checkGuess(letter: "R")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapS(_ sender: UIButton) {
        checkGuess(letter: "S")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapT(_ sender: UIButton) {
        checkGuess(letter: "T")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapU(_ sender: UIButton) {
        checkGuess(letter: "U")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapV(_ sender: UIButton) {
        checkGuess(letter: "V")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapW(_ sender: UIButton) {
        checkGuess(letter: "W")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapX(_ sender: UIButton) {
        checkGuess(letter: "X")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapY(_ sender: UIButton) {
        checkGuess(letter: "Y")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
    }
    @IBAction func tapZ(_ sender: UIButton) {
        checkGuess(letter: "Z")
        sender.setTitleColor(UIColor.gray, for: .normal)
        sender.isEnabled = false
        pressed += [sender]
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
