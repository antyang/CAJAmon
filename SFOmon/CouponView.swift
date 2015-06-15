//
//  CouponView.swift
//  SFOmon
//
//  Created by Antony Yang on 6/14/15.
//  Copyright (c) 2015 Antony Yang. All rights reserved.
//

import UIKit

class CouponView: UIViewController {
    
    var location: [String:AnyObject]? = nil
    let server = Requests(server: "http://172.31.59.112:3000")

    @IBOutlet weak var node_title: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var location_summary: UILabel!
    
    var data = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let theStore = location {
            self.data = [
                "node_title": "Starbucks",
                "phone": "650.821.8753",
                "hours": "Daily, 4:30 a.m. to 11:00 p.m.",
                "website": "starbucks.com",
                "location_summary": "Arrivals Level"
            ]
            updateText()
        }
        // Do any additional setup after loading the view.
    }

    func updateText() {
        self.node_title.text = data["node_title"] as? String
        self.phone.text = data["phone"] as? String
        self.hours.text = data["hours"] as? String
        self.website.text = data["website"] as? String
        self.location_summary.text = data["location_summary"] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue" {
            let tabbar = segue.destinationViewController as! UITabBarController
            let navcon = tabbar.viewControllers![0] as! UINavigationController
            let svc = navcon.viewControllers![0] as! CAJADexTableViewController
            svc.newPokemon = "Sealmon"
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
