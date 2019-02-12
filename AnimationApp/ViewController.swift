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
    
    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    @IBOutlet var animationView: UIView!
    @IBOutlet var animationButton: UIButton!
    @IBOutlet var labelOnView: UILabel!
    @IBOutlet var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // по центру и не зависит от констрейна
        let animator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) {
            self.button.center.x = 50
            self.button.center.y = 50
        }
        
        
        self.animationView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 )
        
        
        animationButton.layer.cornerRadius = 10
        animationView.layer.cornerRadius = 10
        
        UIView.animate(withDuration: 3,                       // время
            animations: {                                     // что происходит
                self.animationView.center.x = 50
                self.animationButton.backgroundColor = .green
        }) { flag in                                          // По окончании
            print(flag)
            if flag {
                UIView.animate(withDuration: 3, animations: {
                    self.animationButton.backgroundColor = .orange
                })
            }
        }
        
        animator.startAnimation()
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 5, delay: 0, options: [.autoreverse], animations: {
            self.button.transform = CGAffineTransform(rotationAngle: .pi / 2)  // вращение
            //  один   self.button.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)   // масштабирование
        }) { position in
            print(#function, position)
            self.button.transform = CGAffineTransform.identity
        }
        
        let roundAnimator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) {
            self.button.layer.cornerRadius = 100
        }
        roundAnimator.startAnimation()
        
        
        
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
        
    }

 
    
    
    
     @IBAction func runAnimationButton(_ sender: UIButton) {
        
        // задержать старт
//        UIView.animateKeyframes(withDuration: 2,       // 2 cek
//            delay: 0.5,                                // задержка
//            options: [.autoreverse, .repeat ], // масиив с параметрами анимации
//            animations: {
//                self.animationView.frame.origin.x -= 20
//        })

        /*
        UIView.animate(withDuration: 5,              // 5 cek
            delay: 3,                                // задержка
            options: [.curveLinear, .autoreverse ],       // масиив с параметрами анимации  //.autoreverse повтор
            animations: {                            // что происходит
                self.animationView.frame.origin.x -= 20
                self.animationView.alpha = 0
        }, completion: { _ in
                self.animationView.alpha = 1           // По окончании
        })
        */
        
        view.layoutIfNeeded()
        centerX.constant = 100
        
        UIView.animate(withDuration: 5,                // общее время
                       delay: 0,                       // задержка
                       usingSpringWithDamping: 0.2,    // использование пружины с демпфированием
                       initialSpringVelocity: 0,       //начальная скорость пружины
                       options: [.autoreverse],                    // масиив с параметрами анимации
        animations: {
            self.view.layoutIfNeeded()
        },completion: { _ in
            self.centerX.constant = 0                  // констрейн
        })
        
        
        
        
     }

}
