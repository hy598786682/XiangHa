//
//  HYRoundCornerView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/30.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYRoundCornerView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3
        clipsToBounds = true
    }

}
