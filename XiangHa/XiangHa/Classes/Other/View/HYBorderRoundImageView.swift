//
//  HYBorderRoundImageView.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/7.
//  Copyright © 2016年 ios. All rights reserved.
//

/// 带边框的圆形图片

import UIKit

class HYBorderRoundImageView: HYRoundImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = 3
        layer.borderColor = HYBorderColor.CGColor
    }
    

}
