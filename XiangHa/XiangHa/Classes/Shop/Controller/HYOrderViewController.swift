//
//  HYOrderViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/19.
//  Copyright © 2016年 ios. All rights reserved.
// 订单界面

import UIKit

class HYOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      setup()
        
    }

    }

extension HYOrderViewController {

    
    
    /**
     初始化
     */
    private func setup() {
        view.backgroundColor = UIColor.whiteColor()
          navigationItem.title = "我的订单"
    }


}