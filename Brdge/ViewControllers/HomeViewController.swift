//
//  FirstViewController.swift
//  Brdge
//
//  Created by Andre Campbell on 3/21/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit
import MediaPlayer

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    var media: [MPMediaItem] = []
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var gsController: GlobalStateController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // View color setting
        view.backgroundColor = UIColor.lightGray
        // Table view details
        myTableView.backgroundColor = UIColor.lightGray
        myTableView.separatorColor = UIColor.blue
        myTableView.delegate = self
        myTableView.dataSource = self
}
    override func viewDidAppear(_ animated: Bool) {
        if (gsController!.appleMusicLoggedIn || gsController!.spotifyLoggedIn) {
            print("here")
            indexChanged()
        }
        else {
            myTableView.reloadData()
        }
    }
    
    @IBAction func indexChanged() {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            gsController?.media = MPMediaQuery.songs().items!
            myTableView.reloadData()
            NSLog("Songs selected")
            
        //show popular view
        case 1:
            gsController?.media = MPMediaQuery.artists().items!
            myTableView.reloadData()
            print("artist selected")
        //show history view
        case 2:
            gsController?.media = MPMediaQuery.albums().items!
            NSLog("Albums selected")
            myTableView.reloadData()
        case 3:
            gsController?.media =  Array(Set(MPMediaQuery.genres().items!))
            NSLog("Genres selected")
            myTableView.reloadData()
        default:
            NSLog("Nothing selected/Error")
            myTableView.reloadData()
            break;
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (gsController!.appleMusicLoggedIn || gsController!.spotifyLoggedIn) {
            return (gsController?.media.count)!
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            cell.captionLabel.text = gsController?.media[indexPath.row].title
        case 1:
            cell.captionLabel.text = gsController?.media[indexPath.row].albumArtist
        case 2:
            cell.captionLabel.text = gsController?.media[indexPath.row].albumTitle
        case 3:
            cell.captionLabel.text = gsController?.media[indexPath.row].genre
        default:
            NSLog("Nothing selected/Error")
            break;
        }
        cell.artistLabel.text = gsController?.media[indexPath.row].albumArtist
        cell.albumImageView.image = gsController?.media[indexPath.row].artwork?.image(at: CGSize(width: 50, height: 50))
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gsController?.queueTrack(index: indexPath.row)
        gsController?.mediaPlayer.prepareToPlay()
        gsController?.mediaPlayer.play()
        gsController?.isPlaying = true
        tabBarController?.selectedIndex = 2
    }

}

