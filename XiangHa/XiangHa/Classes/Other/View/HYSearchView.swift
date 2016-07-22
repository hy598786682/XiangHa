//
//  HYSearchView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/22.
//  Copyright © 2016年 ios. All rights reserved.
//


///搜索View

import UIKit

class HYSearchView: HYBaseView {

    @IBOutlet weak var textView: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = HYcolor(242, 0, 2)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
