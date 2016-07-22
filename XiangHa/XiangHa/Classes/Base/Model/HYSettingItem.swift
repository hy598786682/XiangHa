//
//  HYSettingItem.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/5.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYSettingItem: NSObject {

    
     /// 图标
    var image : UIImage?
    
     /// 标题
    var title : String?
    
    
     /// 子标题
    var subTitle : String?
    
     /// 点击这行cell要做的事情
    var operation : ((indexPath : NSIndexPath) -> ())?
    
    
     ///图片标题构造方法
    init(image : UIImage? , title : String){
    self.image = image
    self.title = title
    }
    
    ///标题构造方法
    init(title : String){
    self.title = title
    }
    
    override init() {
        super.init()
    }
    
    
    
}
