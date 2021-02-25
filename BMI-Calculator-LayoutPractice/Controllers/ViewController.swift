//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var bgView = UIImageView(image: UIImage(imageLiteralResourceName: "calculate_background"))
    var cf = CommonFunctionality()
    
    var heightSliderHC = UIHostingController(rootView: HeightView())
    var heightValue: Double = 0.0 {
        didSet {
            let userinfo: [String: Double] = ["heightValue": self.heightValue]
            NotificationCenter.default.post(Notification(name: .heightValue, object: nil, userInfo: userinfo))
        }
    }
    var weightSliderHC = UIHostingController(rootView: WeightView())
    
    // Labels
    var titleLabel = UILabel()
    var calculateButton = UIButton()
    var descLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cf = CommonFunctionality(self)
        
        self.view.addSubview(bgView)
        
        cf.setLabel(titleLabel, as: "C A L C U L T E\nYOUR BMI\nNOW!", of: .clear, with: 12, in: self, AutoLayoutConstraints(subView: titleLabel, width: cf.screenWidth, height: cf.screenHeight / 4, yCentered: false), textAlignment: .left)
        
        cf.setButton(calculateButton, as: "C A L C U L A T E", of: UIColor(red: 0.3843, green: 0.3803, blue: 0.6117, alpha: 1.0), with: 15, in: self, AutoLayoutConstraints(subView: calculateButton, width: cf.screenWidth * 0.85, height: cf.screenHeight / 11, yOffset: cf.screenHeight / 18, yCentered: false, yTop: false))
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed(_:)), for: .touchUpInside)
        
        cf.setLabel(descLabel, as: "made by tezz-io", of: .clear, with: 18, in: self, AutoLayoutConstraints(subView: descLabel, width: cf.screenWidth, height: cf.screenHeight / 15, yCentered: false, yTop: false), fontColor: .darkGray)
        
        cf.setSwiftUIView(heightSliderHC, self, AutoLayoutConstraints(subView: heightSliderHC.view!, width: cf.screenWidth, height: cf.screenHeight / 8, yOffset: cf.screenHeight / 6, yCentered: false, yTop: false), backgroundColor: .clear)
        
        cf.setSwiftUIView(weightSliderHC, self, AutoLayoutConstraints(subView: weightSliderHC.view!, width: cf.screenWidth, height: cf.screenHeight / 8, yOffset: cf.screenHeight / 3.2, yCentered: false, yTop: false), backgroundColor: .clear)
    }
    
    @objc func calculateButtonPressed(_ sender: UIButton) {
        let height = Int(sharedObject.heightValue * 150 + 80)
        let weight = Int(sharedObject.weightValue * 120 + 25)
        let bmi = Double(weight) / (Double(height * height) / 10000.0)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = String(format: "%.3f", bmi)
        resultVC.outcomeValue = outcomeMessage(bmi)
        
        self.present(resultVC, animated: true, completion: nil)
    }
}

extension Notification.Name {
    static var heightValue: Notification.Name { return .init("heightValue") }
}
