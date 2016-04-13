//
//  FourthViewController.swift
//  WMUASwift
//
//  Created by Mike Keegan on 3/30/16.
//  Copyright © 2016 mikekeegan. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mainWebButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var podcastsButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callButton.backgroundColor = UIColor.clearColor()
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).CGColor
        callButton.titleLabel?.adjustsFontSizeToFitWidth = true
        descriptionLabel.text = "HERE CAN BE A DESCRIPTION OF WMUA Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callButtonPressed(sender: UIButton) {
        let phone = "tel://4135453691";
        let url:NSURL = NSURL(string:phone)!;
        UIApplication.sharedApplication().openURL(url);
    }
    
    @IBAction func mainButtPressed(sender: UIButton) {
        if let url = NSURL(string: "http://www.wmua.org") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func sportsButtPressed(sender: UIButton) {
        if let url = NSURL(string: "http://www.wmua.org/sports/") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func newsButtPressed(sender: UIButton) {
        if let url = NSURL(string: "https://wmuanews.wordpress.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

    @IBAction func podcastButtPressed(sender: UIButton) {
        if let url = NSURL(string: "http://wmua.org/podcastgen2/") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
