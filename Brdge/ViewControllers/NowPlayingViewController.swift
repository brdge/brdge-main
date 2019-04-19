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
    
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var elapsedLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gsController?.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(NowPlayingViewController.timerFired(_:)), userInfo: nil, repeats: true)
        gsController?.timer.tolerance = 0.1
        view.addSubview(gsController!.volumeControl)
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @objc func timerFired(_:AnyObject) {
        if (gsController?.isPlaying)! {
            let trackDuration = gsController?.currentSong.playbackDuration
            
            let trackElapsed = gsController?.mediaPlayer.currentPlaybackTime
            let trackDurationMinutes = Int(trackDuration! / 60)
            
            let trackDurationSeconds = Int(trackDuration!) % 60
        
            let trackElapsedMinutes = Int(trackElapsed! / 60)
            
            let trackElapsedSeconds = Int(trackElapsed!) % 60
            
            if trackElapsedSeconds < 10 {
                elapsedLabel.text = " \(trackElapsedMinutes):0\(trackElapsedSeconds)"
            } else {
                elapsedLabel.text = " \(trackElapsedMinutes):\(trackElapsedSeconds)"
            }
            let trackRemaining = Int(trackDuration!) - Int(trackElapsed!)
            
            let trackRemainingMinutes = trackRemaining / 60
            
            let trackRemainingSeconds = trackRemaining % 60
            
            if trackRemainingSeconds < 10 {
                remainingLabel.text = " \(trackRemainingMinutes):0\(trackRemainingSeconds)"
            } else {
                remainingLabel.text = " \(trackRemainingMinutes):\(trackRemainingSeconds)"
            }
            durationSlider.maximumValue = Float(trackDuration!)
            durationSlider.value = Float(trackElapsed!)
        }
        
    }
    @IBAction func durationSliderChanged(_ sender: Any) {
        gsController?.mediaPlayer.currentPlaybackTime = TimeInterval(durationSlider.value)
    }
    @IBAction func backwardSkipTapped(_ sender: Any) {
            var index = gsController?.trackIndex ?? 0
            index = index - 1
            if index < 0 {
                index = ((gsController?.media.count)! - 1) ?? 0
            }
            gsController?.queueTrack(index: index)
            gsController?.mediaPlayer.play()
            updateDisplay()
    }
    @IBAction func forwardSkipTapped(_ sender: Any) {
            var index = gsController?.trackIndex ?? 0
            index = index + 1
            if index >= (gsController?.media.count)! {
                index =  0
            }
            gsController?.queueTrack(index: index)
            gsController?.mediaPlayer.play()
            updateDisplay()
        
    }
    @IBAction func PausePlayTapped(_ sender: Any) {
        let tabBar = tabBarController as! BaseTabBarController
        if (gsController?.isPlaying)! {
            print("here")
            gsController?.mediaPlayer.pause()
            gsController?.isPlaying = false
            pause_play_button.setImage(UIImage(named: "icons8-play-50.png"), for: UIControl.State.normal)
        }
        else {
            gsController?.mediaPlayer.play()
            gsController?.isPlaying = true
            pause_play_button.setImage(UIImage(named: "icons8-pause-50.png"), for: UIControl.State.normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()

    }
    func updateDisplay() {
        if (gsController?.isPlaying)! {
        albumLabel.text = gsController?.currentSong.albumTitle as! String
        artistLabel.text = gsController?.currentSong.artist as! String
        songTitleLabel.text = gsController?.currentSong.title as! String
        albumArtwork.image = gsController?.currentSong.artwork!.image(at: CGSize(width: 500, height: 500))
        gsController?.isPlaying = true
            gsController?.mediaPlayer.play()
        }
        else {
            NSLog("No songs playing")
        }
    }
}

