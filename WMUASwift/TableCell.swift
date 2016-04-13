//
//  TableCell.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    

    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var djLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        djLabel?.adjustsFontSizeToFitWidth = true
        // Initialization code
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        //this func not necessary but i'll keep it
    }

    func changeShow(showName: String){
        showLabel.text = showName
    }
    func changeDJ(djName: String){
        djLabel.text = djName
    }
    func changeTime(timeName: String){
        timeLabel.text = timeName
    }
}