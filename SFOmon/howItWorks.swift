//
//  howItWorks.swift
//  SFOmon
//
//  Created by Antony Yang on 6/14/15.
//  Copyright (c) 2015 Antony Yang. All rights reserved.
//

import UIKit

class howItWorks: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // do shit when view is roaded
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

    func blurShit(){
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            view.addSubview(blurEffectView)
            blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        } else {
            view.backgroundColor = UIColor.clearColor()
        }
    }
    
    
    
    
    
    
}
