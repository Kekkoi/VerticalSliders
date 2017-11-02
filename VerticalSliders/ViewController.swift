//
//  ViewController.swift
//  VerticalSliders
//
//  Created by Miklos Kekkoi on 10/24/17.
//  Copyright © 2017 Miklos Kekkoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // Setting mySlider’s minimum, maximum and starting value
        mySlider.minimumValue = 0
        mySlider.maximumValue = 10
        mySlider.value = 0
       
    
        
      // Transforming the slider from a horizontal into a vertical one
        mySlider.transform = CGAffineTransform(rotationAngle: 90 * (-.pi/180))
        
        // We can call this in our viewDidLoad so the label will start right above of the thumb
        setThumbPosition(horizontal: false)
        
    }


    
    @IBAction func sliderAction(_ sender: UISlider) {
        // We do not want a continous slider, therefore, we round the value of the slider
        mySlider.value = roundf(mySlider.value)
        // To see the current value of our mySlider we connect it with the sliderLabel. As our label’s text only accepts a String we cast the float value of mySlider into String
        sliderLabel.text = String(mySlider.value)
        
        // Let’s change the color of the thumb as it moves to various values
        
        switch mySlider.value {
        case 1...3:
            mySlider.thumbTintColor = UIColor.blue
        case 4...7:
            mySlider.thumbTintColor = UIColor.green
        case 8...10:
            mySlider.thumbTintColor = UIColor.yellow
        default:
            mySlider.thumbTintColor = UIColor.black
        }
        
        setThumbPosition(horizontal: false)
        
    }
    
    func setThumbPosition(horizontal: Bool) {
        // What if we want our label to follow the current position of the thumb
        // First we establish the drawing rectangle of the slider’s track
        let trackRect: CGRect = mySlider.trackRect(forBounds: mySlider.bounds)
        // Using the above calculated rectangle of the track, we also calculate the reactangle of the thumb which is moving as we are sliding it
        let thumbRect: CGRect = mySlider.thumbRect(forBounds: mySlider.bounds, trackRect: trackRect, value: mySlider.value)
        // With this we can set the label’s center to follow our thumb
        
        if horizontal {
            sliderLabel.center = CGPoint(x: thumbRect.origin.x + mySlider.frame.origin.x + 15, y: mySlider.frame.origin.y - 25)
        } else {
        // When going vertical we need a few modifications but the main thing too look after is switching the x and y coordinates
              sliderLabel.center = CGPoint(x: mySlider.frame.origin.x + 15, y: -thumbRect.origin.x + mySlider.frame.origin.y + 200)
        }
  
    }
    

}

