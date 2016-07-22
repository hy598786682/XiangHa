//
//  HYRoundCornerImageView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/24.
//  Copyright © 2016年 ios. All rights reserved.
//

//圆角图片

import UIKit


class HYRoundCornerImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3
        
        clipsToBounds = true
    }
}
