//
//  HYShadeView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

/**
 渐变色View
 */

import UIKit

class HYShadeView: UIView {

    let  gradientLayer =  CAGradientLayer()  // 设置渐变效果
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let colors : NSArray = NSArray (objects: UIColor.clearColor().CGColor , UIColor.blackColor().CGColor)
        gradientLayer.colors =  colors as [AnyObject]
        gradientLayer.startPoint = CGPointMake(0.5, 0.0);
        gradientLayer.endPoint = CGPointMake(0.5, 1.0);
        layer.addSublayer(gradientLayer)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        gradientLayer.frame = CGRectMake(0, 0, frame.width, frame.height)

    }

    
}
