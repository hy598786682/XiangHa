//
//  HYLifeItem.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

//生活圈

import UIKit

class HYLifeItem: HYBaseItem {

    ///用户
    var customer : HYCustomer? = nil
    
    ///类别
    var cName : String? = ""
    
    ///内容
    
    var content : String? = ""
    
    ///标题
    
    var title : String? = ""
    
    ///显示时间
    var timeShow : String? = ""
    
    ///评论数
    var commentNum : String = ""
    
    ///点赞数
    var likeNum : Int = 0
    
    ///图片数组
    var  imgs : [String]? = [String]()
    
    ///城市
    var city : String? = ""
    
    
}
