//
//  UIView+InterpolatingMotion.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-22.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit
import ObjectiveC

@IBDesignable public extension UIView {
    private struct AssociatedKeys {
        static var shadowMotionOffset: UInt8 = 0
        static var motionOffset: UInt8 = 0
    }
    
    @objc @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set(radius) {
            layer.cornerRadius = radius
        }
    }
    
    @objc @IBInspectable var borderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set(width) {
            layer.borderWidth = width
        }
    }
    
    @objc @IBInspectable var borderColor : UIColor? {
        get {
            return layer.borderColor as? UIColor? ?? nil
        }
        set(color) {
            layer.borderColor = color?.cgColor
        }
    }
    
    @objc @IBInspectable var shadowColor : UIColor? {
        get {
            return layer.shadowColor as? UIColor? ?? nil
        }
        set(color) {
            layer.shadowColor = color?.cgColor
        }
    }
    
    @objc @IBInspectable var shadowRadius : CGFloat {
        get {
            return layer.shadowRadius
        }
        set(radius) {
            layer.shadowRadius = radius
        }
    }
    
    @objc @IBInspectable var shadowOpacity : Float {
        get {
            return layer.shadowOpacity
        }
        set(opacity) {
            layer.shadowOpacity = opacity
        }
    }
    
    @objc @IBInspectable var shadowOffset : CGSize {
        get {
            return layer.shadowOffset
        }
        set(offset) {
            layer.shadowOffset = offset
        }
    }
    
    @objc @IBInspectable var shadowMotionOffset : CGSize {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.shadowMotionOffset) as? NSValue else {
                return .zero
            }
            
            return value.cgSizeValue
        }
        set(newSize) {
            var currentSize = CGSize.zero
            let currentValue = objc_getAssociatedObject(self, &AssociatedKeys.shadowMotionOffset) as? NSValue
            if currentValue != nil {
                currentSize = currentValue!.cgSizeValue
            }
            
            if currentSize.equalTo(newSize) {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.shadowMotionOffset, NSValue(cgSize: newSize), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            addInterpolatingMotionEffect(keyPath: "layer.shadowOffset.width", effectType: .tiltAlongHorizontalAxis, range: newSize.width)
            addInterpolatingMotionEffect(keyPath: "layer.shadowOffset.height", effectType: .tiltAlongVerticalAxis, range: newSize.height)
        }
    }
    
    @objc @IBInspectable var motionOffset : CGSize {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.motionOffset) as? NSValue else {
                return .zero
            }

            return value.cgSizeValue
        }
        set(newSize) {
            var currentSize = CGSize.zero
            let currentValue = objc_getAssociatedObject(self, &AssociatedKeys.motionOffset) as? NSValue
            if currentValue != nil {
                currentSize = currentValue!.cgSizeValue
            }
            
            if currentSize.equalTo(newSize) {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.motionOffset, NSValue(cgSize: newSize), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            addInterpolatingMotionEffect(keyPath: "center.x", effectType: .tiltAlongHorizontalAxis, range: newSize.width)
            addInterpolatingMotionEffect(keyPath: "center.y", effectType: .tiltAlongVerticalAxis, range: newSize.height)
        }
    }
    
    private func addInterpolatingMotionEffect(keyPath : String, effectType : UIInterpolatingMotionEffect.EffectType, range value : CGFloat) {
        for effect in motionEffects {
            if let interpolatingEffect = effect as? UIInterpolatingMotionEffect {
                if interpolatingEffect.keyPath == keyPath {
                    removeMotionEffect(interpolatingEffect)
                    break
                }
            }
        }
        
        if value == 0 {
            return
        }
        
        let effect = UIInterpolatingMotionEffect(keyPath: keyPath, type: effectType)
        if value < 0 {
            effect.minimumRelativeValue = -(abs(value));
            effect.maximumRelativeValue = abs(value);
        } else {
            effect.minimumRelativeValue = abs(value);
            effect.maximumRelativeValue = -(abs(value));
        }
        addMotionEffect(effect)
    }
}
