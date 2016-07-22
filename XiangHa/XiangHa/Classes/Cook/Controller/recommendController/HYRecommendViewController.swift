//
//  HYRecommendViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/4.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYRecommendViewController: HYBaseMenuViewController {
    
    ///菜谱类型 ： 早餐1 中餐2 晚餐3
    var type : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       setUpNavBar()
     
       setUpAllChildViewController()

    }

}


// MARK: - 方法
extension HYRecommendViewController{

    
    /// 设置导航栏
    private  func setUpNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "z_z_topbar_ico_share"), highImage: nil, target: self, action: #selector(HYRecommendViewController.shareOnclick))
        navigationItem.title = "今日推荐"
        
    }

    ///添加所有子控制器
    private func setUpAllChildViewController(){
    
     /// 早餐
     let breakfastVc = HYBreakfast_Controller()
     breakfastVc.title = "早餐"
     addChildViewController(breakfastVc)
        
      /// 中餐
     let lunchVc = HYLunchViewController()
     lunchVc.title = "中餐"
     addChildViewController(lunchVc)
        
      /// 早餐
      let dinnerfastVc = HYDinnerViewController()
      dinnerfastVc.title = "晚餐"
      addChildViewController(dinnerfastVc)
    
    }
    
    @objc private func shareOnclick(){
    print("点击分享")
    
    
    }
    
    
    
    


}