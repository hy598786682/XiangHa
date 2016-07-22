//
//  HYRoundCornerBtn.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/20.
//  Copyright © 2016年 ios. All rights reserved.
//


/// 圆角button
import UIKit

class HYRoundCornerBtn: UIButton {

 
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3
        
        clipsToBounds = true
    }
    
}
