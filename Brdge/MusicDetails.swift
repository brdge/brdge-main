//
//  MusicDetails.swift
//  Brdge
//
//  Created by Andre Campbell on 4/14/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import Foundation
import MediaPlayer

class SongDetails {
    
    var artwork: MPMediaItemArtwork
    var songName: String
    var albumName: String
    var artist: String
    
    init(songName: String, albumName: String,
         artist: String, artwork: MPMediaItemArtwork) {
        self.songName = songName
        self.albumName = albumName
        self.artist = artist
        self.artwork = artwork
    }

    
}

