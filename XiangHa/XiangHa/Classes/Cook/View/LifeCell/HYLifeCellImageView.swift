//
//  HYLifeCellImageView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/29.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeCellImageView: HYBaseView {


 ///单张图片的ImageView
    @IBOutlet weak var oneImageView: UIImageView!
 
 ///两张图片的View
    @IBOutlet weak var doubleView: UIView!

///两张图片的第一个ImageView
    @IBOutlet weak var double_1ImageView: UIImageView!

///两张图片的第二个ImageView
    @IBOutlet weak var double_2ImageView: UIImageView!

    
 ///三张图片的View
    @IBOutlet weak var threeView: UIView!

    
///三张图片的第一个ImageView
    @IBOutlet weak var three_1ImageView: UIImageView!
    
    
///三张图片的第二个ImageView
    @IBOutlet weak var three_2ImageView: UIImageView!
    
    
    
///三张图片的第三个ImageView    
    @IBOutlet weak var three_3ImageView: UIImageView!
    
    
    
    
    var lifeItem : HYLifeItem?{
    
        didSet{
        //imgBgPlaceHolder
        //图片数组
        let imgs = lifeItem!.imgs
            
            switch  imgs!.count{
            case 1://一张图片  
             oneImageView.sd_setImageWithURL(NSURL(string: imgs![0].getMT()))
             oneImageView.hidden = false
             doubleView.hidden = true
             threeView.hidden = true
            case  2://两张图片
                
        double_1ImageView.sd_setImageWithURL(NSURL(string: imgs![0].getMT()))
        
        double_2ImageView.sd_setImageWithURL(NSURL(string: imgs![1].getMT()))
              
                oneImageView.hidden = true
                doubleView.hidden = false
                threeView.hidden = true
              
            case 3 ://三张图片
        three_1ImageView.sd_setImageWithURL(NSURL(string: imgs![0].getMT()))
               
        three_2ImageView.sd_setImageWithURL(NSURL(string: imgs![1].getMT()))
                
        three_3ImageView.sd_setImageWithURL(NSURL(string: imgs![2].getMT()))
        
                oneImageView.hidden = true
                doubleView.hidden = true
                threeView.hidden = false
                
            default:
                return
            }
            
            
        
        
        
        
        }
    
    }
}
