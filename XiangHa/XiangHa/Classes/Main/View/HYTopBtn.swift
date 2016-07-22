//
//  HYTopBtn.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/1.
//  Copyright © 2016年 ios. All rights reserved.
//

//图片在上方的button
import UIKit

class HYTopBtn: UIButton {

    var margin : CGFloat = 10
    /**
     图片在上面的Button
     */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.HY_centerX = HY_width * 0.5
        imageView?.HY_centerY = HY_height * 0.5 * 0.8
        
        titleLabel?.sizeToFit()
        
        titleLabel?.HY_centerX = HY_width * 0.5
        titleLabel?.HY_y = CGRectGetMaxY((imageView?.frame)!) + margin

    }
}