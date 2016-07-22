//
//  HYShopViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//  商城主界面

import UIKit

class HYShopViewController: HYWebViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }

}

// MARK: - 初始化方法
extension HYShopViewController{

    /**
     初始化,设置导航条内容
     */
    private func setUp() {
        
        view.backgroundColor = UIColor.whiteColor()
       
     
        navigationItem.leftBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "Nav_OrderList"), highImage: nil, target: self, action: #selector(HYShopViewController.order))
        navigationItem.rightBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "Nav_Cart"), highImage: nil, target: self, action:  #selector(HYShopViewController.shop))

        let titleBtn = UIButton ( w: HYScreenW * 0.7, h: 44 * 0.65, text: "搜商品/店铺", target: self, action: #selector(HYShopViewController.search))
        
        navigationItem.titleView = titleBtn

    }
    
    override func setUpWebView() {
        
        let url = NSURL (string: shopUrl)
        if UIApplication.sharedApplication().canOpenURL(url!) {
          
        self.webRequest = NSURLRequest(URL: url!)
           
        super.setUpWebView()    
        }
        
     

       
    }
    

}


///事件监听
extension HYShopViewController{

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        print(request.URL)
        ///是当前界面的请求
        if request.URL == webRequest?.URL {
        return true
        }
        
        var webVc : UIViewController?
        ///下个界面的请求product
      if ((request.URL?.absoluteString)! as NSString).containsString("product") {
       webVc = HYShopProductViewController(request: request)
        }else {
        webVc = HYShopOtherViewController(request: request)
        }
     
        self.navigationController?.pushViewController(webVc!, animated: true)
        ///点击界面链接不进行跳转
        return false
    }

}

// MARK: - 点击事件
extension HYShopViewController{

    
    // 下订单
   @objc private  func order() {
        
    let orderVc =   HYOrderViewController()
        
    navigationController?.pushViewController(orderVc, animated: true)
        
        print("点击下单按钮")
    }

    // 购物车
    @objc private  func shop() {
       print("点击购物按钮")
    }

    
    // 搜索
    @objc private  func search() {
       
        let searchVc = HYShopViewSearchController()

        navigationController?.pushViewController(searchVc, animated: true)
    }
    
}

// MARK: - 生命周期
extension HYShopViewController{

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    

}



