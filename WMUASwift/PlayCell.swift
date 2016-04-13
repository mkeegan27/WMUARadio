//
//  PlayCell.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/31/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class PlayCell: UITableViewCell {
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        //this func not necessary but i'll keep it
    }
    
    func changeSong(songName: String){
        songLabel.text = songName
    }
    func changeArtist(artistName: String){
        artistLabel.text = "artist: " + artistName
    }
    func changeAlbum(albumName: String){
        albumLabel.text = "album: " + albumName
    }
    func changeTime(timeName: String){
        timeLabel.text = timeName
    }
    
}
