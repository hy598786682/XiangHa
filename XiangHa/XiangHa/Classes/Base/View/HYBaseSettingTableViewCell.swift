//
//  HYBaseSettingTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/5.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYBaseSettingTableViewCell: HYBaseTableViewCell {

    static let ID : String = "cell"
    
   static func cellWithTableView(tableView : UITableView , style : UITableViewCellStyle) -> HYBaseSettingTableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(ID) as?
    HYBaseSettingTableViewCell
    if cell == nil {
    
    cell = HYBaseSettingTableViewCell( style: style, reuseIdentifier: ID)
    }
        
    return cell!
    }
    
    
    
   static func cellWithTableView(tableView : UITableView ) -> HYBaseSettingTableViewCell {
        return cellWithTableView(tableView, style: .Value1)
    }
    
    
    var item : HYSettingItem?{
    
        didSet{
        
       imageView?.image = item?.image
       textLabel?.text = item?.title
       textLabel?.font = UIFont.systemFontOfSize(15)
       textLabel?.textColor = HYBlackBackgroundColor2
       detailTextLabel?.text = item?.subTitle
       detailTextLabel?.textColor = UIColor.lightGrayColor()
       detailTextLabel?.font = UIFont.systemFontOfSize(12)
       setupRightView()
            
        }
    
    
    }
    
    /**
     设置右侧视图
     */
  private  func setupRightView()  {
    
    if item is HYSettingArrowItem{//箭头  第二种写法
    //item?.isKindOfClass(HYSettingArrowItem) == true
    accessoryView = UIImageView(image: UIImage (named: "z_me_ico_go"))
    }else if item is HYSettingSwitchItem {
    let swItem = item as? HYSettingSwitchItem
    let sw = UISwitch()
    sw.on = (swItem?.isOpen)!
    accessoryView = sw
    }else{
        /**
         *  一定要清空
         */
    accessoryView = nil
        }
    }
}

    



