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
        callButton.backgroundColor = UIColor.clear
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.init(red: 154/255, green: 47/255, blue: 50/255, alpha: 1.0).cgColor
        callButton.titleLabel?.adjustsFontSizeToFitWidth = true
        descriptionLabel.text = "Visit our offices in the basement of the UMass Campus Center!";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callButtonPressed(_ sender: UIButton) {
        let phone = "tel://4135453691";
        let url:URL = URL(string:phone)!;
        UIApplication.shared.openURL(url);
    }
    
    @IBAction func mainButtPressed(_ sender: UIButton) {
        if let url = URL(string: "http://www.wmua.org") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func sportsButtPressed(_ sender: UIButton) {
        if let url = URL(string: "http://www.wmua.org/sports/") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func newsButtPressed(_ sender: UIButton) {
        if let url = URL(string: "https://wmuanews.wordpress.com") {
            UIApplication.shared.openURL(url)
        }
    }

    @IBAction func podcastButtPressed(_ sender: UIButton) {
        if let url = URL(string: "http://wmua.org/podcastgen2/") {
            UIApplication.shared.openURL(url)
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
