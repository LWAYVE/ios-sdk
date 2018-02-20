//
//  ClipContextualActionsViewController.swift
//  SampleApplication
//
//  Created by Maksym Malyhin on 2018-02-13.
//  Copyright © 2018 Lixar I.T. Inc. All rights reserved.
//

import UIKit
import LwayveSDK

class ClipContextualActionsViewController: UITableViewController {
    private var lwayveSDK: LwayveSDK {
        return LwayveSDK.sharedSDK
    }
    var clipActions: [ClipAction] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // We need to subscribe for the playback events to make sure we update actions when the current track changes.
        self.lwayveSDK.add(audioControlDelegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadActions()
    }

    // MARK: - UITableViewDataSource/Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clipActions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ClipActionCell else {
            return UITableViewCell()
        }

        let action = self.clipActions[indexPath.row]

        cell.iconImageView?.image = action.image
        cell.titleLabel?.text = action.title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = self.clipActions[indexPath.row]

        self.dismiss(animated: true) {
            self.lwayveSDK.performClipAction(action, completion: {})
        }
    }

    // MARK: - Clip actions
    private var currentTrack: AudioTrack? {
        return self.lwayveSDK.audioQueue.first
    }

    fileprivate func loadActions() {
        guard let currentTrack = self.currentTrack else {
            self.clipActions = []

            return
        }

        let currentTrackId = currentTrack.identifier

        self.lwayveSDK.loadActions(actions: currentTrack.actions) { [weak self] (actions) in
            guard
                let sSelf = self,
                let currentTrack = sSelf.currentTrack,
                currentTrackId == currentTrack.identifier
                else {
                    return
            }

            sSelf.clipActions = actions
        }
    }
}

extension ClipContextualActionsViewController: AudioControlDelegate {
    func lwayveSDK(didStartLoadingTrack track: AudioTrack) {
        self.loadActions()
    }

    func lwayveSDK(didStartPlayingTrack track: AudioTrack) {
        self.loadActions()
    }

    func lwayveSDK(didFailPlayingTrack track: AudioTrack, withError error: Error) {
        self.loadActions()
    }

    func lwayveSDK(didEndPlayingTrack track: AudioTrack) {
        self.loadActions()
    }
}

class ClipActionCell: UITableViewCell {
    @IBOutlet fileprivate var titleLabel: UILabel!
    @IBOutlet fileprivate var iconImageView: UIImageView!
}
