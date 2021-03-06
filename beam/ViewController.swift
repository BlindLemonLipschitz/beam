//
//  ViewController.swift
//  beam
//
//  Created by Jason P Allen on 6/9/14.
//  Copyright (c) 2014 Jason P Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Results will include Packout Time and Number of Boxes Needed
    @IBOutlet var results : UILabel!
    
    //Boxes Needed Label
    @IBOutlet var boxesNeeded : UILabel!
    
    // Number of Passes connections from Storyboard
    @IBOutlet var numPassLabel : UILabel!
    @IBOutlet var numPassSlider : UISlider!
    @IBOutlet var numPassResults : UILabel!
    @IBAction func updateNumPass(sender : AnyObject) {sliderChangedValue(numPassSlider,label: numPassResults,step: 1)
    }
    
    // Current Pass connections from Storyboard
    @IBOutlet var currentPassLabel : UILabel!
    @IBOutlet var currentPassSlider : UISlider!
    @IBOutlet var currentPassResults : UILabel!
    @IBAction func updateCurrentPass(sender : AnyObject) {sliderChangedValue(currentPassSlider,label: currentPassResults,step: 1)
    }
    
    // Rate connections from storyboard
    @IBOutlet var rateLabel : UILabel!
    @IBOutlet var rateSlider : UISlider!
    @IBOutlet var rateResults : UILabel!
    @IBAction func updateRate(sender : AnyObject) {
        sliderChangedValue(rateSlider,label:rateResults,step:250)
    }
    
    // Weight of increasing
    @IBOutlet var increasingL : UILabel!
    @IBOutlet var increasingLabel : UILabel!
    @IBOutlet var increasingSwitch : UISwitch!
    @IBAction func updateSwitch(sender : AnyObject) {switchChangedValue()}
    
    // Weight of Blender B
    @IBOutlet var weightOfBLabel : UILabel!
    @IBOutlet var weightOfBSlider : UISlider!
    @IBOutlet var weightOfBResults : UILabel!
    @IBAction func updateWeightOfB(sender : AnyObject) {
        sliderChangedValue(weightOfBSlider,label:weightOfBResults,step:250)
        boxesNeed()
    }
    
    // Weight of Blender A
    @IBOutlet var weightOfALabel : UILabel!
    @IBOutlet var weightOfASlider : UISlider!
    @IBOutlet var weightOfAResults : UILabel!
    @IBAction func updateWeightOfA(sender : AnyObject) {
        sliderChangedValue(weightOfASlider,label:weightOfAResults,step:250)
        boxesNeed()
    }
    
    // Weight of Boxes
    @IBOutlet var weightOfBoxesLabel : UILabel!
    @IBOutlet var weightOfBoxesResults : UILabel!
    @IBOutlet var weightOfBoxesSlider : UISlider!
    @IBAction func updateWeightOfBoxes(sender : AnyObject) {
        sliderChangedValue(weightOfBoxesSlider,label:weightOfBoxesResults,step:100)
        boxesNeed()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configurenumPassSlider()
    }
    
    func configurenumPassSlider() {
        numPassSlider.minimumValue = 1
        numPassSlider.maximumValue = 30
        numPassSlider.value        = 6
        numPassSlider.continuous   = true
        // Current Pass
        currentPassSlider.minimumValue = 1
        currentPassSlider.maximumValue = 30
        currentPassSlider.value        = 1
        currentPassSlider.continuous   = true
        // Rate
        rateSlider.minimumValue = 1
        rateSlider.maximumValue = 24
        rateSlider.value        = 18
        rateSlider.continuous   = true
        // Weight of B
        weightOfBSlider.minimumValue = 1
        weightOfBSlider.maximumValue = 120
        weightOfBSlider.value        = 1
        weightOfBSlider.continuous   = true
        // Weight of A
        weightOfASlider.minimumValue = 1
        weightOfASlider.maximumValue = 120
        weightOfASlider.value        = 1
        weightOfASlider.continuous   = true
        // Weight of Boxes
        weightOfBoxesSlider.minimumValue = 1
        weightOfBoxesSlider.maximumValue = 16
        weightOfBoxesSlider.value        = 13
        weightOfBoxesSlider.continuous   = true
    }
    // Actions
    func sliderChangedValue(slider: UISlider, label: UILabel, step: Int) {
        label.text   = "\(Int(slider.value) * step)"
        results.text = convert(calculatePackoutTime())
    }
    
    func switchChangedValue() {
        if (increasingSwitch.on){
            increasingL.text = "A"
            results.text = convert(calculatePackoutTime())
        }
        else{
            increasingL.text = "B"
            results.text = convert(calculatePackoutTime())
        }
    }
         // Test new date formatter
    func convert(add:Double) -> String {
        
        var date = NSDate(timeIntervalSinceNow: 3600.00 * add)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "'Packout: 'MMM dd, hh:mm a"
        return formatter.stringFromDate(date)
    }
    
    // Calculate Packout Time
    func calculatePackoutTime() -> Double{
        var weightLeftInCurrentPass = Double(0)
        var passesAdjusted = Int(numPassSlider.value - 1)
        var passesLeft = Int(passesAdjusted - Int(currentPassSlider.value))
        //var weightAdded = Int(weightOfAResults.text.toInt()!) + Int(weightOfBResults.text.toInt()!)
        var weightA = Int(weightOfASlider!.value)
        var weightB = Int(weightOfBSlider!.value)
        var weightAdded = Double(weightA + weightB)
        if (increasingSwitch.on){
            weightLeftInCurrentPass = Double(weightB)
        }
        else{
            weightLeftInCurrentPass = Double(weightA)
            
        }
        var weightCalculated = (Double(weightAdded) * Double(passesLeft)) + Double(weightLeftInCurrentPass)
        var rate = Int(rateSlider.value)
        var hoursToPackout = weightCalculated / Double(rate)
        
        return Double(hoursToPackout)
    }
    func boxesNeed() {
        var weightA = Int(weightOfASlider!.value)
        var weightB = Int(weightOfBSlider!.value)
        var box = (Int(weightOfASlider!.value) + Int(weightOfBSlider!.value)) * 25 / (Int(weightOfBoxesSlider!.value) * 10)
        if ((Int(weightOfASlider!.value) + Int(weightOfBSlider!.value)) * 25 % (Int(weightOfBoxesSlider!.value) * 10)) != 0 {
            box = (box + 1)
        }
        boxesNeeded.text = "Boxes Needed: \(box)"
    }
}