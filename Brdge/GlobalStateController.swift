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
}
