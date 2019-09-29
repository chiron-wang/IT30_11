//
//  HelloViewController.swift
//  HelloWorld
//
//  Created by mikewang on 2019/9/29.
//  Copyright © 2019 mikewang. All rights reserved.
//

import UIKit
import AVFoundation

class HelloViewController: UIViewController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        sayHello()
    }
    
    // MARK: Other Method
    
    private func sayHello() {
        let content = "Hello, World."
        let speechUtterance = AVSpeechUtterance(string: content)
        // language: BCP-47, ref: https://gist.github.com/vitoziv/9108407
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        // 說話的音量 0.0 - 1.0 (小聲到大聲)
        speechUtterance.volume = 1.0
        // 說話的速度
        speechUtterance.rate = 0.5
        // 音調的高低 0.5 - 2.0 (低到高)
        speechUtterance.pitchMultiplier = 1
        // 本句話說之前的延遲時間
        //speechUtterance.preUtteranceDelay = 0
        // 本句話說完到說下一句話之前的延遲時間
        //speechUtterance.postUtteranceDelay = 0
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
}
