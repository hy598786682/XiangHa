//
//  HYPublishView.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/1.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYPublishView: UIView {

 ///发帖按钮
    @IBOutlet weak var invitationBtn: HYTopCellBtn!

 ///写菜谱按钮
    @IBOutlet weak var menuBtn: HYTopCellBtn!
  
 ///发帖点击事件闭包
   static var invitationBtnOnclick : (() -> ())?
///写菜谱点击事件闭包
    static var menuBtnOnclick :  (() -> ())?

    
   class func view(invitationBtnOnclick : (() -> ()),menuBtnOnclick :  (() -> ()))  -> HYPublishView!{
        
    let publishView = (NSBundle.mainBundle().loadNibNamed("HYPublishView", owner: nil , options: nil).first as? HYPublishView)!
     self.invitationBtnOnclick = invitationBtnOnclick
     self.menuBtnOnclick = menuBtnOnclick
        
     return publishView
    }
    
///发帖按钮点击事件
    @IBAction func invitationOnclick() {
      HYPublishView.invitationBtnOnclick!()
    }
    
 ///写菜谱按钮点击事件
    @IBAction func menuOnclick() {
      HYPublishView.menuBtnOnclick!()
    }
    
    
}
