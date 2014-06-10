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
    @IBOutlet var numPassResults : UILabel
    @IBAction func updateNumPass(sender : AnyObject) {sliderChangedValue(numPassSlider,label: numPassResults,step: 1)
    }
    
    // Current Pass connections from Storyboard
    @IBOutlet var currentPassLabel : UILabel
    @IBOutlet var currentPassSlider : UISlider
    @IBOutlet var currentPassResults : UILabel
    @IBAction func updateCurrentPass(sender : AnyObject) {sliderChangedValue(currentPassSlider,label: currentPassResults,step: 1)
    }
    
    // rate connections from storyboard
    
    @IBOutlet var rateLabel : UILabel
    @IBOutlet var rateSlider : UISlider
    @IBOutlet var rateResults : UILabel
    @IBAction func updateRate(sender : AnyObject) {
        sliderChangedValue(rateSlider,label:rateResults,step:250)
    }
    
    // Weight of increasing
    @IBOutlet var increasingL : UILabel
    @IBOutlet var increasingLabel : UILabel
    @IBOutlet var increasingSwitch : UISwitch
    @IBAction func updateSwitch(sender : AnyObject) {switchChangedValue()}
    
    // Weight of Blender B
    @IBOutlet var weightOfBLabel : UILabel
    @IBOutlet var weightOfBSlider : UISlider
    @IBOutlet var weightOfBResults : UILabel
    @IBAction func updateWeightOfB(sender : AnyObject) {
        sliderChangedValue(weightOfBSlider,label:weightOfBResults,step:250)
    }
    
    // Weight of Blender A
    @IBOutlet var weightOfALabel : UILabel
    @IBOutlet var weightOfASlider : UISlider
    @IBOutlet var weightOfAResults : UILabel
    @IBAction func updateWeightOfA(sender : AnyObject) {
        sliderChangedValue(weightOfASlider,label:weightOfAResults,step:250)
    }
    
    // Weight of Boxes
    @IBOutlet var weightOfBoxesLabel : UILabel
    @IBOutlet var weightOfBoxesResults : UILabel
    @IBOutlet var weightOfBoxesSlider : UISlider
    @IBAction func updateWeightOfBoxes(sender : AnyObject) {
        sliderChangedValue(weightOfBoxesSlider,label:weightOfBoxesResults,step:100)
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
        rateSlider.minimumValue = 1
        rateSlider.maximumValue = 24
        rateSlider.value        = 1
        rateSlider.continuous   = true
        // weight of B
        weightOfBSlider.minimumValue = 1
        weightOfBSlider.maximumValue = 120
        weightOfBSlider.value        = 1
        weightOfBSlider.continuous   = true
        // weight of A
        weightOfASlider.minimumValue = 1
        weightOfASlider.maximumValue = 120
        weightOfASlider.value        = 1
        weightOfASlider.continuous   = true
        //weight of Boxes
        weightOfBoxesSlider.minimumValue = 1
        weightOfBoxesSlider.maximumValue = 16
        weightOfBoxesSlider.value        = 1
        weightOfBoxesSlider.continuous   = true
    }
    //Actions
    func sliderChangedValue(slider: UISlider, label: UILabel, step: Int) {
        results.text = "\(Int(slider.value) * step)"
        label.text   = "\(Int(slider.value) * step)"
    }
    
    func switchChangedValue() {
        if (increasingSwitch.on){
            increasingL.text = "A"
        }
        else{
           increasingL.text = "B"
        }
    }

}
