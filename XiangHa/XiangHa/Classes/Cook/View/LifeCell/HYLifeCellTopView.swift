//
//  HYLifeCellTopView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeCellTopView: HYBaseView {

/// 头像Icon
    @IBOutlet weak var iconImageView: HYRoundImageView!

///昵称
    @IBOutlet weak var nickNameLabel: UILabel!

///地址
    @IBOutlet weak var addressLabel: UILabel!
///地址背景
    @IBOutlet weak var addressBackgroundView: HYRoundCornerView!

    
    var lifeItem : HYLifeItem?{

        didSet{
        
        iconImageView.sd_setImageWithURL(NSURL(string: (lifeItem?.customer?.img)!), placeholderImage: UIImage (named: "headDefault"))
        
        nickNameLabel.text = lifeItem?.customer?.nickName
        
        addressLabel.text = lifeItem?.city
    //如果没有地址则隐藏
  addressBackgroundView.hidden = lifeItem?.city?.characters.count == 0
        
     
            
        }
    
    }

    
}
