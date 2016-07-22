//
//  UIButton-Extension.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/24.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

extension UIButton{



    ///便利构造方法 导航栏搜索按钮
    convenience  init(w:CGFloat,h :CGFloat,text : String ,target: AnyObject?,action : Selector) {
        self.init()
        
        setImage(UIImage (named: "z_home_search_bg_inputNew"), forState: .Normal)
        setImage(UIImage (named: "z_home_search_bg_inputNew"), forState: .Highlighted)
        
        //设置尺寸

        frame = CGRectMake(0, 0, w, h)
        setTitle(text, forState: .Normal)
        setTitleColor(UIColor.lightTextColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(14)
        
        backgroundColor = HYcolor(242, 0, 2)
        
        layer.cornerRadius = 5
        
        clipsToBounds = true
        
        addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
     
    }




}