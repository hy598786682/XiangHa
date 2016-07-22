//
//  HYCollectionViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/25.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vipImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var UserImage: HYRoundImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var userItem : HYActiveUser? {
    
        didSet{
        
        guard  let userItem : HYActiveUser = userItem else {
        return
        }
            
        vipImage.hidden = userItem.isGourmet == 1 ? true : false
        nickNameLabel.text = userItem.nickName
        //NTB4NTA 标清图片替换成高清图片 MTUweDE1MA
       let iconUrl = (userItem.img as NSString).stringByReplacingOccurrencesOfString("NTB4NTA", withString: "MTUweDE1MA")
        UserImage.sd_setImageWithURL(NSURL (string: iconUrl), placeholderImage: UIImage (named: "headDefault"))
        }
    }
}
