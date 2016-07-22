//
//  HYBaseItem.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/26.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYBaseItem: NSObject {

    override init() {
        super.init()
    }
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    

    
}
