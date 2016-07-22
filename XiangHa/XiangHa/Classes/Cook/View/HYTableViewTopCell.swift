//
//  HYTableViewTopCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/22.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYTableViewTopCell: HYBaseTableViewCell {
    
    ///监听点击事件回调闭包
    var onclick:((UIButton) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()      
        // Initialization code
    }
    
}

// MARK: - 监听
extension HYTableViewTopCell{

    @IBAction func onClick(sender: AnyObject) {
        guard let onclick =  onclick else {
        return
        }
        onclick(sender as! UIButton)
    }
    
    

}