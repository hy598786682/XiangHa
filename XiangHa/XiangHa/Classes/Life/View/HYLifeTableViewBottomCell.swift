//
//  HYLifeTableViewBottomCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/13.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeTableViewBottomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var bottomView : UIView?{
        didSet{
            contentView.addSubview(bottomView!)
            bottomView!.frame = CGRectMake(0, 0, HYScreenW, HYScreenH)
        }
    }


}
