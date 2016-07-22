//
//  HYLifeBottomTableViewHeaderFooterView.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/13.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeBottomTableViewHeaderFooterView: UITableViewHeaderFooterView {
    var topView : UIView?{
        didSet{
        contentView.addSubview(topView!)
        topView!.frame = CGRectMake(0, 0, HYScreenW, 44)
        }
    }

}
