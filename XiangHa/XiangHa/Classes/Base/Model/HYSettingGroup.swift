//
//  HYSettingGroup.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/5.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYSettingGroup: NSObject {
    
    
     /// 行模型数组
    var items : [NSObject]?
     /// 头部标题
    var headerTitle : String?
     /// 尾部标题
    var footTitle : String?
    
    /**
     类构造方法
     
     - parameter items: 行模型数组
     
     - returns: 带有行模型数组的实例
     */
    
    static func groupWithItems(items : [NSObject]) -> HYSettingGroup {
        
    let instance  = HYSettingGroup()
        
    instance.items = items
        
    return instance
        
    }
    
    
    
    
    
    
    
    
}
