//
//  RootView.swift
//  HitTestDemo
//
//  Created by HMT on 15/6/26.
//  Copyright © 2015年 Tommy. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    var button_1: UIButton!
    var view_1: UIView!
    var button_2: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        p_setUpCustomView()
    }
    
    private func p_setUpCustomView() {
        button_1 = {
            let button = UIButton(type: .System)
            button.frame = CGRectMake(110, 180, 80, 40)
            button.backgroundColor = UIColor.orangeColor()
            button.setTitle("button_1", forState: .Normal)
            button.addTarget(self, action: Selector("clickNumber_1_Btn_Action:"), forControlEvents: .TouchUpInside)
            self.addSubview(button)
            return button
        }()
        
        view_1 = {
            let view = UIView(frame: CGRectMake(100, 100, 200, 300))
            view.backgroundColor = UIColor.orangeColor().colorWithAlphaComponent(0.7)
            self.addSubview(view)
            let label_1 = UILabel(frame: CGRectMake(0, 0, 60, 20))
            label_1.text = "view_1"
            view.addSubview(label_1)
            return view
        }()
        
        button_2 = {
            let button = UIButton(type: .System)
            button.frame = CGRectMake(100, 160, 80, 40)
            button.backgroundColor = UIColor.cyanColor()
            button.setTitle("button_2", forState: .Normal)
            button.addTarget(self, action: Selector("clickNumber_2_Btn_Action:"), forControlEvents: .TouchUpInside)
            self.view_1.addSubview(button)
            return button
            }()
    }
    
    func clickNumber_1_Btn_Action(btn: UIButton) {
        print("button_1 被点击了")
    }
    
    func clickNumber_2_Btn_Action(btn: UIButton) {
        print("button_2 被点击了")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("view_1 被点击了")
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let btn_1_Point = button_1.convertPoint(point, fromView: self)
        guard button_1.pointInside(btn_1_Point, withEvent: event) else {
            return super.hitTest(point, withEvent: event)
        }
        return button_1
    }

}








