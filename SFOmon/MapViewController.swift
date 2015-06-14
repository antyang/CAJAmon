//
//  MapViewController.swift
//  SFOmon
//
//  Created by Antony Yang on 6/14/15.
//  Copyright (c) 2015 Antony Yang. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //nav shit
        var nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 26)!,  NSForegroundColorAttributeName: UIColor.blackColor()]
        nav?.tintColor = UIColor.blackColor()
        self.navigationController?.barHideOnTapGestureRecognizer
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
