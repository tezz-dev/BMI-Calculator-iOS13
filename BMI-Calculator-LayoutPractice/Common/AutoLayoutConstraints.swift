//
//  AutoLayoutConstraints.swift
//  Quizzler-iOS13
//
//  Created by tezz on 23/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct AutoLayoutConstraints {
    var subView: UIView
    var width: CGFloat
    var height: CGFloat
    var xOffset: CGFloat = 0.0
    var yOffset: CGFloat = 0.0
    var xCentered: Bool = true
    var yCentered: Bool = true
    var xLeading: Bool = true
    var yTop: Bool = true
    
    func setAutoConstraints(_ viewController: UIViewController) {
                    
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(
           item: subView,
           attribute: NSLayoutConstraint.Attribute.width,
           relatedBy: NSLayoutConstraint.Relation.equal,
           toItem: nil,
           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
           multiplier: 1,
            constant: width
        )
        let heightConstraint = NSLayoutConstraint(
           item: subView,
           attribute: NSLayoutConstraint.Attribute.height,
           relatedBy: NSLayoutConstraint.Relation.equal,
           toItem: nil,
           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
           multiplier: 1,
            constant: height
        )
        var xConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: viewController.view,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0
        )
        var yConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: viewController.view,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        if !xCentered {
            if xLeading {
                xConstraint = NSLayoutConstraint(
                   item: subView,
                   attribute: NSLayoutConstraint.Attribute.leading,
                   relatedBy: NSLayoutConstraint.Relation.equal,
                   toItem: viewController.view,
                   attribute: NSLayoutConstraint.Attribute.leadingMargin,
                   multiplier: 1.0,
                    constant: xOffset
                )
            }
            else {
                xConstraint = NSLayoutConstraint(
                   item: subView,
                   attribute: NSLayoutConstraint.Attribute.trailing,
                   relatedBy: NSLayoutConstraint.Relation.equal,
                   toItem: viewController.view,
                   attribute: NSLayoutConstraint.Attribute.trailingMargin,
                   multiplier: 1.0,
                    constant: -xOffset
                )
            }
        }
        if !yCentered {
            if yTop {
                yConstraint = NSLayoutConstraint(
                    item: subView,
                    attribute: NSLayoutConstraint.Attribute.top,
                    relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: viewController.view,
                    attribute: NSLayoutConstraint.Attribute.topMargin,
                    multiplier: 1.0,
                    constant: yOffset
                )
            }
            else {
                yConstraint = NSLayoutConstraint(
                    item: subView,
                    attribute: NSLayoutConstraint.Attribute.bottom,
                    relatedBy: NSLayoutConstraint.Relation.equal,
                    toItem: viewController.view,
                    attribute: NSLayoutConstraint.Attribute.bottomMargin,
                    multiplier: 1.0,
                    constant: -yOffset
                )
            }
        }
        viewController.view.addConstraints(
                [widthConstraint, heightConstraint, xConstraint, yConstraint]
        )
    }
}
