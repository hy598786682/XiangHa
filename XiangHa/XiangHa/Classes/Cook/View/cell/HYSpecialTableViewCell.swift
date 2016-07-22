//
//  HYSpecialTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYSpecialTableViewCell: HYBaseTableViewCell {

    
   ///背景图片
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    ///标题
    @IBOutlet weak var titleLabel: UILabel!
   ///内容
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    var specialItem :HYSpecialItem? {
    
        didSet{
        backgroundImageView.sd_setImageWithURL(NSURL (string: (specialItem?.imgs)!))
            
        titleLabel.text = specialItem?.title
        
        subTitleLabel.text = specialItem?.subtitle
        }
    
    
    }
    
    
}
