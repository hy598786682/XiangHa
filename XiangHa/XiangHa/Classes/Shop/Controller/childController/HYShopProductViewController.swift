//
//  HYShopProductViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/3.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYShopProductViewController: HYWebViewController {
    ///底部View
    private  var bottom : HYShopProductBottomView?
    ///返回按钮
    private  var backBtn : UIButton?
    ///分享按钮
    private  var shareBtn : UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }

}

// MARK: - 初始化
extension HYShopProductViewController{
///初始化
   private  func setUp()  {
    
    let x : CGFloat = 20
    
    let y : CGFloat = 35
    
    let wh : CGFloat = 35
    ///添加底部View
    self.bottom = HYShopProductBottomView.view() as?HYShopProductBottomView
 
    self.bottom?.HY_y = HYScreenH - 49
        
    view.addSubview(self.bottom!)
        
        
   ///添加返回和分享按钮
    self.backBtn = UIButton( type: .Custom)
    self.backBtn?.setImage(UIImage (named: "z_z_topbar_ico_back_white"), forState: .Normal)
    self.backBtn?.setImage(UIImage (named: "z_z_topbar_ico_back_white"), forState: .Highlighted)
    self.backBtn?.addTarget(self, action: #selector(HYShopProductViewController.backOnClick), forControlEvents: .TouchUpInside)
    self.backBtn?.frame = CGRectMake(x, y, wh, wh)
        
    self.shareBtn = UIButton(type: .Custom)
    self.shareBtn?.setImage(UIImage(named: "z_z_topbar_ico_share_white"), forState: .Normal)
    self.shareBtn?.setImage(UIImage(named: "z_z_topbar_ico_share_white"), forState: .Highlighted)
    self.shareBtn?.addTarget(self, action: #selector(HYShopProductViewController.shareOnClick), forControlEvents: .TouchUpInside)
    self.shareBtn?.frame = CGRectMake(HYScreenW - x - wh, y, wh, wh)
      
   
    self.view.addSubview(self.shareBtn!)
    self.view.addSubview(self.backBtn!)
        
    }
 
}
// MARK: - 生命周期
extension HYShopProductViewController{

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ///设置导航栏
        //隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        //设置偏移量
        webView?.scrollView.contentInset = UIEdgeInsetsMake(-87, 0, 0, 0)
      
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        ///设置导航栏
        //隐藏导航栏
        navigationController?.setNavigationBarHidden(false, animated: false)
        //设置偏移量
        webView?.scrollView.contentInset = UIEdgeInsetsMake(-57, 0, 0, 0)
 
        
        
    }
    
}


// MARK: - 事件监听
extension HYShopProductViewController{
    
  @objc  private func backOnClick() {
       self.navigationController?.popViewControllerAnimated(true)
    }

  @objc  private func shareOnClick() {
        print("分享")
    }

}
