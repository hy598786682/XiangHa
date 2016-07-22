//
//  HYLifeCellTitleView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/29.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeCellTitleView: HYBaseView {

   ///标题
    @IBOutlet weak var titleLabel: UILabel!

    
    var lifeItem : HYLifeItem?{
        
        didSet{
         
            
        titleLabel.text = lifeItem?.title
            
        }
        
    }

    
}
