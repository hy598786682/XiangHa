//
//  XiangHa.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import Foundation
import UIKit
///屏幕高
let   HYScreenH  =  UIScreen.mainScreen().bounds.height
///屏幕宽
let   HYScreenW = UIScreen.mainScreen().bounds.width
//屏幕尺寸
let   HYScreen = UIScreen.mainScreen().bounds
///是iPhone6p
let  iPhone6p = (HYScreenH == 736)

///是iPhone6
let  iPhone6 = (HYScreenH == 667)

///是iPhone5
let  iPhone5 = (HYScreenH == 568)

///是iPhone4
let  iPhone4 = (HYScreenH == 480)

///商城界面请求路径
let shopUrl : String = "http://m.ds.xiangha.com/v1/home?fr1=ds_home_entry1"

///广告请求路径
let adUrl : String = "http://mobads.baidu.com/cpro/ui/mads.php"

///学做菜界面请求路径
let cookUrl : String = "http://api.xiangha.com/main6/index/baseData"

///精彩生活圈请求路径
let lifeUrl : String = "http://api.xiangha.com/main6/index/getTieList"

///精彩生活圈更多数据请求路径
let lifeMoreUrl : String = "http://101.201.172.223/main6/index/getTieList"

///菜谱界面请求路径
let menuUrl : String = "http://101.201.172.223/main5/caipu/getDishList"

///广告请求参数
let adCode2 : String = "phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3Ln-tkQW08nau_I1Y1P1Rhmhwz5Hb8nz3zFMTqP1RsFMKo5yPEUi43py78uv99QMKzUzu9TZfqrau9mvnqf-w5Fhq15y-ETzubuy3qnBuzug7xpyfqmHf4nAP9PhwWmW9WP17-mhfYuH7bPj7buWR1mWmYnhchUy7s5HDhIywGujd9mW7bmymkPWmzuhczuHFWnHwhPAN9PyD4PhfsrjT4PWFbmhc4nAPbFMPLpHYkFh7sTA-b5ymLPAczmyuhFhPdTWYsFMKzuykEmyfqnauGuAu95RRYnW-DPjndQH04wH6VPDw7PaY3PHKAQH6kfbP7PW0vPjfswBu9mLfqHbD_H70_wDshTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhu-IjdcNDdnQD7rNDb_HNPHRau_pjYdPWThmgKGujYzPjcYPWcdFh7s5H0hIhfqniusThqb5gF1TAk9Tv6hTv3qwHfzrRfYn1RVnj-7raYYwDRYQH6dnDmVrj7afYRvnjmYPjKAFh7sTZu-TWYkFhPV5HRknBuYUHYdnHchULK9mv-YXHYkFMwzuMws5gPbpdt1QWTzFh7Y5HchpjYknHnYFMws5y-fpAq8uH6_niuYmycqnau1IjYkPjmvn1cvnH0YPHTYQW6kPauVmybqnauBnHfvPWnzPWDsPjYkFMP-UWdDiNn_fb7nQ7PPRzkPfN0_Nbf_RY95Q7PFHBkHHdR_fRPjQDdFfzkZR7n_fYqPQD7iQ7uDHikPNDt_wD-iFMP9UjYhmLnqPAf1rymvrAcLnvF9njubuhDLn1RYPj7WmW--nWmvrj0hTvwW5HTLra3srHnLPH0_nHD4rHc8rj0sP16kFh3qniu1Ugnqniu1I1YLPH0hUhqs5Hfvnj0zFhd-UHYLP168njb1P1RsQjDkrHbzQW6snjT3niuk5ymLPAczmyuhgvPsTBu_my4bTvP9TARqnamb"

//Cook界面Plist文件名
let  CookPlistfilename = (NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as NSString).stringByAppendingPathComponent("cook.plist")


func HYcolor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
    
    let color :UIColor = UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
 
    return color
}

///  Red alpha : 0.7
let HYRedBackgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.7)
///  Black alpha : 0.9
let HYBlackBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
///  Black alpha : 0.7
let HYBlackBackgroundColor2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)

/// Orange alpha : 0.8
let HYOrangeBackgroundColor = UIColor (red: 255/255.0, green: 82/255.0, blue: 60/255.0, alpha: 0.8)
/// Orange alpha : 0.9
let HYOrangeBackgroundColor2 = UIColor (red: 255/255.0, green: 82/255.0, blue: 60/255.0, alpha: 0.9)

/// collectionView 背景颜色
let HYcollectionViewBackgroundColor  = HYcolor(241, 239, 228)
/// topView 背景颜色
let HYtopViewBackgroundColor  = HYcolor(245, 245, 245)

/// border 颜色
let HYBorderColor = UIColor(white: 0.5, alpha: 1)

///  通知
let HYLifeNotification = "LIFE"

/**
 根据透明度生成背景颜色
 
 - parameter alpha: 透明度
 
 - returns: 颜色
 */
func HYOrangeColorWithAlpha(alpha : CGFloat) -> UIColor {
    
    let color :UIColor = UIColor (red: 255/255.0, green: 82/255.0, blue: 60/255.0, alpha: alpha)
    
    return color
}


