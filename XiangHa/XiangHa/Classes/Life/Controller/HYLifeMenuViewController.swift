//
//  HYLifeMenuViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/7.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeMenuViewController: HYBaseMenuViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 添加所有子控器
        setupAllChildController()
        setframe()
    }

}


extension HYLifeMenuViewController{
  ///添加所有子控制器
  private  func  setupAllChildController(){
    
        /// 最新
        let newVc = HYLifeNewViewController()
        newVc.title = "最新"
        addChildViewController(newVc)
        
        /// 关注的人
        let attentionVc = HYLifeAttentionViewController()
        attentionVc.title = "关注的人"
        addChildViewController(attentionVc)
        
        /// 美食家
        let epicureVc = HYLifeEpicureViewController()
        epicureVc.title = "美食家"
        addChildViewController(epicureVc)

    }

 private  func setframe()  {
        topView?.HY_y = 0
        collectionView?.HY_y = 44
    }
    
    

}