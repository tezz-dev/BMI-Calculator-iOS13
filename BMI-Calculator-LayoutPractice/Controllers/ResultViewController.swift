//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by tezz on 24/02/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import SwiftUI

func outcomeMessage(_ bmiValue: Double) -> String {
    switch bmiValue {
        case 0..<18.5:
            return "UNDERWEIGHT"
        case 18.5..<25:
            return "NORMAL"
        case 25..<30:
            return "OVERWEIGHT"
        case 30..<35:
            return "OBESE"
        default:
            return "MORBIDLY OBESE"
    }
}

class ResultViewController: UIViewController {
    var bgView = UIImageView(image: UIImage(imageLiteralResourceName: "result_background"))
    var cf = CommonFunctionality()
    
    let resultLabel = UILabel()
    let bmiLabel = UILabel()
    let outcomeLabel = UILabel()
    var descLabel = UILabel()
    let recalculateButton = UIButton()
    
    var outcomeValue = "MORBIDLY OBESE"
    var bmiValue = "100.001"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cf = CommonFunctionality(self)
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.4823, blue: 0.7725, alpha: 1.0)
        
        self.view.addSubview(bgView)
        let bgViewALC = AutoLayoutConstraints(subView: bgView, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        bgViewALC.setAutoConstraints(self)
        
        cf.setLabel(bmiLabel, as: bmiValue, of: .clear, with: 5, in: self, AutoLayoutConstraints(subView: bmiLabel, width: cf.screenWidth * 0.9, height: cf.screenHeight / 3))
        
        cf.setLabel(resultLabel, as: "YOUR BMI IS", of: .clear, with: 8, in: self, AutoLayoutConstraints(subView: resultLabel, width: cf.screenWidth, height: cf.screenHeight / 8, yOffset: cf.screenHeight / 3.3, yCentered: false))
        
        cf.setLabel(outcomeLabel, as: outcomeValue, of: .clear, with: 10, in: self, AutoLayoutConstraints(subView: outcomeLabel, width: cf.screenWidth, height: cf.screenHeight / 4, yOffset: cf.screenHeight / 4, yCentered: false, yTop: false))
        
        cf.setLabel(descLabel, as: "made by tezz-io", of: .clear, with: 18, in: self, AutoLayoutConstraints(subView: descLabel, width: cf.screenWidth, height: cf.screenHeight / 15, yCentered: false, yTop: false), fontColor: .white)
        
        cf.setButton(recalculateButton, as: "R E C A L C U L A T E", of: UIColor(red: 0.3843, green: 0.3803, blue: 0.6117, alpha: 1.0), with: 15, in: self, AutoLayoutConstraints(subView: recalculateButton, width: cf.screenWidth * 0.85, height: cf.screenHeight / 11, yOffset: cf.screenHeight / 18, yCentered: false, yTop: false))
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
