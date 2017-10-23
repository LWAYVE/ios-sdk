//
//  MainViewController.swift
//  PlaybackControlSampleApp
//
//  Created by Anatoli Tauhen on 6/27/17.
//  Copyright © 2017 Lixar. All rights reserved.
//

import UIKit
import LwayveSDK

class MainViewController: UIViewController {

    // Place UIView as placeholder in the interface builder.
    // Set it class as PlaybackControlView and module as LwayveSDK.
    // Bind it with outlet.
    @IBOutlet fileprivate var playbackControl: LwayvePlaybackControlView!

    @IBOutlet fileprivate var scrollView: UIScrollView!
    @IBOutlet fileprivate var debugInfoLabel: UILabel!

    @IBOutlet fileprivate var userLikesTextField: UITextField!
    @IBOutlet fileprivate var locationsTextField: UITextField!

    fileprivate var debugInfoDataSource: DebugInfoDataSource!

    fileprivate var lwayveSDK: LwayveSDK {
        return LwayveSDK.sharedSDK
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set using LwayveSDK instance for controlling playback
        self.playbackControl.lwayveSDK = self.lwayveSDK

        // Configure visual parameters of the ticker above playback control
        self.playbackControl.trackNameBackgroundColor = UIColor.orange
        self.playbackControl.trackNameTextColor = UIColor.white
        self.playbackControl.trackNameFont = UIFont.boldSystemFont(ofSize: 18)
        self.playbackControl.defaultTrackName = "LWAYVE"

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.tapGestureTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)

        // Configure the data source for the LWAYVE SDK debug information.
        self.configureDebugInfoDatasource()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var edgeInsets = UIEdgeInsets.zero
        edgeInsets.top = self.playbackControl.frame.size.height

        self.scrollView.contentInset = edgeInsets
        self.scrollView.scrollIndicatorInsets = edgeInsets
    }

// MARK: - Private section

    private func configureDebugInfoDatasource() {
        self.debugInfoDataSource = DebugInfoDataSource()

        // Handle LWAYVE debug information updates
        self.debugInfoDataSource.descriptionHandler = { [weak self] info in
            guard let strongSelf = self else { return }

            strongSelf.debugInfoLabel.text = info
        }
    }

    private func contextFromString(_ string: String) -> [String] {
        let flatString = string.replacingOccurrences(of: " ", with: "")
        let components = flatString.components(separatedBy: ",")

        return components
    }

    private func endEditingTags() {
        self.userLikesTextField.resignFirstResponder()
        self.locationsTextField.resignFirstResponder()
    }

// MARK: - Action section

    @IBAction private func refreshButtonTouched(sender: UIButton) {
        // Pass the entered tags to the LWAYVE SDK.
        // Setup locations context with the text forom locationsTextField
        if let locationsString = self.locationsTextField.text {
            let locationsContext = self.contextFromString(locationsString)
            self.lwayveSDK.set(locations: locationsContext)
        }

        // Setup user likes context with the text forom userLikesTextField
        if let userLikesString = self.userLikesTextField.text {
            let userLikesContext = self.contextFromString(userLikesString)
            self.lwayveSDK.set(userLikes: userLikesContext)
        }

        self.endEditingTags()

        self.lwayveSDK.refreshPlaylist()
    }

    @objc
    private func tapGestureTapped(_ sender: UITapGestureRecognizer?) {
        self.endEditingTags()
    }
}
