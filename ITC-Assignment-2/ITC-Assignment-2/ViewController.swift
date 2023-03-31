//
//  ViewController.swift
//  ITC-Assignment-2
//
//  Created by Isaiah Ojo on 31/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodQuestionLabel: UILabel!
    
    @IBOutlet weak var foodQuestionLabelAnswerBox: UITextField!
    
    @IBOutlet weak var foodSubmitBox: UIButton!
    
    @IBOutlet weak var catImage: UIImageView!
    
    @IBOutlet weak var identityQuestionLabel: UILabel!
    
    @IBOutlet weak var identityQuestionAnswer: UITextField!
    
    @IBOutlet weak var identityQuestionSubmitBox: UIButton!
    
    @IBOutlet weak var whatIsYourAgeLabel: UILabel!
    
    @IBOutlet weak var ageSlider: UISlider!
    
    @IBOutlet weak var doYouLikeFantaQuestion: UILabel!
    
    @IBOutlet weak var doYoulikeFantaYesButton: UIButton!
    
    @IBOutlet weak var DoYouLikeFantaNoButton: UIButton!
    
    @IBOutlet weak var LogLabel: UILabel!
    
    @IBOutlet weak var DebugLabel: UILabel!
    
    @IBOutlet weak var TrackerLabel: UILabel!
    
    @IBOutlet var GPSLabel: UIView!
    
    @IBOutlet weak var LogSwitchButton: UISwitch!
    
    @IBOutlet weak var DebugButtonSwitch: UISwitch!
    
    @IBOutlet weak var TrackerLabelSwitch: UISwitch!
    
    @IBOutlet weak var GPSLabelSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodQuestionLabel.text = "What is your favourite drink?"
        
        identityQuestionLabel.text = "What is the image located above."
        
    }


}

