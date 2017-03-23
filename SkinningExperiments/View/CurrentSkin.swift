//
//  CurrentSkin.swift
//  SkinningExperiments
//
//  Created by Henrik Top Mygind on 23/03/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

extension UILabel {
    func setFontSize(_ size: CGFloat) {
        self.font = UIFont(name: self.font.fontName, size: size)
    }
}

extension UIView {
    func addFilledSubview(_ subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(subView)
        
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: self.topAnchor),
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subView.leftAnchor.constraint(equalTo: self.leftAnchor),
            subView.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
    }
}

protocol Skin {
    var titleFontSize: CGFloat { get }
    var inputLabelFontSize: CGFloat { get }
    
    var fontColor: UIColor { get }
    
    var loginBackground: UIView { get }
    
}

extension Skin {
    var titleFontSize: CGFloat { return CGFloat(18) }
    var inputLabelFontSize: CGFloat {  return CGFloat(14) }
    
    var fontColor: UIColor { return .black }
}

@IBDesignable
class CurrentSkin: NSObject {
    
    let currentSkin: Skin = SkinB()
    
    @IBOutlet var titleLabels: [UILabel] = [] {
        didSet {
            titleLabels.forEach{ label in
                label.setFontSize(currentSkin.titleFontSize)
                label.textColor = currentSkin.fontColor
            }
        }
    }
    
    @IBOutlet var inputLabels: [UILabel] = [] {
        didSet {
            inputLabels.forEach{ label in
                label.setFontSize(currentSkin.inputLabelFontSize)
                label.textColor = currentSkin.fontColor
            }
        }
    }
    
    @IBOutlet var loginBackground: UIView? = nil {
        didSet {
            guard let loginBackground = loginBackground else { return }
            
            loginBackground.addFilledSubview(currentSkin.loginBackground)
        }
    }
}
