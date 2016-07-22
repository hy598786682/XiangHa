//
//  HYBaseTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

//点击不变色

import UIKit

class HYBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        //点击不变色
        selectionStyle = .None
    }
    
}
