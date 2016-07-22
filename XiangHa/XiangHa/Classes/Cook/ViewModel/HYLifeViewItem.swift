//
//  HYLifeViewItem.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit
import Foundation

class HYLifeViewItem: NSObject {

    private var topFrame : CGRect?
    private var titleFrame : CGRect?
    private var bottomFrame : CGRect?
    private var middleFrame : CGRect?
    private var contentFrame : CGRect?
    
    var cellHeight : CGFloat?
    
     /// 顶部viewFrame
    var topViewFrame : CGRect {
    return topFrame!
    }
    
    ///titleViewFrame
    var titleViewFrame : CGRect{
    return titleFrame!
    }
    
    /// 中间图片viewFrame
    var middleImageViewFrame : CGRect{
    return middleFrame!
    }
    
    ///内容viewFrame
    var contentLabelFrame : CGRect{
    return contentFrame!
    }
    
    ///底部viewFrame
    
    var bottomViewFrame : CGRect{
    return bottomFrame!
    }
    
    
    /// 模型
    var lifeItem : HYLifeItem?{
    
        didSet{
        
        //间距
        let margin  : CGFloat = 10
        /// 计算顶部view的Frame
 
        let topViewX : CGFloat = 0
        let topViewY : CGFloat = 0
        let topViewW : CGFloat = HYScreenW 
        let topViewH : CGFloat = 30
            
       topFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH)
        
       cellHeight = CGRectGetMaxY(topFrame!) + margin
        ///计算title的Frame
        let titleViewX : CGFloat = topViewX + margin * 2
        let titleViewY : CGFloat = cellHeight!
        let titleViewW : CGFloat = topViewW - margin * 4
 
    
       let titleViewH : CGFloat = ((lifeItem?.title)! as NSString).boundingRectWithSize(CGSizeMake(titleViewW, CGFloat.max), options: HYOCUtils.stringDrawingOptions(), attributes:[NSFontAttributeName : UIFont.systemFontOfSize(17)] , context: nil).size.height
            
        titleFrame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH)
            
         cellHeight = CGRectGetMaxY(titleFrame!) + margin
        //计算中间imageView的Frame
            
        let middleX : CGFloat = margin
        let middleY : CGFloat = cellHeight!
        let middleW : CGFloat = HYScreenW -  margin * 2
        let middleH : CGFloat = 180
            
        middleFrame = CGRectMake(middleX, middleY, middleW, middleH)
            
        cellHeight = CGRectGetMaxY(middleFrame!) + margin
            
        //计算titleview的Frame
          
    if lifeItem?.content != nil &&
    lifeItem?.content?.characters.count > 0 {
        
    let contentX : CGFloat = titleViewX
    let contentY : CGFloat = cellHeight!
    let contentW : CGFloat = titleViewW
    let contentH : CGFloat = ((lifeItem?.content)! as NSString).boundingRectWithSize(CGSizeMake(contentW, CGFloat.max), options: HYOCUtils.stringDrawingOptions(), attributes:[NSFontAttributeName:UIFont.systemFontOfSize(14)] , context: nil).size.height
    
            
        contentFrame = CGRectMake(contentX, contentY, contentW, contentH)
        cellHeight = CGRectGetMaxY(contentFrame!) + margin
    }
    else {
        contentFrame = CGRectMake(0, 0, 0, 0)
          }


      //计算底部的Frame
      
    let bottomX : CGFloat = titleViewX
    let bottomY : CGFloat = cellHeight!
    let bottomW : CGFloat = titleViewW
    let bottomH : CGFloat = 20
            
    bottomFrame = CGRectMake(bottomX, bottomY, bottomW, bottomH)
    
    cellHeight = CGRectGetMaxY(bottomFrame!) + margin
            
        }
  
    }

    
}
