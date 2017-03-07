//
//  SecondViewController.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblV: UITableView!
   
    @IBOutlet weak var refreshButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = NSURL (string: "http://www.wmua.org");
//        let requestObj = NSURLRequest(URL: url!);
//        webView.loadRequest(requestObj);
        if(isInternetAvailable()){
        makeTab()
        }
        else{
            playMgr.plays.removeAll()
            playMgr.addP(play(timeD: "", title: "No internet connection", artist: "", album: ""))
            tblV.reloadData()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    func makeTab(){
        
        
        playMgr.plays.removeAll()
        
        let myURLString = "http://www.wmua.org"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        var pageInfo: String = "something's wrong, but not caught";
        do{
            pageInfo = try String(contentsOf: myURL)
        }catch{
            print("something's wrong!")
        }
        //print(pageInfo)
        
        //there are 10 recent plays
        
        //AT THIS POINT IN CODE,
        //PAGEINFO VAR HOLDS THE HTML OF THE WEBPAGE
        
        let cons: Scanner = Scanner(string: pageInfo)
        var numScanned: Int = 0;
        var timeP: NSString?
        var songName: NSString?
        var artistName: NSString?
        var albumName: NSString?
        let charset: CharacterSet = CharacterSet(charactersIn: "<td>")
        
        
        while(numScanned < 10){
            //this is where I scan the information from the website HTML
            //if the code of the website changes, this will break
            cons.scanUpTo("<td>", into: nil)
            cons.scanCharacters(from: charset, into: nil)
            cons.scanUpTo("</td>", into: &timeP)
            
            cons.scanUpTo("<td>", into: nil)
            cons.scanCharacters(from: charset, into: nil)
            cons.scanUpTo("</td>", into: &artistName)
            
            
            cons.scanUpTo("<td>", into: nil)
            cons.scanCharacters(from: charset, into: nil)
            cons.scanUpTo("</td>", into: &songName)
            
            cons.scanUpTo("<td>", into: nil)
            cons.scanCharacters(from: charset, into: nil)
            cons.scanUpTo("</td>", into: &albumName)
            
            
            let timePlayed = timeP?.substring(from: 0)
            var songN = songName?.substring(from: 0)
            var artistN = artistName?.substring(from: 0)
            var albumN = albumName?.substring(from: 0)
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
            
            songN = songN?.replacingOccurrences(of: "&#39;", with: "'");
            artistN = artistN?.replacingOccurrences(of: "&#39;", with: "'");
            albumN = albumN?.replacingOccurrences(of: "&#39;", with: "'");
            
            songN = songN?.replacingOccurrences(of: "&amp;", with: "&");
            artistN = artistN?.replacingOccurrences(of: "&amp;", with: "&");
            albumN = albumN?.replacingOccurrences(of: "&amp;", with: "&");
        
            songN = songN?.replacingOccurrences(of: "&quot;", with: "\"");
            artistN = artistN?.replacingOccurrences(of: "&quot;", with: "\"");
            albumN = albumN?.replacingOccurrences(of: "&quot;", with: "\"");
            
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playMgr.plays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayCell", for: indexPath) as! PlayCell
        let tasker: play = playMgr.plays[(indexPath as NSIndexPath).row]
        cell.changeSong(tasker.title)
        cell.changeTime(tasker.timeD)
        cell.changeAlbum(tasker.album)
        cell.changeArtist(tasker.artist)
        
        return cell
    }

    @IBAction func refreshPressed(_ sender: UIBarButtonItem) {
        if(isInternetAvailable()){
        makeTab()
        }
        else{
            playMgr.plays.removeAll()
            playMgr.addP(play(timeD: "", title: "No internet connection", artist: "", album: ""))
        }
        tblV.reloadData()
    }

}

