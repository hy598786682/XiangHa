//
//  HYLifeCellContentView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/29.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeCellContentView: HYBaseView {
///内容
    @IBOutlet weak var ContentLabel: UILabel!
 

    override func awakeFromNib() {
        super.awakeFromNib()
      //关闭自动拉伸
       autoresizingMask = .None
    }
    
    var lifeItem : HYLifeItem?{
    
        didSet{
        if lifeItem?.content != nil &&
            lifeItem?.content?.characters.count > 0{
            
        ContentLabel.text = lifeItem?.content
        
            }
        }
    
    
    }
    
    
}
