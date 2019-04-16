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
        myTableView.delegate = self
        myTableView.dataSource = self
        indexChanged()
        print("view loaded")
        
        // myTableView.reloadData()
        //getAlbumTitles()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func indexChanged() {
        print(gsController)
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
            break;
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (gsController?.media.count)!
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var song = (gsController?.media[indexPath.row])!
        gsController?.currentSong = song
        var collection = MPMediaItemCollection.init(items: [song])
        // Sending data to the NowPlayingController
        gsController?.mediaPlayer.setQueue(with: collection)
        gsController?.mediaPlayer.play()
        tabBarController?.selectedIndex = 1
    }

}

