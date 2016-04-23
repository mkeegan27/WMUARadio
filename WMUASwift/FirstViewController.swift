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

class FirstViewController: UIViewController {

    @IBOutlet weak var listenLiveButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var DJLabel: UILabel!
    
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
            self.player = AVPlayer(URL: NSURL(string: link)!)
        }
    }
    var myPlayer = PlayerAv(link: "http://ice7.securenetsystems.net/WMUA?&playSessionID=E6DB23BD-AC18-1366-1EF37CF471BB2F09")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenLiveButton.backgroundColor = UIColor.clearColor()
        listenLiveButton.layer.cornerRadius = 5
        listenLiveButton.layer.borderWidth = 1
        listenLiveButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).CGColor
        stopButton.backgroundColor = UIColor.clearColor()
        stopButton.layer.cornerRadius = 5
        stopButton.layer.borderWidth = 1
        stopButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).CGColor
        //setupPlayer()
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        
        //2016 SPRING SCHEDULE:
        
        //sunday shows:
        let show0: show = show(host: "Dr. Mess", name: "The Breakdown Shakedown", day: "Sunday", time: "Midnight - 2am")
        let show1: show = show(host: "Julia Galunova", name: "All About The Bass", day: "Sunday", time: "2am - 4am")
        let show2: show = show(host: "Teagan McStay", name: "Paper This City", day: "Sunday", time: "4am - 6am")
        let show3: show = show(host: "Ryan Arnold and James Coyle", name: "Magic Pig Detective", day: "Sunday", time: "6am - 8am")
        let show4: show = show(host: "Helen Curtin", name: "Polka Celebration", day: "Sunday", time: "8am - 10am")
        let show5: show = show(host: "Todd Zaganiacz", name: "Polka Carousel", day: "Sunday", time: "10am - noon")
        let show6: show = show(host: "Mad Matt", name: "Grand Theft Audio", day: "Sunday", time: "noon - 2pm")
        let show7: show = show(host: "DJ Tommmy Fooch", name: "Automatic Stop", day: "Sunday", time: "2pm - 4pm")
        let show8: show = show(host: "Michael Hagerty", name: "good kid, s.A.A.d city", day: "Sunday", time: "4pm - 6pm")
        let show9: show = show(host: "DJ Shifty Disks", name: "Freelance Poetry", day: "Sunday", time: "6pm - 8pm")
        let show10: show = show(host: "Ethan Sennett", name: "A to Zed", day: "Sunday", time: "8pm - 10pm")
        let show11: show = show(host: "Fred", name: "Mellifluous Sounds", day: "Sunday", time: "10pm - midnight")
        
            schedMgrSun.addS(show0)
            schedMgrSun.addS(show1)
            schedMgrSun.addS(show2)
            schedMgrSun.addS(show3)
            schedMgrSun.addS(show4)
            schedMgrSun.addS(show5)
            schedMgrSun.addS(show6)
            schedMgrSun.addS(show7)
            schedMgrSun.addS(show8)
            schedMgrSun.addS(show9)
            schedMgrSun.addS(show10)
            schedMgrSun.addS(show11)
        
        //monday shows:
        let show12: show = show(host: "Kaiser", name: "The Butter Block", day: "Monday", time: "Midnight - 2am")
        let show13: show = show(host: "Satya G", name: "Stacked", day: "Monday", time: "2am - 4am")
        let show14: show = show(host: "Peter Hurley", name: "The Sp3ctrum", day: "Monday", time: "4am - 6am")
        let show15: show = show(host: "Morgan Hughes", name: "Life In Waves", day: "Monday", time: "6am - 8am")
        let show16: show = show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Monday", time: "8am - 9am")
        let show17: show = show(host: "DJ Diego", name: "The Latin Hour", day: "Monday", time: "9am - 11am")
        let show18: show = show(host: "DJ Waffleonia", name: "Brunch", day: "Monday", time: "11am - 12:30pm")
        let show19: show = show(host: "Kaelan", name: "People's Instinctive Travels", day: "Monday", time: "12:30pm - 2:30pm")
        let show20: show = show(host: "Misha", name: "State of the Tune-In", day: "Monday", time: "2:30pm - 4:30pm")
        let show21: show = show(host: "Alex Levitt", name: "SPORTSLINE", day: "Monday", time: "4:30pm - 5:30pm")
        let show22: show = show(host: "WMUA", name: "WMUA News", day: "Monday", time: "5:30pm - 6pm")
        let show23: show = show(host: "DJ Millzy", name: "Rock & Roll Fight Club", day: "Monday", time: "6pm - 8pm")
        let show24: show = show(host: "Ken", name: "Wiggly World", day: "Monday", time: "8pm - 10pm")
        let show25: show = show(host: "Mike Crawford", name: "Requisite Lazer Sound", day: "Monday", time: "10pm - midnight")
        
        schedMgrMon.addS(show12)
        schedMgrMon.addS(show13)
        schedMgrMon.addS(show14)
        schedMgrMon.addS(show15)
        schedMgrMon.addS(show16)
        schedMgrMon.addS(show17)
        schedMgrMon.addS(show18)
        schedMgrMon.addS(show19)
        schedMgrMon.addS(show20)
        schedMgrMon.addS(show21)
        schedMgrMon.addS(show22)
        schedMgrMon.addS(show23)
        schedMgrMon.addS(show24)
        schedMgrMon.addS(show25)
        
        //tuesday shows:
        let show26: show = show(host: "cheeto dust", name: "The Midnight Plimf", day: "Tuesday", time: "Midnight - 2am")
        let show27: show = show(host: "Conor", name: "Conor's Corner", day: "Tuesday", time: "2am - 4am")
        let show28: show = show(host: "Various DJ's", name: "NEW 2 WMUA", day: "Tuesday", time: "4am - 6am")
        let show29: show = show(host: "DJ Rick", name: "And Now For Something Completely Different", day: "Tuesday", time: "6am - 8am")
        let show30: show = show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Tuesday", time: "8am - 9am")
        let show31: show = show(host: "Grantith Mac", name: "Circular Breathing", day: "Tuesday", time: "9am - 11am")
        let show32: show = show(host: "Monica Curtin", name: "SunDrenched", day: "Tuesday", time: "11am - 12:30pm")
        let show33: show = show(host: "Lucy", name: "Chere Sputnik", day: "Tuesday", time: "12:30pm - 2:30pm")
        let show34: show = show(host: "DJ Moonbeam", name: "Afternoon Snack", day: "Tuesday", time: "2:30pm - 4:30pm")
        let show35: show = show(host: "Bob Reiser", name: "Chin Music", day: "Tuesday", time: "4:30pm - 5pm")
        let show36: show = show(host: "Daisy Mathias", name: "Poetry A La Carte", day: "Tuesday", time: "5pm - 5:30pm")
        let show37: show = show(host: "WMUA", name: "WMUA News", day: "Tuesday", time: "5:30pm - 6pm")
        let show38: show = show(host: "Lewis", name: "Rhythm and Bass", day: "Tuesday", time: "6pm - 8pm")
        let show39: show = show(host: "DJ Sarah D", name: "Sound of Siver", day: "Tuesday", time: "8pm - 10pm")
        let show40: show = show(host: "DJ de soto", name: "Projecting Monsters on the Wall", day: "Tuesday", time: "10pm - midnight")
        
        schedMgrTues.addS(show26)
        schedMgrTues.addS(show27)
        schedMgrTues.addS(show28)
        schedMgrTues.addS(show29)
        schedMgrTues.addS(show30)
        schedMgrTues.addS(show31)
        schedMgrTues.addS(show32)
        schedMgrTues.addS(show33)
        schedMgrTues.addS(show34)
        schedMgrTues.addS(show35)
        schedMgrTues.addS(show36)
        schedMgrTues.addS(show37)
        schedMgrTues.addS(show38)
        schedMgrTues.addS(show39)
        schedMgrTues.addS(show40)
        
        //wednesday shows:
        let show41: show = show(host: "DJ Scandaluz", name: "Midnight Scandals", day: "Wednesday", time: "Midnight - 2am")
        let show42: show = show(host: "Emily Tiedtke", name: "etc.", day: "Wednesday", time: "2am - 4am")
        let show43: show = show(host: "Doktor Ugs", name: "ChatterBox", day: "Wednesday", time: "4am - 6am")
        let show44: show = show(host: "Alex Gogol", name: "Not Another Indie Show", day: "Wednesday", time: "6am - 8am")
        let show45: show = show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Wednesday", time: "8am - 9am")
        let show46: show = show(host: "Dave Van Iderstine", name: "The Last Resort", day: "Wednesday", time: "9am - 11am")
        let show47: show = show(host: "PLAYER 1", name: "A+B+START", day: "Wednesday", time: "11am - 12:30pm")
        let show48: show = show(host: "Liam Byrne", name: "Celtic Rock and Talk", day: "Wednesday", time: "12:30pm - 2:30pm")
        let show49: show = show(host: "DJ ANJ", name: "The Electric Beach", day: "Wednesday", time: "2:30pm - 4:30pm")
        let show50: show = show(host: "Matthew Lieberman", name: "Hump Day Sports", day: "Wednesday", time: "4:30pm - 5:30pm")
        let show51: show = show(host: "WMUA", name: "WMUA News", day: "Wednesday", time: "5:30pm - 6pm")
        let show52: show = show(host: "The DJs formerly known as Dan and Morgan", name: "Cassettes on the Dash", day: "Wednesday", time: "6pm - 8pm")
        let show53: show = show(host: "Carlie", name: "Good Vibrations", day: "Wednesday", time: "8pm - 10pm")
        let show54: show = show(host: "Mike", name: "MoMA", day: "Wednesday", time: "10pm - midnight")
        
        schedMgrWed.addS(show41)
        schedMgrWed.addS(show42)
        schedMgrWed.addS(show43)
        schedMgrWed.addS(show44)
        schedMgrWed.addS(show45)
        schedMgrWed.addS(show46)
        schedMgrWed.addS(show47)
        schedMgrWed.addS(show48)
        schedMgrWed.addS(show49)
        schedMgrWed.addS(show50)
        schedMgrWed.addS(show51)
        schedMgrWed.addS(show52)
        schedMgrWed.addS(show53)
        schedMgrWed.addS(show54)
        
        //thursday shows:
        let show55: show = show(host: "Jasper", name: "no half guessing", day: "Thursday", time: "Midnight - 2am")
        let show56: show = show(host: "DJ Fan & DJ Liv", name: "Somethin' 4 The Soul", day: "Thursday", time: "2am - 4am")
        let show57: show = show(host: "DJ Hammernose", name: "Won't Be Pathetic Forever", day: "Thursday", time: "4am - 6am")
        let show58: show = show(host: "Troy Ko", name: "Pop Pop Positive", day: "Thursday", time: "6am - 8am")
        let show59: show = show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Thursday", time: "8am - 9am")
        let show60: show = show(host: "Mitch Bordage", name: "Speakeasy", day: "Thursday", time: "9am - 11am")
        let show61: show = show(host: "Patricia", name: "Of Space and Time", day: "Thursday", time: "11am - 12:30pm")
        let show62: show = show(host: "Peter Mcquillan", name: "Age of Exploration", day: "Thursday", time: "12:30pm - 2:30pm")
        let show63: show = show(host: "Katie Wright", name: "Thursday's Rhythm & Blues Revue", day: "Thursday", time: "2:30pm - 4:30pm")
        let show64: show = show(host: "Pio and Chelsie", name: "The Hour of Power", day: "Thursday", time: "4:30pm - 5:30pm")
        let show65: show = show(host: "WMUA", name: "WMUA News", day: "Thursday", time: "5:30pm - 6pm")
        let show66: show = show(host: "lil kisses", name: "the vo / d", day: "Thursday", time: "6pm - 8pm")
        let show67: show = show(host: "Mike Campbell", name: "Fuzz N Grime", day: "Thursday", time: "8pm - 10pm")
        let show68: show = show(host: "SAD RAD DAD", name: "Fearful Assymetry", day: "Thursday", time: "10pm - midnight")
        
        schedMgrThurs.addS(show55)
        schedMgrThurs.addS(show56)
        schedMgrThurs.addS(show57)
        schedMgrThurs.addS(show58)
        schedMgrThurs.addS(show59)
        schedMgrThurs.addS(show60)
        schedMgrThurs.addS(show61)
        schedMgrThurs.addS(show62)
        schedMgrThurs.addS(show63)
        schedMgrThurs.addS(show64)
        schedMgrThurs.addS(show65)
        schedMgrThurs.addS(show66)
        schedMgrThurs.addS(show67)
        schedMgrThurs.addS(show68)

        //friday shows:
        let show69: show = show(host: "Kristen Mary", name: "Gravity X", day: "Friday", time: "Midnight - 2am")
        let show70: show = show(host: "Steven Bowe", name: "The 93 Report", day: "Friday", time: "2am - 4am")
        let show71: show = show(host: "J-Ho", name: "Movie News", day: "Friday", time: "4am - 6am")
        let show72: show = show(host: "Brenna McIntyre", name: "Turbulence", day: "Friday", time: "6am - 8am")
        let show73: show = show(host: "Syndicated", name: "DEMOCRACY NOW!", day: "Friday", time: "8am - 9am")
        let show74: show = show(host: "DJ Specs", name: "Sonic Metro", day: "Friday", time: "9am - 11am")
        let show75: show = show(host: "DJ CHAR JELLY", name: "Char Jelly and the Jams", day: "Friday", time: "11am - 12:30pm")
        let show76: show = show(host: "DJ Hao Pengyou", name: "Yinyue Shijian", day: "Friday", time: "12:30pm - 2:30pm")
        let show77: show = show(host: "Ramblin' Blind Josh Pearson and Offbeat Erik", name: "Midnight Honey from the Diamond Mine", day: "Friday", time: "2:30pm - 4:30pm")
        let show78: show = show(host: "Josh", name: "The Third World", day: "Friday", time: "4:30pm - 5:30pm")
        let show79: show = show(host: "WMUA", name: "WMUA News", day: "Friday", time: "5:30pm - 6pm")
        let show80: show = show(host: "Chris & Rec", name: "TRGGR Radio", day: "Friday", time: "6pm - 8pm")
        let show81: show = show(host: "Aidan", name: "Garage Door", day: "Friday", time: "8pm - 10pm")
        let show82: show = show(host: "DJ Marky Marko", name: "Fresh Produce", day: "Friday", time: "10pm - midnight")
        
        schedMgrFri.addS(show69)
        schedMgrFri.addS(show70)
        schedMgrFri.addS(show71)
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
        let show83: show = show(host: "Tactik and Drift", name: "Synaesthesia", day: "Saturday", time: "Midnight - 2am")
        let show84: show = show(host: "Stevie G", name: "The Weather Report", day: "Saturday", time: "2am - 4am")
        let show85: show = show(host: "Liam O'Connor", name: "The Aux Cord", day: "Saturday", time: "4am - 6am")
        let show86: show = show(host: "Brooke, Janna, and Cate", name: "Jamherst", day: "Saturday", time: "6am - 8am")
        let show87: show = show(host: "DJ Astro", name: "Open Mind Radio", day: "Saturday", time: "8am - 10am")
        let show88: show = show(host: "Annelise and Kara", name: "Anything But Country", day: "Saturday", time: "10am - noon")
        let show89: show = show(host: "Robert Hunt", name: "Let's Be Blunt", day: "Saturday", time: "noon - 2pm")
        let show90: show = show(host: "DJ Wallaruss", name: "A Thoroughly Modern Lily", day: "Saturday", time: "2pm - 4pm")
        let show91: show = show(host: "DJ Annie Day", name: "CTRL+ALT+DEL", day: "Saturday", time: "4pm - 6pm")
        let show92: show = show(host: "DJ Trashcan", name: "Just Garbage", day: "Saturday", time: "6pm - 8pm")
        let show93: show = show(host: "Tariq & Tarik", name: "Temperatures Rising", day: "Saturday", time: "8pm - 10pm")
        let show94: show = show(host: "John Anderson", name: "Stitched Up", day: "Saturday", time: "10pm - midnight")
        
        schedMgrSat.addS(show83)
        schedMgrSat.addS(show84)
        schedMgrSat.addS(show85)
        schedMgrSat.addS(show86)
        schedMgrSat.addS(show87)
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
        //code to update the labels
        //this is where I scan the information from the website HTML
        //if the code of the website changes, this will break
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
        let cons: NSScanner = NSScanner(string: pageInfo)
        let charset: NSCharacterSet = NSCharacterSet(charactersInString: "\"</i>")
        
        var showTitle: NSString?
        var DJTitle: NSString?
        var testForRadioactivityDown: NSString?
        
        ///show.html?showoid
        
        var showN: String;
        var djN: String;
        
        cons.scanUpToString("td colspan", intoString: nil)
        cons.scanUpToString("http://WMUA.radioactivity.fm", intoString: nil)
        cons.scanUpToString("\">", intoString: &testForRadioactivityDown)
        cons.scanCharactersFromSet(charset, intoString: nil)
        cons.scanUpToString("</a>", intoString: &showTitle)
        cons.scanUpToString("</i>", intoString: nil)
        cons.scanCharactersFromSet(charset, intoString: nil)
        cons.scanUpToString("</td>", intoString: &DJTitle)
        
        if((testForRadioactivityDown?.isEqualToString("http://wmua.radioactivity.fm")) == nil){
            showN = "Radioactivity is down!"
            djN = "Sorry, please check back later."
        }
        else{
        showN = showTitle!.substringFromIndex(0);
        djN = "with " + (DJTitle?.substringFromIndex(0))!;
            showN = showN.stringByReplacingOccurrencesOfString("&#39;", withString: "'");
            djN = djN.stringByReplacingOccurrencesOfString("&#39;", withString: "'");
            showN = showN.stringByReplacingOccurrencesOfString("&amp;", withString: "&");
            djN = djN.stringByReplacingOccurrencesOfString("&amp;", withString: "&");
        }
        
        /*
         
         this is source code whe radioactivity is down:
         
         <td colspan="2"><a href="http://wmua.radioacivity.fm">Radioactivity Down!</a><br \><i>with</i> Show Info Not Avaiable</td>
         
         <td colspan="2"><span id="showinfo">Radioactivity, the site that handles our playlists is currently having some issues.  Check back later!</span></td>
 
         
         and when it is not:
         
         <tr>
         <td colspan="2"><a href="http://WMUA.radioactivity.fm/show.html?showoid=8618">Let&#39;s Be Blunt with Robert Hunt</a><br \><i>with</i> Robert Hunt</td>
         
         <td colspan="2"><span id="showinfo">The show is an eclectic mix of music and talk, mixing music from all different genres with interesting conversations regarding campus life. Each show includes an interview with a guest from an organization around campus, the rest covers a variety of different music. </span></td>
         
         </tr>
         
         */
        
//        else{
//            showN = "";
//            djN = "";
//        }
        
        showLabel.text = showN;
        DJLabel.text = djN;
        
    }

    @IBAction func refreshPressed(sender: UIBarButtonItem) {
        updateLabels()
        //do I need to reload the view?
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonPressed(sender: UIButton) {
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
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker)
            
        }catch _ as NSError{}
        
        myPlayer.player.play()
        
        listenLiveButton.hidden = true
        stopButton.hidden = false
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        stopPlaying()
        
    }
    
    func stopPlaying(){
        myPlayer.player.pause()
        stopButton.hidden = true
        listenLiveButton.hidden = false
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) { // *
        let rc = event!.subtype
        //let p = myPlayer.player
        //print("received remote control \(rc.rawValue)") // 101 = pause, 100 = play
        switch rc {
        case .RemoteControlTogglePlayPause:
            if playing {
                stopPlaying()
            } else {
                startPlaying()
            }
        case .RemoteControlPlay:
            startPlaying()
        case .RemoteControlPause:
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
