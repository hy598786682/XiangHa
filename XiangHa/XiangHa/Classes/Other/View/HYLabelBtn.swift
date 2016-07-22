//
//  HYLabelBtn.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/7.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLabelBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .Center
    }

    
}
