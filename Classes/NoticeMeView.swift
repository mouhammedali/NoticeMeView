//
//  BlinkView.swift
//  BlinkCocoaPod
//
//  Created by Mouhammed Ali on 4/30/19.
//  Copyright © 2019 Mouhammed Ali. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class NoticeMeView: UIView {
    let layerAnimation = CABasicAnimation(keyPath: "shadowRadius")
    @IBInspectable var glowDuration : CGFloat = 0
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var maxGlowSize : CGFloat = 0
    @IBInspectable var minGlowSize : CGFloat = 0
    @IBInspectable var glowColor : UIColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    @IBInspectable var glowOn:Bool = false
    @IBInspectable var blinkOn:Bool = false
    @IBInspectable var blinkDuration : Double = 1
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentScaleFactor = UIScreen.main.scale
        self.layer.masksToBounds = false
        self.setupView()
        self.startAnimation()
        self.blink()
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    func setupView()
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowPath = CGPath(roundedRect: self.bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)
        self.layer.shadowColor = glowColor.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = maxGlowSize
        self.layer.shadowOpacity = 1
    }
    
    func startAnimation()
    {
        if !glowOn {
            return
        }
        layerAnimation.fromValue = maxGlowSize
        layerAnimation.toValue = minGlowSize
        layerAnimation.autoreverses = true
        layerAnimation.isAdditive = false
        layerAnimation.duration = CFTimeInterval(glowDuration/2)
        layerAnimation.fillMode = CAMediaTimingFillMode.forwards
        layerAnimation.isRemovedOnCompletion = false
        layerAnimation.repeatCount = .infinity
        self.layer.add(layerAnimation, forKey: "glowingAnimation")
        
    }
    
    func blink(){
        if !blinkOn {
            return
        }
        self.alpha = 0.2
        UIView.animate(withDuration:blinkDuration , delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.alpha = 1.0}, completion: nil)
    }
    
}

