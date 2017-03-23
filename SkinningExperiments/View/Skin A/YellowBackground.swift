//
//  YellowBackground.swift
//  SkinningExperiments
//
//  Created by Henrik Top Mygind on 23/03/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

@IBDesignable
class YellowBackground: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        
        let colors = [ UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor,
                       UIColor(red: 1, green: 1, blue: 0.9, alpha: 1).cgColor]
        let locations: [CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                  colors: colors as CFArray,
                                  locations: locations) else {
        
                                    return
        }
        
        context?.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: rect.width, y: rect.height), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
    }

}
