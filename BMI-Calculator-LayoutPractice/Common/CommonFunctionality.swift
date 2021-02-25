//
//  CommonFunctionality.swift
//  Quizzler-iOS13
//
//  Created by tezz on 23/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct CommonFunctionality {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var fontColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    
    init() {
        screenWidth = 0.0
        screenHeight = 0.0
    }
    
    init(_ viewController: UIViewController) {
        screenWidth = viewController.view.safeAreaLayoutGuide.layoutFrame.width - 32
        screenHeight = viewController.view.safeAreaLayoutGuide.layoutFrame.height - 32
    }
    
    func setSwiftUIView(_ child: UIHostingController<HeightView>, _ viewController: UIViewController, _ autoLayoutConstraints: AutoLayoutConstraints, backgroundColor: UIColor = .clear) {
        child.view!.backgroundColor = .clear
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = viewController.view.bounds
        // First, add the view of the child to the view of the parent
        viewController.view.addSubview(child.view)
        // Then, add the child to the parent
        viewController.addChild(child)
        autoLayoutConstraints.setAutoConstraints(viewController)
    }
    
    func setSwiftUIView(_ child: UIHostingController<WeightView>, _ viewController: UIViewController, _ autoLayoutConstraints: AutoLayoutConstraints, backgroundColor: UIColor = .clear) {
        child.view!.backgroundColor = .clear
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = viewController.view.bounds
        // First, add the view of the child to the view of the parent
        viewController.view.addSubview(child.view)
        // Then, add the child to the parent
        viewController.addChild(child)
        autoLayoutConstraints.setAutoConstraints(viewController)
    }
    
    func setButton(_ button: UIButton, as title: String, of backgroundColor: UIColor, with sizeFactor: CGFloat, in viewController: UIViewController, _ autoLayoutConstraints: AutoLayoutConstraints, fontColor: UIColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0), fontStyle: String = "AvenirNext-Bold") {
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel!.font = UIFont(name: fontStyle, size: screenWidth / sizeFactor)
        button.setTitleColor(fontColor, for: .normal)
        button.layer.cornerRadius = screenHeight / sizeFactor * 0.45
        button.clipsToBounds = true
        button.layer.borderWidth = 4
        button.layer.borderColor = fontColor.cgColor
        viewController.view.addSubview(button)
        autoLayoutConstraints.setAutoConstraints(viewController)
    }
    
    func setLabel(_ label: UILabel, as text: String, of backgroundColor: UIColor, with sizeFactor: CGFloat, in viewController: UIViewController, _ autoLayoutConstraints: AutoLayoutConstraints, textAlignment: NSTextAlignment = .center, fontColor: UIColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0), fontStyle: String = "AvenirNext-Bold") {
        label.text = text
        label.textColor = fontColor
        label.numberOfLines = 0
        label.backgroundColor = backgroundColor
        label.font = UIFont(name: fontStyle, size: screenWidth / sizeFactor)
        label.textAlignment = textAlignment
        viewController.view.addSubview(label)
        autoLayoutConstraints.setAutoConstraints(viewController)
    }
    
}

struct x: View {
    var body: some View {
        Text("hi")
    }
}
