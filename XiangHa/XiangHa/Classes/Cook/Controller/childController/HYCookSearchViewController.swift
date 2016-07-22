//
//  HYCookSearchViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/22.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCookSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
        
    }

}

// MARK: - 初始化
extension HYCookSearchViewController{

//初始化
   private func setup() {
        
        view.backgroundColor = UIColor.whiteColor()
        
        
          navigationItem.rightBarButtonItem = UIBarButtonItem.initWithText("搜索", fontSize: 17, target: self, action: #selector(HYCookSearchViewController.search))

        let searchView = HYSearchView.view() as? HYSearchView
        
        //设置尺寸
        let w :CGFloat = (navigationController?.navigationBar.HY_width)! - (navigationItem.leftBarButtonItem?.customView?.HY_width)! -  (navigationItem.rightBarButtonItem?.customView?.HY_width)! - 70
        
        let h = (navigationController?.navigationBar.HY_height)! - 15
        
        searchView?.frame = CGRectMake(0, 0, w, h)
        
        searchView?.textView.placeholder = "搜菜谱/食材/相克/知识..."
        
        navigationItem.titleView = searchView
        
       searchView?.textView.becomeFirstResponder()
        
        
    }

}

// MARK: - 事件监听
extension HYCookSearchViewController{

    /**
     搜索监听事件
     */
  @objc private func  search ()  {
      
        print("点击了搜索")
    }
}



// MARK: - 生命周期
 extension HYCookSearchViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //当界面即将显示的时候显示导航栏
        navigationController?.navigationBarHidden = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
   
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
   
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}