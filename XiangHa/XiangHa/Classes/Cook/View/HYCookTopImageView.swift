//
//  HYCookTopImageView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/21.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCookTopImageView: HYBaseView {

 
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var videoImageView: UIImageView!
    
    var current : Int? = 0
    
    
    ///设置数据
    var cookItem : HYCookViewItem? {
    
        didSet {
            
            //获取图片路径
            guard let imgDict = cookItem?.list[(cookItem?.time)!] as?[String:NSObject]  else {
            return
            }
            
            guard let urlStr = imgDict["img"] as? String else{
            return
            }
            
            //创建url
            guard let url = NSURL (string: urlStr) else{
            return
            }
            //加载图片
           imageView.sd_setImageWithURL(url, placeholderImage: UIImage (named: "imgBgPlaceHolder"))

            guard let hasVideo = imgDict["hasVideo"] as? String else{
            return
            }
            videoImageView.hidden = hasVideo == "1"
            
            
            //设置日期
            label.text = cookItem?.date
            
            
            // 设置类型
            switch cookItem!.type {
            case 1:
            typeImageView.image = UIImage (named: "z_home_top_zao")
                current = 0
            case 2:
              typeImageView.image = UIImage (named: "z_home_top_zhong")
                current = 1
            case 3:
              typeImageView.image = UIImage (named: "z_home_top_wan")
                current = 2
            default :
                return
            }
        
        }
    
    }
    
    
}


extension HYCookTopImageView{


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    let recommendVc = HYRecommendViewController()
        
    recommendVc.selectTypeBtn((self.cookItem?.type)! - 1)
        
   (UIApplication.sharedApplication().keyWindow?.rootViewController?.childViewControllers[0] as! UINavigationController).pushViewController(recommendVc, animated: true)
        
        
    }
}
