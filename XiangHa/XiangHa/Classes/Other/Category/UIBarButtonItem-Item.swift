//
//  UIBarButtonItem-Item.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/19.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

    
   /**
     UIBarButtonItem 扩充类构造函数
     
     - parameter image:     button图片
     - parameter highImage: button高亮图片
     - parameter target:    target
     - parameter action:    action
     
     - returns: UIBarButtonItem
     */
   


    class func initWithImage(image : UIImage? , highImage : UIImage? , target :AnyObject?, action :Selector ) -> UIBarButtonItem{
        
        let btn = UIButton (type: .Custom)
        btn.setImage(image, forState: .Normal)
        btn.setImage(image, forState: .Highlighted)
        btn.sizeToFit()
        
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        
        let containView = UIView( frame: btn.bounds)
        containView.addSubview(btn)
        
        let barButtonItem = UIBarButtonItem (customView: containView)
        
        return barButtonItem
    }
    
    class func initWithImage(image : UIImage? , selectedImage : UIImage? , target :AnyObject?, action :Selector ) -> UIBarButtonItem{
        
        
        let btn = UIButton (type: .Custom)
        btn.setImage(image, forState: .Normal)
        btn.setImage(image, forState: .Highlighted)
        btn.setImage(selectedImage, forState: .Selected)
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        let containView = UIView( frame: btn.bounds)
        containView.addSubview(btn)
        
        let barButtonItem = UIBarButtonItem (customView: containView)
        
        return barButtonItem
        
    }


    
    /**
     生成只有文字的UIBarButtonItem
     
     - parameter title:    文字
     - parameter fontSize: 文字大小
     - parameter target: target
     - parameter action: action
     
     - returns: UIBarButtonItem
     */
    class func initWithText(title : String? ,fontSize:CGFloat? ,target :AnyObject?, action :Selector ) -> UIBarButtonItem{
        
        
        let btn = UIButton (type: .Custom)
        btn.setTitle(title, forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(fontSize!)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        let containView = UIView( frame: btn.bounds)
        containView.addSubview(btn)
        
        let barButtonItem = UIBarButtonItem (customView: containView)
        
        return barButtonItem
        
    }
    

}