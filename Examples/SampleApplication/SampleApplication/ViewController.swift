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

// MARK: - Action section

    // Sample actions for control audio playback

    @IBAction private func startButtonTouched() {
        LwayveSDK.sharedSDK.play()
    }

    @IBAction private func pauseButtonTouched() {
        LwayveSDK.sharedSDK.pause()
    }

    @IBAction private func stopButtonTouched() {
        LwayveSDK.sharedSDK.stop()
    }

    @IBAction private func rewindButtonTouched() {
        LwayveSDK.sharedSDK.rewind()
    }

    @IBAction private func skipButtonTouched() {
        LwayveSDK.sharedSDK.skip()
    }

    // Sample actions for control context

    @IBAction private func addTagsButtonTouched(_ sender: UIButton) {
        LwayveSDK.sharedSDK.add(userLikes: ["#Drinks", "#Danica", "#Johnson-Jimmie", "#Car43", "#Car45", "#Car50"])
    }

    @IBAction private func addLocationsButtonTouched(_ sender: UIButton) {
        LwayveSDK.sharedSDK.add(locations: ["#bar1", "#bar2"])
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClipActionsSegue" {
            segue.destination.popoverPresentationController?.delegate = self
        }
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
