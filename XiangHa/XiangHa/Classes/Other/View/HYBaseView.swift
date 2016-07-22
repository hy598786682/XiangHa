//
//  HYBaseView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/22.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYBaseView: UIView {

    
    class func view() -> HYBaseView! {
        
        /**
         *  NSStringFromClass 获取到的类名有前缀
         */
       return (NSBundle.mainBundle().loadNibNamed(NSStringFromClass(self).componentsSeparatedByString(".").last, owner: nil , options: nil).first as? HYBaseView)!
        
    }

}
