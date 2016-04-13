//
//  ScheduleManager.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

var schedMgrSun: ScheduleManager = ScheduleManager()
var schedMgrMon: ScheduleManager = ScheduleManager()
var schedMgrTues: ScheduleManager = ScheduleManager()
var schedMgrWed: ScheduleManager = ScheduleManager()
var schedMgrThurs: ScheduleManager = ScheduleManager()
var schedMgrFri: ScheduleManager = ScheduleManager()
var schedMgrSat: ScheduleManager = ScheduleManager()

struct show{
    var host = "test host"
    var name = "test name"
    var day = "test day"
    var time = "test time"
}




class ScheduleManager: NSObject{
    var shows = [show]()
    
    func addS(newShow: show){
        shows.append(newShow)
    }

}
