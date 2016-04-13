//
//  ScheduleManager.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/31/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

var playMgr: PlaysManager = PlaysManager()

struct play{
    var timeD = "test host"
    var title = "test name"
    var artist = "test day"
    var album = "test time"
}




class PlaysManager: NSObject{
    var plays = [play]()
    
    func addP(newPlay: play){
        plays.append(newPlay)
    }
    
}
