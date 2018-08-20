//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Jacob Sokora on 8/20/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import UIKit

class TTSViewController: UIViewController {

    @IBOutlet weak var textInputView: UITextView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    let synth = SpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textInputView.layer.borderColor = UIColor.lightGray.cgColor
        textInputView.layer.cornerRadius = 0.5
        textInputView.layer.borderWidth = 1
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let filler = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [filler, doneButton]
        textInputView.inputAccessoryView = keyboardToolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard() {
        textInputView.endEditing(true)
        textInputView.resignFirstResponder()
    }

    @IBAction func clearText(_ sender: Any) {
        synth.reset()
        textInputView.text = ""
    }
    
    @IBAction func play(_ sender: Any) {
        if let text = textInputView.text, text.count != 0 {
            synth.speek(text)
        } else {
            let alert = UIAlertController(title: "Invalid input", message: "Please enter some text to be synthesized", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        synth.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        synth.reset()
    }
}

