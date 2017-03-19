//
//  FirstViewController.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import Foundation
import SystemConfiguration

class FirstViewController: UIViewController {

    @IBOutlet weak var listenLiveButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var DJLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
   // @IBOutlet weak var volSlide: UISlider!
    
    
    //var currentStation: RadioStation!
    let radioPlayer = Player.radio
    var playing: Bool = false
    
    class PlayerAv {
        var audioLink: String?
        var player: AVPlayer
        init(link: String) {
            self.audioLink = link
            self.player = AVPlayer(url: URL(string: link)!)
        }
    }
    var myPlayer = PlayerAv(link: "http://ice7.securenetsystems.net/WMUA?&playSessionID=E6DB23BD-AC18-1366-1EF37CF471BB2F09")
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenLiveButton.backgroundColor = UIColor.clear
        listenLiveButton.layer.cornerRadius = 5
        listenLiveButton.layer.borderWidth = 1
        listenLiveButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).cgColor
        stopButton.backgroundColor = UIColor.clear
        stopButton.layer.cornerRadius = 5
        stopButton.layer.borderWidth = 1
        stopButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).cgColor
        //setupPlayer()
        
        
        if(!isInternetAvailable()){
            listenLiveButton.isHidden = true
            stopButton.isHidden = true
        }
        else{
            UIApplication.shared.beginReceivingRemoteControlEvents()
        }
        
        
        //2017 SPRING SCHEDULE:
        
        //sunday shows:
        let show0: Show = Show(host: "Chuck Tunes", name: "God Play the Queen", day: "Sunday", time: "Midnight - 2am")
        let show1: Show = Show(host: "WMUA", name: "Automated Programming", day: "Sunday", time: "2am - 8am")
        //let show2: Show = Show(host: "Teagan McStay", name: "Paper This City", day: "Sunday", time: "4am - 6am")
        //let show3: Show = Show(host: "Ryan Arnold and James Coyle", name: "Magic Pig Detective", day: "Sunday", time: "6am - 8am")
        let show4: Show = Show(host: "DJ Hayley", name: "Extracts", day: "Sunday", time: "8am - 10am")
        let show5: Show = Show(host: "(The Arguably Human) Jamie Servox", name: "Steampunk Circus", day: "Sunday", time: "10am - noon")
        let show6: Show = Show(host: "Robert Hunt", name: "Let's Be Blunt", day: "Sunday", time: "noon - 2pm")
        let show7: Show = Show(host: "Heather", name: "The Witching Hour", day: "Sunday", time: "2pm - 4pm")
        let show8: Show = Show(host: "Caleb Coyne", name: "Just a Minuteman!", day: "Sunday", time: "4pm - 6pm")
        let show9: Show = Show(host: "Shifty Discs", name: "Freelance Poetry", day: "Sunday", time: "6pm - 8pm")
        let show10: Show = Show(host: "mattchi", name: "FiLL ThE VoiD", day: "Sunday", time: "8pm - midnight")
//        let show11: Show = Show(host: "Fred", name: "Mellifluous Sounds", day: "Sunday", time: "10pm - midnight")
        
            schedMgrSun.addS(show0)
            schedMgrSun.addS(show1)
            //schedMgrSun.addS(show2)
            //schedMgrSun.addS(show3)
            schedMgrSun.addS(show4)
            schedMgrSun.addS(show5)
            schedMgrSun.addS(show6)
            schedMgrSun.addS(show7)
            schedMgrSun.addS(show8)
            schedMgrSun.addS(show9)
            schedMgrSun.addS(show10)
//            schedMgrSun.addS(show11)
        
        //monday shows:
        let show12: Show = Show(host: "NICOLE", name: "Weather You Like It Or Not", day: "Monday", time: "Midnight - 2am")
        let show13: Show = Show(host: "WMUA", name: "Automated Programming", day: "Monday", time: "2am - 8am")
//        let show14: Show = Show(host: "", name: "The Sp3ctrum", day: "Monday", time: "4am - 6am")
//        let show15: Show = Show(host: "Morgan Hughes", name: "Life In Waves", day: "Monday", time: "6am - 8am")
        let show16: Show = Show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Monday", time: "8am - 9am")
        let show17: Show = Show(host: "WMUA", name: "Can't Stop Swinging", day: "Monday", time: "9am - 11am")
        let show18: Show = Show(host: "DJ Taylor", name: "Super Rich Kids", day: "Monday", time: "11:30am - 1pm")
        let show19: Show = Show(host: "Player 1", name: "A+B+START", day: "Monday", time: "1pm - 2:30pm")
        let show20: Show = Show(host: "Daisy", name: "Poetry A La Carte", day: "Monday", time: "5pm - 5:30pm")
//        let show21: Show = Show(host: "Alex Levitt", name: "SPORTSLINE", day: "Monday", time: "4:30pm - 5:30pm")
        let show22: Show = Show(host: "WMUA", name: "WMUA News", day: "Monday", time: "5:30pm - 6pm")
        let show23: Show = Show(host: "Quils", name: "Age of Exploration", day: "Monday", time: "6pm - 8pm")
        let show24: Show = Show(host: "Ken Maiuri", name: "Wiggly World", day: "Monday", time: "8pm - 10pm")
        let show25: Show = Show(host: "DJ Toasty Z", name: "Hip Hop Made Me Do It", day: "Monday", time: "10pm - midnight")
        
        schedMgrMon.addS(show12)
        schedMgrMon.addS(show13)
//        schedMgrMon.addS(show14)
//        schedMgrMon.addS(show15)
        schedMgrMon.addS(show16)
        schedMgrMon.addS(show17)
        schedMgrMon.addS(show18)
        schedMgrMon.addS(show19)
        schedMgrMon.addS(show20)
//        schedMgrMon.addS(show21)
        schedMgrMon.addS(show22)
        schedMgrMon.addS(show23)
        schedMgrMon.addS(show24)
        schedMgrMon.addS(show25)
        
        //tuesday shows:
        let show26: Show = Show(host: "DJ Qui Gon", name: "The Plimf", day: "Tuesday", time: "Midnight - 2am")
        let show27: Show = Show(host: "WMUA", name: "Automated Programming", day: "Tuesday", time: "2am - 8am")
//        let show28: Show = Show(host: "Various DJ's", name: "NEW 2 WMUA", day: "Tuesday", time: "4am - 6am")
//        let show29: Show = Show(host: "DJ Rick", name: "And Now For Something Completely Different", day: "Tuesday", time: "6am - 8am")
        let show30: Show = Show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Tuesday", time: "8am - 9am")
        let show31: Show = Show(host: "Jim Benitez", name: "Latin Jazz Now!", day: "Tuesday", time: "9am - 11am")
        let show32: Show = Show(host: "Spectrum", name: "The Spectrum", day: "Tuesday", time: "11:30am - 1pm")
        let show33: Show = Show(host: "Lisa L", name: "Caribbean Blend", day: "Tuesday", time: "2:30pm - 4:30pm")
//        let show34: Show = Show(host: "DJ Moonbeam", name: "Afternoon Snack", day: "Tuesday", time: "2:30pm - 4:30pm")
//        let show35: Show = Show(host: "Bob Reiser", name: "Chin Music", day: "Tuesday", time: "4:30pm - 5pm")
//        let show36: Show = Show(host: "Daisy Mathias", name: "Poetry A La Carte", day: "Tuesday", time: "5pm - 5:30pm")
        let show37: Show = Show(host: "WMUA", name: "WMUA News", day: "Tuesday", time: "5:30pm - 6pm")
        let show38: Show = Show(host: "Kara & DJ Pj's", name: "Anything but Country", day: "Tuesday", time: "6pm - 8pm")
        let show39: Show = Show(host: "Max", name: "Escapism", day: "Tuesday", time: "8pm - 10pm")
        let show40: Show = Show(host: "DJ Marky Marko", name: "Fresh Produce", day: "Tuesday", time: "10pm - midnight")
        
        schedMgrTues.addS(show26)
        schedMgrTues.addS(show27)
//        schedMgrTues.addS(show28)
//        schedMgrTues.addS(show29)
        schedMgrTues.addS(show30)
        schedMgrTues.addS(show31)
        schedMgrTues.addS(show32)
        schedMgrTues.addS(show33)
//        schedMgrTues.addS(show34)
//        schedMgrTues.addS(show35)
//        schedMgrTues.addS(show36)
        schedMgrTues.addS(show37)
        schedMgrTues.addS(show38)
        schedMgrTues.addS(show39)
        schedMgrTues.addS(show40)
        
        //wednesday shows:
        let show41: Show = Show(host: "James Leuci", name: "Iron Butterfly", day: "Wednesday", time: "Midnight - 2am")
        let show42: Show = Show(host: "Denny", name: "Indigestion", day: "Wednesday", time: "2am - 4am")
        let show43: Show = Show(host: "WMUA", name: "Automated Programming", day: "Wednesday", time: "4am - 6am")
        let show44: Show = Show(host: "Qui Gon & The DJ formerly known as \"The DJ formerly known as Dan\"", name: "Newton's Cradle", day: "Wednesday", time: "6am - 8am")
        let show45: Show = Show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Wednesday", time: "8am - 9am")
        let show46: Show = Show(host: "Dave Van Iderstine", name: "The Hard Bop Cafe", day: "Wednesday", time: "9am - 11am")
//        let show47: Show = Show(host: "PLAYER 1", name: "A+B+START", day: "Wednesday", time: "11am - 12:30pm")
        let show48: Show = Show(host: "Brian Bushard", name: "Jalapeño Business", day: "Wednesday", time: "1pm - 2:30pm")
        let show49: Show = Show(host: "DJ Princess", name: "Queer Queens", day: "Wednesday", time: "2:30pm - 4:30pm")
//        let show50: Show = Show(host: "Matthew Lieberman", name: "Hump Day Sports", day: "Wednesday", time: "4:30pm - 5:30pm")
        let show51: Show = Show(host: "WMUA", name: "WMUA News", day: "Wednesday", time: "5:30pm - 6pm")
        let show52: Show = Show(host: "DJ Diego", name: "The Funkdamentals", day: "Wednesday", time: "6pm - 8pm")
        let show53: Show = Show(host: "dj e-cig", name: "sad girls club", day: "Wednesday", time: "8pm - 10pm")
//        let show54: Show = Show(host: "Mike", name: "MoMA", day: "Wednesday", time: "10pm - midnight")
        
        schedMgrWed.addS(show41)
        schedMgrWed.addS(show42)
        schedMgrWed.addS(show43)
        schedMgrWed.addS(show44)
        schedMgrWed.addS(show45)
        schedMgrWed.addS(show46)
//        schedMgrWed.addS(show47)
        schedMgrWed.addS(show48)
        schedMgrWed.addS(show49)
//        schedMgrWed.addS(show50)
        schedMgrWed.addS(show51)
        schedMgrWed.addS(show52)
        schedMgrWed.addS(show53)
//        schedMgrWed.addS(show54)
        
        //thursday shows:
        let show55: Show = Show(host: "DJ The Alfbeast & DJ Tom Lee", name: "Pasta Party with Alfredo and Tomato", day: "Thursday", time: "Midnight - 2am")
//        let show56: Show = Show(host: "DJ Fan & DJ Liv", name: "Somethin' 4 The Soul", day: "Thursday", time: "2am - 4am")
//        let show57: Show = Show(host: "DJ Hammernose", name: "Won't Be Pathetic Forever", day: "Thursday", time: "4am - 6am")
        let show58: Show = Show(host: "Conor McMahon", name: "Conor's Corner", day: "Thursday", time: "6am - 8am")
        let show59: Show = Show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Thursday", time: "8am - 9am")
        let show60: Show = Show(host: "WMUA", name: "What's New?", day: "Thursday", time: "9am - 11am")
        let show61: Show = Show(host: "Braids", name: "The Kitchen", day: "Thursday", time: "1pm - 2:30pm")
//        let show62: Show = Show(host: "Peter Mcquillan", name: "Age of Exploration", day: "Thursday", time: "12:30pm - 2:30pm")
        let show63: Show = Show(host: "Katie and Dave", name: "Thursday's Rhythm & Blues Revue", day: "Thursday", time: "2:30pm - 4:30pm")
//        let show64: Show = Show(host: "Pio and Chelsie", name: "The Hour of Power", day: "Thursday", time: "4:30pm - 5:30pm")
        let show65: Show = Show(host: "WMUA", name: "WMUA News", day: "Thursday", time: "5:30pm - 6pm")
        let show66: Show = Show(host: "The DJs formerly known as \"The DJs formerly known as Morgan and Dan\"", name: "Cassettes on the Dash", day: "Thursday", time: "6pm - 8pm")
        let show67: Show = Show(host: "Mike Campbell", name: "Fuzz 'n Grime Two Point Oh!", day: "Thursday", time: "8pm - 10pm")
        let show68: Show = Show(host: "The Aux Cord", name: "Icy Ike and Naught Chewbacca", day: "Thursday", time: "10pm - midnight")
        
        schedMgrThurs.addS(show55)
//        schedMgrThurs.addS(show56)
//        schedMgrThurs.addS(show57)
        schedMgrThurs.addS(show58)
        schedMgrThurs.addS(show59)
        schedMgrThurs.addS(show60)
        schedMgrThurs.addS(show61)
//        schedMgrThurs.addS(show62)
        schedMgrThurs.addS(show63)
//        schedMgrThurs.addS(show64)
        schedMgrThurs.addS(show65)
        schedMgrThurs.addS(show66)
        schedMgrThurs.addS(show67)
        schedMgrThurs.addS(show68)

        //friday shows:
        let show69: Show = Show(host: "Purple B. Bryzen", name: "Xenocyx", day: "Friday", time: "Midnight - 2am")
//        let show70: Show = Show(host: "DJ Jerry and Sausguap", name: "Audio Odyssey", day: "Friday", time: "2am - 4am")
//        let show71: Show = Show(host: "J-Ho", name: "Movie News", day: "Friday", time: "4am - 6am")
        let show72: Show = Show(host: "DJ Jerry and Sausguap", name: "Audio Odyssey", day: "Friday", time: "6am - 8am")
        let show73: Show = Show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Friday", time: "8am - 9am")
        let show74: Show = Show(host: "DJ Diego and DJ Evan", name: "The Jazz Speakeasy", day: "Friday", time: "9am - 11am")
        let show75: Show = Show(host: "Matt Butler", name: "iCon (International Content)", day: "Friday", time: "11am - 1pm")
        let show76: Show = Show(host: "Liam Byrne", name: "Celtic Rock and Talk", day: "Friday", time: "1pm - 2:30pm")
        let show77: Show = Show(host: "Annie Day", name: "Ctrl+Alt+Delete", day: "Friday", time: "2:30pm - 4:30pm")
        let show78: Show = Show(host: "J-Ho", name: "Movie News", day: "Friday", time: "4:30pm - 5:30pm")
        let show79: Show = Show(host: "WMUA", name: "WMUA News", day: "Friday", time: "5:30pm - 6pm")
        let show80: Show = Show(host: "little metalmark and Monarch", name: "the butterfly boys", day: "Friday", time: "6pm - 8pm")
        let show81: Show = Show(host: "Carlie Catt and Ms. Frizzle", name: "Good Vibrations", day: "Friday", time: "8pm - 10pm")
        let show82: Show = Show(host: "Jasper", name: "No Half Guessing", day: "Friday", time: "10pm - midnight")
        
        schedMgrFri.addS(show69)
//        schedMgrFri.addS(show70)
//        schedMgrFri.addS(show71)
        schedMgrFri.addS(show72)
        schedMgrFri.addS(show73)
        schedMgrFri.addS(show74)
        schedMgrFri.addS(show75)
        schedMgrFri.addS(show76)
        schedMgrFri.addS(show77)
        schedMgrFri.addS(show78)
        schedMgrFri.addS(show79)
        schedMgrFri.addS(show80)
        schedMgrFri.addS(show81)
        schedMgrFri.addS(show82)
        
        //saturday shows:
        let show83: Show = Show(host: "toastytobs", name: "The Next Level", day: "Saturday", time: "Midnight - 2am")
//        let show84: Show = Show(host: "Stevie G", name: "The Weather Report", day: "Saturday", time: "2am - 4am")
//        let show85: Show = Show(host: "Liam O'Connor", name: "The Aux Cord", day: "Saturday", time: "4am - 6am")
        let show86: Show = Show(host: "Mitch Moskal", name: "Early Bird Show", day: "Saturday", time: "6am - 10am")
//        let show87: Show = Show(host: "DJ Astro", name: "Open Mind Radio", day: "Saturday", time: "8am - 10am")
        let show88: Show = Show(host: "DJ Spud", name: "peaches n dreams", day: "Saturday", time: "10am - noon")
        let show89: Show = Show(host: "Brooke", name: "Deadbeat Club", day: "Saturday", time: "noon - 2pm")
        let show90: Show = Show(host: "Dr. Mess", name: "The Breakdown Shakedown", day: "Saturday", time: "2pm - 4pm")
        let show91: Show = Show(host: "9", name: "Pop and Other Drugs", day: "Saturday", time: "4pm - 6pm")
        let show92: Show = Show(host: "lil kisses and DJ Compostable Cutie", name: "Evening Shuffle", day: "Saturday", time: "6pm - 8pm")
        let show93: Show = Show(host: "John", name: "Face for Radio", day: "Saturday", time: "8pm - 10pm")
        let show94: Show = Show(host: "Dallin", name: "core samples", day: "Saturday", time: "10pm - midnight")
        
        schedMgrSat.addS(show83)
//        schedMgrSat.addS(show84)
//        schedMgrSat.addS(show85)
        schedMgrSat.addS(show86)
//        schedMgrSat.addS(show87)
        schedMgrSat.addS(show88)
        schedMgrSat.addS(show89)
        schedMgrSat.addS(show90)
        schedMgrSat.addS(show91)
        schedMgrSat.addS(show92)
        schedMgrSat.addS(show93)
        schedMgrSat.addS(show94)
        
        updateLabels()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateLabels(){
        if(isInternetAvailable()){
        //code to update the labels
        //this is where I scan the information from the website HTML
        //if the code of the website changes, this will break
            if(playing){
                listenLiveButton.isHidden = true
                stopButton.isHidden = false
            }
            else{
                listenLiveButton.isHidden = false
                stopButton.isHidden = true
            }
        let myURLString = "http://www.wmua.org"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        var pageInfo: String = "something's wrong, but not caught";
        do{
            pageInfo = try String(contentsOf: myURL, encoding:String.Encoding.utf8)
        }catch{
            print("something's wrong!")
        }
        let cons: Scanner = Scanner(string: pageInfo)
        let charset: CharacterSet = CharacterSet(charactersIn: "\"</i")
            let charset2: CharacterSet = CharacterSet(charactersIn: ">")
            let showinfoset: CharacterSet = CharacterSet(charactersIn: "showinfo\"")

        
        var showTitle: NSString?
        var DJTitle: NSString?
        var showDescription: NSString?
        
        ///show.html?showoid
        
        var showN: String;
        var djN: String;
        var showD: String;
        
        cons.scanUpTo("td colspan", into: nil)
        /* this is old (website was changed):
        cons.scanUpTo("http://WMUA.radioactivity.fm", into: nil)
        cons.scanUpTo("\">", into: &testForRadioactivityDown)
        cons.scanCharacters(from: charset, into: nil)
        cons.scanUpTo("</a>", into: &showTitle)
        cons.scanUpTo("</i>", into: nil)
        cons.scanCharacters(from: charset, into: nil)
        cons.scanUpTo("</td>", into: &DJTitle)
         */
        cons.scanUpTo("\">", into: nil)
        cons.scanCharacters(from: charset, into: nil)
        cons.scanCharacters(from: charset2, into: nil)
        cons.scanUpTo("\">", into: nil)
        cons.scanCharacters(from: charset, into: nil)
        cons.scanCharacters(from: charset2, into: nil)
        cons.scanUpTo("</a>", into: &showTitle)
        cons.scanUpTo("</i>", into: nil)
        cons.scanCharacters(from: charset, into: nil)
        cons.scanCharacters(from: charset2, into: nil)
        cons.scanUpTo("</td>", into: &DJTitle)
        cons.scanUpTo("showinfo\">", into: nil)
        cons.scanCharacters(from: showinfoset, into: nil)
        cons.scanCharacters(from: charset2, into: nil)
        cons.scanUpTo("</span>", into: &showDescription)
        
        /*
        if((testForRadioactivityDown?.isEqual(to: "http://wmua.radioactivity.fm")) == nil){
            showN = "Radioactivity is down!"
            djN = "Sorry, please check back later."
        }
        else{
 */
        showN = showTitle!.substring(from: 0);
        djN = "with " + (DJTitle?.substring(from: 0))!;
            if(showDescription == nil){
                showD = "No show info available!";
            }else{
                showD = showDescription!.substring(from: 0)
            }
                showN = showN.replacingOccurrences(of: "&#39;", with: "'");
                djN = djN.replacingOccurrences(of: "&#39;", with: "'");
                showN = showN.replacingOccurrences(of: "&amp;", with: "&");
                djN = djN.replacingOccurrences(of: "&amp;", with: "&");
                showD = showD.replacingOccurrences(of: "&amp;", with: "&");
                showD = showD.replacingOccurrences(of: "&#39;", with: "'");

        //}
        
        /*
         
         this is source code whe radioactivity is down:
         
         <td colspan="2"><a href="http://wmua.radioacivity.fm">Radioactivity Down!</a><br \><i>with</i> Show Info Not Avaiable</td>
         
         <td colspan="2"><span id="showinfo">Radioactivity, the site that handles our playlists is currently having some issues.  Check back later!</span></td>
 
         
         and when it is not:
         
             <tr>
             <td colspan="2"><a href="">iCon (International Content)</a><br \><i>with</i> Matt Butler</td>
             
             <td id="showinfo" colspan="2"><i>No Show Info Available!</i></td>
             
             </tr>
         
         */
        
//        else{
//            showN = "";
//            djN = "";
//        }
        
        showLabel.text = showN;
        DJLabel.text = djN;
        descLabel.text = showD;
            UIApplication.shared.beginReceivingRemoteControlEvents()
        }
        else{
            showLabel.text = "No internet connection";
            DJLabel.text = "";
            descLabel.text = "Please check your internet connection and try again.";
//            playing = false;
            listenLiveButton.isHidden = true
            stopButton.isHidden = true
        }
        
    }

    @IBAction func refreshPressed(_ sender: UIBarButtonItem) {
        updateLabels()
        //do I need to reload the view?
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        startPlaying()
        
    }
    
    func startPlaying(){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            //print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                //    print("AVAudioSession is Active")
            } catch _ as NSError {
                //    print(error.localizedDescription)
            }
        } catch _ as NSError {
            // print(error.localizedDescription)
        }
        do{
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
            
        }catch _ as NSError{}
        
        myPlayer.player.play()
        playing = true
        
        listenLiveButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopPlaying()
        
    }
    
    func stopPlaying(){
        myPlayer.player.pause()
        playing = false
        stopButton.isHidden = true
        listenLiveButton.isHidden = false
    }
    
    override func remoteControlReceived(with event: UIEvent?) { // *
        let rc = event!.subtype
        //let p = myPlayer.player
        //print("received remote control \(rc.rawValue)") // 101 = pause, 100 = play
        switch rc {
        case .remoteControlTogglePlayPause:
            if playing {
                stopPlaying()
            } else {
                startPlaying()
            }
        case .remoteControlPlay:
            startPlaying()
        case .remoteControlPause:
            stopPlaying()
        default:break
        }
    }
    
    /*
    @IBAction func volSlideMoved(sender: UISlider) {
        myPlayer.player.volume = volSlide.value
    }
 */
    
    
    
    /*
    func setupPlayer() {
        radioPlayer.view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        radioPlayer.view.sizeToFit()
        //radioPlayer.movieSourceType = MPMovieSourceType.Streaming
        radioPlayer.fullscreen = false
        radioPlayer.shouldAutoplay = false
        radioPlayer.contentURL = NSURL(string: "http://ice7.securenetsystems.net/WMUA?&playSessionID=E6DB23BD-AC18-1366-1EF37CF471BB2F09")
        
        
        radioPlayer.prepareToPlay()
        //radioPlayer.controlStyle = MPMovieControlStyle.None
    }
 */

}
