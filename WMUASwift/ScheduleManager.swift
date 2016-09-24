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

struct Show{
    var host = "test host"
    var name = "test name"
    var day = "test day"
    var time = "test time"
    
    init(host: String, name: String, day: String, time:String){
        self.host = host
        self.name = name
        self.day = day
        self.time = time
    }
}




class ScheduleManager: NSObject{
    var shows = [Show]()
    
    func addS(_ newShow: Show){
        shows.append(newShow)
    }

}
