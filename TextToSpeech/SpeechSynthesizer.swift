//
//  SpeechSynthesizer.swift
//  TextToSpeech
//
//  Created by Jacob Sokora on 8/20/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import Foundation
import AVFoundation

class SpeechSynthesizer {
    
    let synth = AVSpeechSynthesizer()
    
    func speek(_ text: String) {
        if synth.isPaused {
            synth.continueSpeaking()
        }
        let utterance = AVSpeechUtterance(string: text)
        synth.speak(utterance)
    }
    
    func pause() {
        if synth.isPaused {
            return
        }
        synth.pauseSpeaking(at: .word)
    }
    
    func reset() {
        synth.stopSpeaking(at: .immediate)
    }
}
