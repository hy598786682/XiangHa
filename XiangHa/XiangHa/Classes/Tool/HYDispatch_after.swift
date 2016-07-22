//
//  HYDispatch_after.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/30.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

///延时执行

class HYDispatch_after: NSObject {

  static func execute(delay:Double, blok:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), blok)
    
    }
    
    
    
    
    
}
