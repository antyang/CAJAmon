//
//  ViewController.swift
//  SFOmon
//
//  Created by Antony Yang on 6/13/15.
//  Copyright (c) 2015 Antony Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet var splashTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // do shit when view loads
        
        //splashScreen background w Blur
        view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundsfo1.png")!).colorWithAlphaComponent(0.6)
        
        //font customization
        splashTitle.text = "CAJAmon"
        splashTitle.font =  UIFont(name: "PokemonGB", size: 46)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // __________________________________________________________________________
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    // __________________________________________________________________________
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "howItWorks"{
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    
    
    
    
    
    
    
    

}

