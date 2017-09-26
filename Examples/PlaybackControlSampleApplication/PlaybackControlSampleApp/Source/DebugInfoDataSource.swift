//
//  DebugInfoDatasource.swift
//  LwayveiOSHostApp
//
//  Created by Maksym Malyhin on 2017-05-30.
//  Copyright © 2017 Lixar Inc. All rights reserved.
//

import Foundation
import LwayveSDK

typealias DescriptionHandlerBlock = (String) -> Void

// This class gathers information from the LWAYVE SDK to display for debugging purposes.
class DebugInfoDataSource {

    // Set handler for receiving debug info updates
    var descriptionHandler: DescriptionHandlerBlock? {
        didSet {
            // Update the description string with the current debug information.
            self.notifyOnUpdate()
        }
    }

    fileprivate let lwayveSDK: LwayveSDK

    init(withLwayveSDK lwayveSDK: LwayveSDK = LwayveSDK.sharedSDK) {
        self.lwayveSDK = lwayveSDK

        // Set data source as listener for playback and playlist events delegate
        self.lwayveSDK.add(audioControlDelegate: self)
        self.lwayveSDK.playlistEventsListener = self
    }

    fileprivate func notifyOnUpdate() {
        if let handler = self.descriptionHandler {
            handler(self.lwayveSDK.debugStateDescription)
        }
    }
}

// MARK: - PlayListEventsListener

extension DebugInfoDataSource: PlayListEventsListener {
    func playlistDidUpdate(_ playlist: Playlist?, forUserContext userContext: UserContext) {
        self.notifyOnUpdate()
    }
}

// MARK: - AudioControlDelegate

extension DebugInfoDataSource: AudioControlDelegate {

    func lwayveSDK(didStartPlayingTrack track: AudioTrack) {
        self.notifyOnUpdate()
    }

    func lwayveSDK(didPauseTrack track: AudioTrack) {
        self.notifyOnUpdate()
    }

    func lwayveSDK(didEndPlayingTrack track: AudioTrack) {
        self.notifyOnUpdate()
    }

    func lwayveSDK(didFailPlayingTrack track: AudioTrack, withError error: Error) {
        self.notifyOnUpdate()
    }
}

// MARK: - LwayveSDK Private Extension

extension LwayveSDK {

    private static let userContextDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    fileprivate var debugStateDescription: String {
        // Create the string containing the gathered debug information.
        return
            "\nPlayed tracks history: [\n" +
            "\(self.debugHistoricalItemsDescription)]\n" +

            "\nAudio queue: [\n" +
            "\(self.debugAudioQueueDescription)]\n" +

            "\nGenerated Playlist: [\n" +
            "\(self.debugPlaylistDescription)]\n" +

            "\nUser context: \n" +
            "\(self.debugUserDescription)"
    }

    fileprivate var debugUserDescription: String {
        guard let userContext = self.currentUserContext else { return "" }

        // Create a string containing debug information for the currentUserContext.
        let time = type(of: self).userContextDateFormatter.string(from: userContext.time)
        let tags = userContext.tags.map({ $0.name }).joined(separator: ", ")
        let locations = userContext.locations.map({ $0.name }).joined(separator: ", ")
        let playedIds = self.playedTracksIds.joined(separator: ", ")

        return "time: \(time)\n" +
        "locations: [\(locations)]\n" +
        "tags: [\(tags)]\n" +
        "played ids: [\(playedIds)]\n" +
        "language: \(self.language.iso639_1())"
    }

    fileprivate var debugAudioQueueDescription: String {
        // Create a string containing the identifiers of the queued tracks.
        let trackDescriptions = self.audioQueue.map({ $0.debugScreenDescription() })
        return trackDescriptions.joined(separator: ",\n")
    }

    fileprivate var debugHistoricalItemsDescription: String {
        // Create a string containing the identifiers of the played tracks.
        let trackIds = self.playedTracksHistory.map({ $0.debugScreenDescription() })
        return trackIds.joined(separator: ",\n")
    }

    fileprivate var debugPlaylistDescription: String {
        // Create a string containing information about the generated playlist.
        guard let generatedPlaylist = self.generatedPlaylist else { return "" }
        let itemDescriptions = generatedPlaylist.items.map({ $0.debugScreenDescription() })

        var nextTimeUpdateDescription = "next update time:"
        if let nextEventTime = generatedPlaylist.nextEventTime {
            nextTimeUpdateDescription += type(of: self).userContextDateFormatter.string(from: nextEventTime)
        } else {
            nextTimeUpdateDescription += "-"
        }

        return itemDescriptions.joined(separator: ",\n") + "\n" + nextTimeUpdateDescription
    }
}

extension AudioTrack {
    fileprivate func debugScreenDescription() -> String {
        return "id: \(self.identifier), name: \(self.name)"
    }
}

extension PlaylistItem {
    fileprivate func debugScreenDescription() -> String {
        return "id: \(self.identifier), name: \(self.name)"
    }
}
