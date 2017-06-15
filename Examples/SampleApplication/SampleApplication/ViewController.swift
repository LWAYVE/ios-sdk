//
//  ViewController.swift
//  SampleApplication
//
//  Created by Anatoli Tauhen on 6/12/17.
//  Copyright © 2017 Lixar I.T. Inc. All rights reserved.
//

import UIKit
import LwayveSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - Action section

    // Sample actions for control audio playback

    @IBAction func startButtonTouched() {
        LwayveSDK.sharedSDK.play()
    }

    @IBAction func pauseButtonTouched() {
        LwayveSDK.sharedSDK.pause()
    }

    @IBAction func stopButtonTouched() {
        LwayveSDK.sharedSDK.stop()
    }

    @IBAction func rewindButtonTouched() {
        LwayveSDK.sharedSDK.rewind()
    }

    @IBAction func skipButtonTouched() {
        LwayveSDK.sharedSDK.skip()
    }

    // Sample actions for control context
    
    @IBAction func addTagsButtonTouched(_ sender: UIButton) {
        LwayveSDK.sharedSDK.add(userLikes: ["#Drinks", "#Danica", "#Johnson-Jimmie", "#Car43", "#Car45", "#Car50"])
    }

    @IBAction func addLocationsButtonTouched(_ sender: UIButton) {
        LwayveSDK.sharedSDK.add(locations: ["#bar1", "#bar2"])
    }
}

