//
//  HYKnowLedgeTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/24.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYKnowLedgeTableViewCell: HYBaseTableViewCell {

    //类型
    @IBOutlet weak var typeLabel: UILabel!
    //浏览
    @IBOutlet weak var codeLabel: UILabel!
    //内容
    @IBOutlet weak var topTextLabel: UILabel!
    //评论数
    @IBOutlet weak var commentCountLabel: UILabel!
    //图片
    @IBOutlet weak var titleImageView: HYRoundCornerImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //设置数据
    var ledgeItem : HYKnowledgeItem? {
    //设置数据
        didSet{
            
         topTextLabel.text = ledgeItem?.title
         typeLabel.text = ledgeItem?.classifyname
         codeLabel.text = "\(ledgeItem!.allClick)浏览"
         commentCountLabel.text = "\(ledgeItem!.commentCount)评论"
         titleImageView.sd_setImageWithURL(NSURL(string: (ledgeItem?.img)!))

        
        }
      
    }
    
    
}
