//
//  ViewController.swift
//  GestureDemo
//
//  Created by liufengting on 16/5/13.
//  Copyright © 2016年 liufengting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var item : UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
        item = UIView.init(frame: CGRectMake(0, 20, 60, 60))
        item.backgroundColor = UIColor.grayColor()
        item.layer.cornerRadius = 10
        item.layer.masksToBounds = true
        self.view.addSubview(item)
        
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.delegate = self
        panGesture.addTarget(self, action: #selector(self.panGestureRecourgnized(_:)))
        self.view.addGestureRecognizer(panGesture)
        
        
        
    
    
    }

    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if CGRectContainsPoint(item.frame, gestureRecognizer.locationInView(self.view)) {
            return true
        }
        return false
    }
    func panGestureRecourgnized(gesture : UIPanGestureRecognizer){
        

        
        switch gesture.state {
        case .Changed:
            self.item.center = gesture.locationInView(self.view);
            break
        case .Ended:
            
            let endPoint = gesture.locationInView(self.view)
            if endPoint.x < self.view.frame.size.width/2 {
                UIView.animateWithDuration(0.3, animations: {
                    self.item.center = CGPointMake(self.item.frame.size.width/2, endPoint.y)
                })
              }else{
                UIView.animateWithDuration(0.3, animations: {
                    self.item.center = CGPointMake(self.view.frame.size.width - self.item.frame.size.width/2, endPoint.y)
                })

            }

        default:
            break
        }
        
        
        
    }
    
    
    
    

}

