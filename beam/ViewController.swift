//
//  ViewController.swift
//  beam
//
//  Created by Jason P Allen on 6/9/14.
//  Copyright (c) 2014 Jason P Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // results will include Packout Time 
    // and Number of Boxes Needed
    @IBOutlet var results : UILabel
    // Number of Passes connections from Storyboard
    @IBOutlet var numPassLabel : UILabel
    @IBOutlet var numPassSlider : UISlider
    @IBAction func updateNumPass(sender : AnyObject) {sliderChangedValue(numPassSlider)
    }
    
    // Current Pass connections from Storyboard
    @IBOutlet var currentPassLabel : UILabel
    @IBOutlet var currentPassSlider : UISlider
    @IBAction func updateCurrentPass(sender : AnyObject) {sliderChangedValue(currentPassSlider)
    }
    
    // rate connections from storyboard
    
    @IBOutlet var rateLabel : UILabel
    @IBOutlet var rateSlider : UISlider
    @IBAction func updateRate(sender : AnyObject) {
        sliderChangedValue(rateSlider)
    }
    
    // Weight of increasing
    @IBOutlet var increasingLabel : UILabel
    @IBOutlet var increasingSwitch : UISwitch
    @IBAction func updateSwitch(sender : AnyObject) {
        switchChangedValue()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configurenumPassSlider()
    }
    
    
    func configurenumPassSlider() {
        numPassSlider.minimumValue = 1
        numPassSlider.maximumValue = 30
        numPassSlider.value        = 1
        numPassSlider.continuous   = true
        //Current Pass
        currentPassSlider.minimumValue = 1
        currentPassSlider.maximumValue = 30
        currentPassSlider.value        = 1
        currentPassSlider.continuous   = true
        //rate
        rateSlider.minimumValue = 500
        rateSlider.maximumValue = 6000
        rateSlider.value        = 1000
        rateSlider.continuous   = true
        
    }
    //Actions
    func sliderChangedValue(slider: UISlider) {
        results.text = "\(Int(slider.value) * 5)"
    }
    
    func switchChangedValue() {
        if (increasingSwitch.on){
            increasingLabel.text = "Weight of Blender A is increasing"
        }
        else{
           increasingLabel.text = "Weight of Blender B is increasing"
        }
    }

}
