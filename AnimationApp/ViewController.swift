//
//  ViewController.swift
//  AnimationApp
//
//  Created by  Apple24 on 12/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contX: NSLayoutConstraint!
    @IBOutlet var animationView: UIView!
    @IBOutlet var animationButton: UIButton!
    @IBOutlet var labelOnView: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    
    var isPosition = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationButton.layer.cornerRadius = 10
        animationView.layer.cornerRadius = 10
    }
    
    @IBAction func leftButtonPresses(_ sender: UIButton) {
        let bounds: CGRect = UIScreen.main.bounds
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height
        

        //      пульсар
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
        })
        
        if isPosition {
            
            UIView.animate(withDuration: 0.7, delay: 0.2, options: .curveEaseOut, animations: {
                var leftFrame = CGRect(x: 0, y: 0, width: width - width / 7 , height: height)
                leftFrame.origin.x += 0
                self.contX.constant += width - (width / 7)
                self.imageView.frame = leftFrame
                
            })
            self.isPosition = !self.isPosition
            
        } else {
            
            UIView.animate(withDuration: 2, delay: 0.2, options: .curveEaseIn, animations: {
                var leftFrame = CGRect(x: 0, y: 18, width: 0 , height: height)
                leftFrame.origin.x -= 0
                self.imageView.frame = leftFrame
                
            }, completion: { _ in
                self.contX.constant = 0         // По окончании
            })
            self.isPosition = !self.isPosition
        }
    }
    
    @IBAction func runAnimationButton(_ sender: UIButton) {
        
        //    sender.flash()    // мигает
        //    sender.shake()    // дребезжит
        sender.pulsate()        // пульсар
                
        UIView.animate(withDuration: 2,                               // время
            animations: {                                     // что происходит
                self.labelOnView.backgroundColor = #colorLiteral(red: 0.7032769322, green: 0.4804401994, blue: 0.5014742613, alpha: 1)
                self.labelOnView.layer.masksToBounds = true
                self.labelOnView.layer.cornerRadius = 10
                self.animationButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 1, blue: 0, alpha: 1)
                self.animationView.transform = CGAffineTransform(rotationAngle: .pi / 2 )  // вращение
        }) { flag in                                          // По окончании
            if flag {
                UIView.animate(withDuration: 2, animations: {
                    self.labelOnView.backgroundColor = #colorLiteral(red: 0.7024293664, green: 0.4835062623, blue: 0.5, alpha: 1)
                    self.labelOnView.layer.cornerRadius = 10
                    self.animationView.transform = CGAffineTransform(rotationAngle: -.pi )  // вращение
                    self.animationButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0, alpha: 1)
                })
            }
        }
    }
    
}
