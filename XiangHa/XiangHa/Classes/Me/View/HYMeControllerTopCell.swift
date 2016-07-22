//
//  HYMeControllerTopCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/6.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYMeControllerTopCell: HYBaseTableViewCell {

    //头像昵称topView
    private weak var topView : HYMeControllerTopView?
    //底部View
    private weak var bottomView : HYMeControllerTopBottomView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundView = UIImageView(image: UIImage (named: "z_me_head_banner_bg_new"))
        setupAllChildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    
    private func setupAllChildViews() {
        
     topView = HYMeControllerTopView.view() as? HYMeControllerTopView
     contentView.addSubview(topView!)
    bottomView = HYMeControllerTopBottomView.view() as? HYMeControllerTopBottomView
      contentView.addSubview(bottomView!)
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        
    let topViewX :CGFloat = 0
    let topViewY :CGFloat = 80
    let topViewW :CGFloat = HYScreenW
    let topViewH : CGFloat = topViewW * 0.15
        
    topView?.frame = CGRectMake(topViewX, topViewY, HYScreenW, topViewH)
    
        
        let bottomViewX : CGFloat = 0
        let bottomViewW : CGFloat = HYScreenW
        let bottomViewH : CGFloat = topViewW * 0.13
        let bottomViewY : CGFloat = HY_height - bottomViewH
        
    bottomView?.frame = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH)
        
        
    }
    

}
