//
//  HYRoundImageView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/25.
//  Copyright © 2016年 ios. All rights reserved.
//

///圆形的图片

import UIKit

class HYRoundImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.HY_width * 0.5
        
        clipsToBounds = true
        
    }

}
