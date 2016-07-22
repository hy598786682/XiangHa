//
//  HYLifeBottomTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/7.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeBottomTableViewCell: UITableViewCell {

    var menuView : UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
  override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let menuVc = HYLifeMenuViewController()
         menuView = menuVc.view
        contentView.addSubview(menuView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        menuView?.frame = CGRectMake(0, 0, HYScreenW, HYScreenH)
        
    }

}
