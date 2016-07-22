//
//  HYLifeTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeTableViewCell: UITableViewCell {

   //顶部头像昵称topView
   private weak var topView : HYLifeCellTopView?
    //标题titleView
   private weak var titleView : HYLifeCellTitleView?
    //中间图片View
   private weak var middleImageView : HYLifeCellImageView?
   //内容View
   private weak var contentLabelView : HYLifeCellContentView?
   //底部View
   private weak var bottomView : HYLifeCellBottomView?
    
    var lifeViewItem : HYLifeViewItem?{
        
        didSet{
        //设置topView的数据 frame
        topView?.lifeItem = lifeViewItem?.lifeItem
        topView?.frame = (lifeViewItem?.topViewFrame)!
        
        titleView?.lifeItem = lifeViewItem?.lifeItem
        titleView?.frame = (lifeViewItem?.titleViewFrame)!
        
        middleImageView?.lifeItem = lifeViewItem?.lifeItem
        middleImageView?.frame = (lifeViewItem?.middleImageViewFrame)!
            
        contentLabelView?.lifeItem = lifeViewItem?.lifeItem
        contentLabelView?.frame = (lifeViewItem?.contentLabelFrame)!
            
        bottomView?.lifeItem = lifeViewItem?.lifeItem
        bottomView?.frame = (lifeViewItem?.bottomViewFrame)!
            
        }
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addAllChildrenView()
        //点击不变色
        selectionStyle = .None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

// MARK: - 添加子控件
extension HYLifeTableViewCell{
    ///添加所有子控件
    private func addAllChildrenView()  {
    
    ///1.添加topView
    self.topView = HYLifeCellTopView.view() as? HYLifeCellTopView
    contentView.addSubview(topView!)
        
    ///2.添加titleView
    self.titleView = HYLifeCellTitleView.view() as? HYLifeCellTitleView
    contentView.addSubview(titleView!)
        
    ///3.添加imageView
    self.middleImageView = HYLifeCellImageView.view() as? HYLifeCellImageView
    contentView.addSubview(middleImageView!)
    ///4.添加contentView
    self.contentLabelView = HYLifeCellContentView.view() as?
        HYLifeCellContentView
    contentView.addSubview(contentLabelView!)
    ///5.添加bottomView
    self.bottomView = HYLifeCellBottomView.view() as? HYLifeCellBottomView
    contentView.addSubview(bottomView!)
    }

    

    
    
    


}

