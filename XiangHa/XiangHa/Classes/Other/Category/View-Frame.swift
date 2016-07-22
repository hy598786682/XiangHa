//
//  View-Frame.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit


extension UIView{


    var  HY_x : CGFloat {
        get{
            return self.frame.origin.x
        }
        
        set{
            var frame : CGRect = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
  
    
    var  HY_y : CGFloat {
        get{
        return self.frame.origin.y
        }
        
        set{
            var frame : CGRect = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
   
    
    var  HY_width : CGFloat {
        get{
            return self.frame.width
        }
        
        set{
            var frame :CGRect = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var  HY_height : CGFloat {
        get{
          return self.frame.height
        }
        
        set{
            var frame :CGRect = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    
    
    var HY_centerX : CGFloat{
        get{
         return self.center.x
        }
        set{
            var center :CGPoint = self.center
            center.x = newValue
            self.center = center
        
        }
    }
  
    
    
    var HY_centerY : CGFloat{
        get{
            return self.center.y
        }
        
        set{
            var center :CGPoint = self.center
            center.y = newValue
            self.center = center
            
        }
    }

}