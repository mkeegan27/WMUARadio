//
//  ThirdViewController.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var daysOfWeek: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    
    var selInd: Int = 0;
    
    //    var schedSun: [show] = [show0, show1, show2, show3, show4, show5, show6, show7, show8, show9, show10, show11]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.tblView.registerClass(TableCell.self, forCellReuseIdentifier: "TableCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        if(daysOfWeek.selectedSegmentIndex == 0){
            selInd = 0
        }
        else if(daysOfWeek.selectedSegmentIndex == 1){
            selInd = 1
        }
        else if(daysOfWeek.selectedSegmentIndex == 2){
            selInd = 2
        }
        else if(daysOfWeek.selectedSegmentIndex == 3){
            selInd = 3
        }
        else if(daysOfWeek.selectedSegmentIndex == 4){
            selInd = 4
        }
        else if(daysOfWeek.selectedSegmentIndex == 5){
            selInd = 5
        }
        else if(daysOfWeek.selectedSegmentIndex == 6){
            selInd = 6
        }
        tblView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var ret: Int = 0
        
        if(selInd == 0){
            ret = schedMgrSun.shows.count
        }
        else if(selInd == 1){
            ret = schedMgrMon.shows.count
        }
        else if(selInd == 2){
            ret = schedMgrTues.shows.count
        }
        else if(selInd == 3){
            ret = schedMgrWed.shows.count
        }
        else if(selInd == 4){
            ret = schedMgrThurs.shows.count
        }
        else if(selInd == 5){
            ret = schedMgrFri.shows.count
        }
        else if(selInd == 6){
            ret = schedMgrSat.shows.count
        }
        
        return ret
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! TableCell
        var tasker: show = schedMgrSun.shows[0];
        if(selInd == 0){
            tasker = schedMgrSun.shows[indexPath.row]
        }
        else if(selInd == 1){
            tasker = schedMgrMon.shows[indexPath.row]
        }
        else if(selInd == 2){
            tasker = schedMgrTues.shows[indexPath.row]
        }
        else if(selInd == 3){
            tasker = schedMgrWed.shows[indexPath.row]
        }
        else if(selInd == 4){
            tasker = schedMgrThurs.shows[indexPath.row]
        }
        else if(selInd == 5){
            tasker = schedMgrFri.shows[indexPath.row]
        }
        else if(selInd == 6){
            tasker = schedMgrSat.shows[indexPath.row]
        }
        
        cell.changeShow(tasker.name)
        cell.changeDJ(tasker.host)
        cell.changeTime(tasker.time)

        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
