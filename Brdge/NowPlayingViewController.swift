//
//  SecondViewController.swift
//  Brdge
//
//  Created by Andre Campbell on 3/21/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    @IBOutlet weak var albumArtwork: UIImageView!
    @IBOutlet weak var forward_skip_button: UIButton!
    @IBOutlet weak var backward_skip_button: UIButton!
    @IBOutlet weak var pause_play_button: UIButton!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    var gsController: GlobalStateController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func PausePlayTapped(_ sender: Any) {
        let tabBar = tabBarController as! BaseTabBarController
        if (gsController?.isPlaying)! {
            print("here")
            gsController?.mediaPlayer.pause()
            gsController?.isPlaying = false
            pause_play_button.setBackgroundImage(UIImage(named: "icons8-play-50.png"), for: UIControl.State.normal)
        }
        else {
            gsController?.mediaPlayer.play()
            gsController?.isPlaying = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBar = tabBarController as! BaseTabBarController
        albumLabel.text = gsController?.currentSong.albumTitle as! String
        artistLabel.text = gsController?.currentSong.artist as! String
        songTitleLabel.text = gsController?.currentSong.title as! String
    //    albumArtwork.image = gsController?.currentSong.artwork?.image(at: CGSize)
        gsController?.isPlaying = true


    }
}

