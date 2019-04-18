//
//  GlobalState.swift
//  Brdge
//
//  Created by Andre Campbell on 4/15/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import Foundation
import MediaPlayer

class GlobalStateController {
    var isPlaying = false
    let mediaPlayer = MPMusicPlayerController.systemMusicPlayer
    var media: [MPMediaItem] = []
    var currentSong: MPMediaItem!
    var trackIndex = 0
    
    func queueTrack(index: Int) {
        trackIndex = abs(index % media.count)
        if  trackIndex >= media.count {
            print("Error")
        }
        else {
            currentSong = media[trackIndex]
            
            mediaPlayer.setQueue(with: MPMediaItemCollection.init(items: [currentSong]))
        }
        
        
        
    }
}
