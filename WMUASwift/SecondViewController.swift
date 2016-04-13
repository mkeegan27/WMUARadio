//
//  SecondViewController.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblV: UITableView!
   
    @IBOutlet weak var refreshButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = NSURL (string: "http://www.wmua.org");
//        let requestObj = NSURLRequest(URL: url!);
//        webView.loadRequest(requestObj);
        makeTab()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeTab(){
        
        playMgr.plays.removeAll()
        
        let myURLString = "http://www.wmua.org"
        guard let myURL = NSURL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        var pageInfo: String = "something's wrong, but not caught";
        do{
            pageInfo = try String(contentsOfURL: myURL)
        }catch{
            print("something's wrong!")
        }
        //print(pageInfo)
        
        //there are 10 recent plays
        
        //AT THIS POINT IN CODE,
        //PAGEINFO VAR HOLDS THE HTML OF THE WEBPAGE
        
        let cons: NSScanner = NSScanner(string: pageInfo)
        var numScanned: Int = 0;
        var timeP: NSString?
        var songName: NSString?
        var artistName: NSString?
        var albumName: NSString?
        let charset: NSCharacterSet = NSCharacterSet(charactersInString: "<td>")
        
        
        while(numScanned < 10){
            //this is where I scan the information from the website HTML
            //if the code of the website changes, this will break
            cons.scanUpToString("<td>", intoString: nil)
            cons.scanCharactersFromSet(charset, intoString: nil)
            cons.scanUpToString("</td>", intoString: &timeP)
            
            cons.scanUpToString("<td>", intoString: nil)
            cons.scanCharactersFromSet(charset, intoString: nil)
            cons.scanUpToString("</td>", intoString: &artistName)
            
            
            cons.scanUpToString("<td>", intoString: nil)
            cons.scanCharactersFromSet(charset, intoString: nil)
            cons.scanUpToString("</td>", intoString: &songName)
            
            cons.scanUpToString("<td>", intoString: nil)
            cons.scanCharactersFromSet(charset, intoString: nil)
            cons.scanUpToString("</td>", intoString: &albumName)
            
            
            let timePlayed = timeP?.substringFromIndex(0)
            var songN = songName?.substringFromIndex(0)
            var artistN = artistName?.substringFromIndex(0)
            var albumN = albumName?.substringFromIndex(0)
            //            print(timePlayed!)
            //            print(artistN!)
            //            print(songName!)
            
            //            print(albumName!)
            
            //print(songN![(songN?.startIndex.advancedBy(0))!])
            /*
            var test: Int = 0;
            var save: Int = 0;
            for i in (songN?.characters)!{
                test += 1;
                if(i=="&"){
                    save = test;
                }
            }
            songN?.removeAtIndex(songN!.startIndex.advancedBy(save));
            songN?.removeAtIndex(songN!.startIndex.advancedBy(save+1));
            songN?.removeAtIndex(songN!.startIndex.advancedBy(save+2));
            songN?.removeAtIndex(songN!.startIndex.advancedBy(save+3));
            songN?.removeAtIndex(songN!.startIndex.advancedBy(save+4));
            */
            
            songN = songN?.stringByReplacingOccurrencesOfString("&#39;", withString: "'");
            artistN = artistN?.stringByReplacingOccurrencesOfString("&#39;", withString: "'");
            albumN = albumN?.stringByReplacingOccurrencesOfString("&#39;", withString: "'");
            
            songN = songN?.stringByReplacingOccurrencesOfString("&amp;", withString: "&");
            artistN = artistN?.stringByReplacingOccurrencesOfString("&amp;", withString: "&");
            albumN = albumN?.stringByReplacingOccurrencesOfString("&amp;", withString: "&");
        
            songN = songN?.stringByReplacingOccurrencesOfString("&quot;", withString: "\"");
            artistN = artistN?.stringByReplacingOccurrencesOfString("&quot;", withString: "\"");
            albumN = albumN?.stringByReplacingOccurrencesOfString("&quot;", withString: "\"");
            
            /*
            let apostropheSet: NSCharacterSet = NSCharacterSet(charactersInString: "&#39;");
            var timeRange: Range = timePlayed!.rangeOfCharacterFromSet(apostropheSet)!;
            //print(showRange.length);
            while(timeRange.count != 0){
                timePlayed = timePlayed?.stringByReplacingCharactersInRange(timeRange, withString: "'");
                timeRange = timePlayed!.rangeOfCharacterFromSet(apostropheSet)!;
            }
            
            var Artrange: Range = artistN!.rangeOfCharacterFromSet(apostropheSet)!;
            while(Artrange.count != 0){
                artistN = artistN?.stringByReplacingCharactersInRange(Artrange, withString: "'");
                Artrange = artistN!.rangeOfCharacterFromSet(apostropheSet)!;
            }
            
            var songR: Range = songN!.rangeOfCharacterFromSet(apostropheSet)!;
            while(songR.count != 0){
                songN = songN?.stringByReplacingCharactersInRange(songR, withString: "'");
                songR = songN!.rangeOfCharacterFromSet(apostropheSet)!;
            }
            
            var albR: Range = albumN!.rangeOfCharacterFromSet(apostropheSet)!;
            while(albR.count != 0){
                albumN = albumN?.stringByReplacingCharactersInRange(albR, withString: "'");
                albR = albumN!.rangeOfCharacterFromSet(apostropheSet)!;
            }
 */
            
            playMgr.addP(play(timeD: timePlayed!, title: songN!, artist: artistN!, album: albumN!))
            
            
            numScanned += 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playMgr.plays.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayCell", forIndexPath: indexPath) as! PlayCell
        let tasker: play = playMgr.plays[indexPath.row]
        cell.changeSong(tasker.title)
        cell.changeTime(tasker.timeD)
        cell.changeAlbum(tasker.album)
        cell.changeArtist(tasker.artist)
        
        return cell
    }

    @IBAction func refreshPressed(sender: UIBarButtonItem) {
        makeTab()
        tblV.reloadData()
    }

}

