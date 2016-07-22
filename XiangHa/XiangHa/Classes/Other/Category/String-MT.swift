//
//  String-MT.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/29.
//  Copyright © 2016年 ios. All rights reserved.
//

import Foundation



// MARK: - 获取高清图片路径
extension String{

    func getMT() -> String {
        
        return (self as NSString).stringByReplacingOccurrencesOfString("MjUweDA", withString: "MTAwMHgw") as String
    }


}