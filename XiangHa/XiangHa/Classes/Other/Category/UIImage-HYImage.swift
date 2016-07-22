//
//  UIImage-HYImage.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit


extension UIImage{


    /// 生成一张没有渲染的图片
    class  func imageWithOriginalRenderingMode(imageName:String) -> UIImage {
        
        let image : UIImage? = UIImage(named: imageName)
        
        
        return image!.imageWithRenderingMode(.AlwaysOriginal)
    }

    /**
     根据颜色生成一张图片
     
     - parameter color: 颜色
     
     - returns: 图片
     */
    class func imageWithColor(color : UIColor) -> UIImage{
    
    //描述矩形
    let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        
    //开启位图上下文
    UIGraphicsBeginImageContext(rect.size)
    
    //获取位图上下文
    let context = UIGraphicsGetCurrentContext()
        
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(context, color.CGColor)
        
    //渲染上下文
    CGContextFillRect(context, rect)
        
    //从上下文中获取图片
    let image = UIGraphicsGetImageFromCurrentImageContext()
        
    //关闭图形上下文
        
    UIGraphicsEndImageContext()
        
    return image
    }
    
    
    ///根据view生成一张图片(屏幕快照)
    class func imageWithView (view : UIView) -> UIImage{

    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0)
        
    view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    
    let image : UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
    UIGraphicsEndImageContext()
        
        return image!
    }
    
    
    
}