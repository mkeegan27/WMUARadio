//
//  PlayCell.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/31/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class PlayCell: UITableViewCell {
    
    @IBOutlet weak var songLabel: MarqueeLabel!
    @IBOutlet weak var artistLabel: MarqueeLabel!
    @IBOutlet weak var albumLabel: MarqueeLabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        //this func not necessary but i'll keep it
    }
    
    func changeSong(_ songName: String){
        songLabel.text = songName
        songLabel.type = .continuous
        songLabel.speed = .rate(70)
        songLabel.fadeLength = 80.0
        songLabel.labelWillBeginScroll()
    }
    func changeArtist(_ artistName: String){
        artistLabel.text = artistName
        artistLabel.type = .continuous
        artistLabel.speed = .rate(70)
        artistLabel.fadeLength = 80.0
        artistLabel.labelWillBeginScroll()
    }
    func changeAlbum(_ albumName: String){
        albumLabel.text = albumName
        albumLabel.type = .continuous
        albumLabel.speed = .rate(70)
        albumLabel.fadeLength = 80.0
        albumLabel.labelWillBeginScroll()

    }
    func changeTime(_ timeName: String){
        timeLabel.text = timeName
    }
    
}
