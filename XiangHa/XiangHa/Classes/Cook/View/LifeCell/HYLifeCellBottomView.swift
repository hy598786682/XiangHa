//
//  HYLifeCellBottomView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/30.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeCellBottomView: HYBaseView {

    ///时间Label
    @IBOutlet weak var timeLabel: UILabel!
    ///类型Label
    @IBOutlet weak var typeLabel: UILabel!
    
    ///评论数
    @IBOutlet weak var commentNumBtn: UIButton!

    ///点赞数
    @IBOutlet weak var likeBtn: UIButton!
   
    
    
    
    var lifeItem : HYLifeItem?{
    
        didSet{
        
        timeLabel.text = lifeItem?.timeShow
        typeLabel.text = "-"+(lifeItem?.cName)!
            
        commentNumBtn.setTitle(lifeItem?.commentNum, forState: .Normal)
        likeBtn.setTitle("\(lifeItem!.likeNum)", forState: .Normal)
            
//        commentNumBtn.hidden = lifeItem?.commentNum == 0
//        likeBtn.hidden = lifeItem?.likeNum == 0
            
        }
    }
    
}
