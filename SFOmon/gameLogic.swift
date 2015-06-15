//
//  gameLogic.swift
//  SFOmon
//
//  Created by Joshua Huang on 6/14/15.
//  Copyright (c) 2015 Antony Yang. All rights reserved.
//

import Foundation
import UIKit

class GameLogic: UIViewController {
    
    var damage_given = 0;
    var damage_taken = 0;
    var health = 200;
    var enemy_health = 100;
    var heads_tails = "none"
    var display = "";
    var your_status = "none";
    var enemy_status = "none";
    var ai_option = 0;
    var current_enemy = "Sealmon";
    var health_text = "";
    var enemy_health_text = ""
    var game_over = 0;
    
    var location: [String:AnyObject]? = nil
    
    @IBOutlet weak var yourHealth: UILabel!
    @IBOutlet weak var enemyHealth: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    
    
    @IBOutlet weak var ability1: UIButton!
    @IBOutlet weak var ability2: UIButton!
    @IBOutlet weak var ability3: UIButton!
    @IBOutlet weak var ability4: UIButton!
    
    func disable_buttons(){
        ability1.enabled = false;
        ability2.enabled = false;
        ability3.enabled = false;
        ability4.enabled = false;
    }
    func enable_buttons(){
        self.ability1.enabled = true;
        self.ability2.enabled = true;
        self.ability3.enabled = true;
        self.ability4.enabled = true;
    }
    
    @IBAction func ability(sender: UIButton) {
        disable_buttons()
        
        if sender.tag == 1{
            pika_scratch();
            if game_over != 1{
                delay(2.0) {
                    self.enable_buttons();
                    if self.current_enemy == "Sealmon" {
                        self.squirtle()
                    }
                    if self.current_enemy == "charmander" {
                        self.charmander()
                    }
                }
            }
            if game_over == 1{
                fight_status();
                game_over = 0;
            }
            
        }
        else if sender.tag == 2 {
            spark();
            if game_over != 1{
                delay(2.0) {
                    self.enable_buttons();
                    if self.current_enemy == "Sealmon" {
                        self.squirtle()
                    }
                    if self.current_enemy == "charmander" {
                        self.charmander()
                    }
                }
            }
            if game_over == 1{
                fight_status();
                game_over = 0;
            }
            
        }
        else if sender.tag == 3 {
            thunder_jolt();
            if game_over != 1{
                delay(2.0) {
                    self.enable_buttons();
                    if self.current_enemy == "Sealmon" {
                        self.squirtle()
                    }
                    if self.current_enemy == "charmander" {
                        self.charmander()
                    }
                }
            }
            if game_over == 1{
                fight_status();
                game_over = 0;
            }
            
            
        }
        else if sender.tag == 4 {
            thunder_jolt();
            if game_over != 1{
                delay(2.0) {
                    self.enable_buttons();
                    if self.current_enemy == "Sealmon" {
                        self.squirtle()
                    }
                    if self.current_enemy == "charmander" {
                        self.charmander()
                    }
                }
            }
            if game_over == 1{
                fight_status();
                game_over = 0;
            }
            
        }
    }
    
    
    //DELAY FUNCTION
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    // CHECKS IF FIGHT IS OVER, POKEMON STATUS, REFRESH HEALTH
    
    func fight_status() {
        health_text = "\(health)"
        yourHealth.text = health_text;
        enemy_health_text = "\(enemy_health)"
        enemyHealth.text = enemy_health_text;
        actionDescription.text = display;
        
        if health <= 0{
            display = "Game Over"
            game_over = 1;
            health = 100;
            disable_buttons()
            dismissViewControllerAnimated(true, completion: nil)
        }
        else if enemy_health <= 0{
            display = "You captured \(current_enemy)!"
            //code to segue to win controller
            game_over = 1;
            enemy_health = 100;
            disable_buttons()
            performSegueWithIdentifier("gameEndSegue", sender: nil)
            println(location)
        }
        else if your_status == "asleep" {
            display = "You Pokemon is asleep"
            //code here
        }
        else if enemy_status == "asleep" {
            display = "You pokemon is asleep!"
            //code here
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameEndSegue" {
            let svc = segue.destinationViewController as! CouponView
            svc.location = location!
        }
    }
    
    // COIN FLIP FUNCTION TO DETERMINE BETWEEN TWO OUTCOMES
    func coin_flip(){
        let headtails = Int(arc4random_uniform(UInt32(10)))
        if headtails <= 5{
            heads_tails = "heads"
        }
        else{
            heads_tails = "tails"
        }
    }
    // RANDOM AI DECISION MAKING. Choosing between two different abilities
    func AI_choice(){
        let aichoice = Int(arc4random_uniform(UInt32(15)))
        if aichoice <= 5{
            ai_option = 1
        }
        else if aichoice > 5 && aichoice <= 10{
            ai_option = 2
        }
        else{
            ai_option = 3
        }
    }
    
    //----------------------------Battle Abilities------------------------//
    
    //----------------Character Abilities--------------------//
    
    func thunder_storm(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(50)))
            health -= damage_taken
            display = "You used THUNDER STORM but did \(damage_taken) damage to yourself"
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(50)))
            enemy_health -= damage_given;
            display = "You used THUNDER STORM and did did \(damage_given) damage to \(current_enemy)!"
            
        }
        fight_status()
    }
    
    func thunder_jolt(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(20)))
            health -= damage_taken
            display = "You used THUNDER JOLT but did \(damage_taken) damage to yourself"
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(30)))
            enemy_health -= damage_given;
            display = "You used THUNDER JOLT and did did \(damage_given) damage to \(current_enemy)!"
            
        }
        fight_status()
    }
    
    func spark(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(10)))
            health -= damage_taken
            display = "You used SPARK but did \(damage_taken) damage to yourself"
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(20)))
            enemy_health -= damage_given;
            display = "You used SPARK and did did \(damage_given) damage to \(current_enemy)!"
            
        }
        fight_status()
    }
    
    func pika_scratch(){
        damage_given = Int(arc4random_uniform(UInt32(10)))
        enemy_health -= damage_given
        display = "You used PUNCH and did \(damage_given) damage"
        fight_status()
    }
    
    
    
    
    //----------------End Character Abilities-----------------//
    
    // GENERIC 10 DAMAGE ABILITY: Scratch, Bubble, Gnaw
    func bubble(){
        damage_given = Int(arc4random_uniform(UInt32(10)))
        health -= damage_given
        display = "\(current_enemy) used BUBBLE and did \(damage_given) damage"
        fight_status()
    }
    func scratch(){
        damage_given = Int(arc4random_uniform(UInt32(10)))
        health -= damage_given
        display = "\(current_enemy) used SCRATCH and did \(damage_given) damage"
        fight_status()
    }
    
    func ember(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(10)))
            enemy_health -= damage_taken;
            display = "\(current_enemy) used EMBER but did \(damage_taken) damage to itself!"
            
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(30)))
            health -= damage_given
            display = "\(current_enemy) used EMBER and did \(damage_given) damage!"
        }
        fight_status()
    }
    func firestorm(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(20)))
            enemy_health -= damage_taken;
            display = "\(current_enemy) used FIRESTORM but did \(damage_taken) damage to itself!"
            
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(40)))
            health -= damage_given
            display = "\(current_enemy) used FIRESTORM and did \(damage_given) damage!"
        }
        fight_status()
    }
    
    func water_gun(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(10)))
            enemy_health -= damage_taken;
            display = "\(current_enemy) used WATER GUN but did \(damage_taken) damage to itself!"
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(20)))
            health -= damage_given
            display = "\(current_enemy) USED WATER GUN and did \(damage_given) damage!"
        }
        fight_status()
    }
    func water_cannon(){
        coin_flip()
        if heads_tails == "heads"{
            damage_taken = Int(arc4random_uniform(UInt32(20)))
            enemy_health -= damage_taken;
            display = "\(current_enemy) used WATER CANNON but did \(damage_taken) damage to itself!"
        }
        else{
            damage_given = Int(arc4random_uniform(UInt32(30)))
            health -= damage_given
            display = "\(current_enemy) USED WATER CANNON and did \(damage_given) damage!"
        }
        fight_status()
    }
    
    
    func lullaby(){
        coin_flip()
        if heads_tails == "heads"{
            enemy_status = "asleep"
        }
        else{
            //
        }
        fight_status()
    }
    func Pound(){
        if enemy_status == "none"{
            damage_given = Int(arc4random_uniform(UInt32(20)));
        }
        else if enemy_status == "asleep"{
            damage_given = Int(arc4random_uniform(UInt32(20)))+10;
            enemy_status = "none";
        }
        fight_status()
    }
    func heal(){
        
    }
    
    
    
    //-----------------------------Battle Abilities End ------------------//
    
    //Characters
    func squirtle (){
        AI_choice();
        if ai_option == 1{
            bubble();
        }
        else if ai_option == 2{
            water_gun()
        }
        else if ai_option == 3{
            water_cannon()
        }
    }
    
    func charmander() {
        AI_choice();
        if ai_option == 1{
            scratch();
        }
        else if ai_option == 2{
            ember()
        }
        else if ai_option == 3{
            firestorm()
        }
    }
    
    
    
    
    
    
    
    
    
}
