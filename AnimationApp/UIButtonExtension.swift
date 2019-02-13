//
//  UIButtonExtension.swift
//  AnimationApp
//
//  Created by  Apple24 on 12/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//
//    sender.pulsate()  // пульсар
//    sender.flash()    // мигает
//    sender.shake()    // дребезжит
//    13.02.19 / promo


import UIKit

extension UIButton {
    
    func pulsate() { // пульсар
        // объект для изменения кнопки
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        // продолжительность анимации
        pulse.duration = 0.6
        // 0 исчезнит 1 реальная величена 0.05 заметно
        pulse.fromValue = 0.95
        //
        pulse.toValue = 1
        // автореверс
        pulse.autoreverses = true
        // коллличество повторов
        pulse.repeatCount = 3
        // ускарение
        pulse.initialVelocity = 0.5
        // затухание
        pulse.damping = 1
        // его форма кнопки
        
        layer.add(pulse, forKey: nil)
    }

    func flash() { // мигает
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() { // дребезжит
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}


        /*
         let start = self.imageView.center
 
         UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeCubic, animations: {
         UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
         self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
         }
 
         UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
         self.imageView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
         }
 
         UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
         self.imageView.center = CGPoint(x: self.view.bounds.width, y: start.y)
         }
 
         UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
         self.imageView.center = start
         }
         })
         */





