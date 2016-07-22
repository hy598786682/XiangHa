//
//  HYWebViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/3.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYWebViewController: UIViewController {

        var webView : UIWebView?
        var webRequest : NSURLRequest?
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            setUpWebView()
            
        }
    
    /**
     request构造方法
     
     - parameter request: 请求
     
     - returns: HYWebViewController
     */
    init(request : NSURLRequest){
        self.webRequest = request
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil )
    }
    }
    

    // MARK: - 初始化方法
extension HYWebViewController : UIWebViewDelegate{
    

        // MARK: - 添加webView
         func setUpWebView()  {
            webView = UIWebView (frame: HYScreen)
            
            //取消弹簧效果
            webView?.scrollView.bounces = false
            //设置偏移量
            webView?.scrollView.contentInset = UIEdgeInsetsMake(-57, 0, 0, 0)
            //添加代理方法
            webView?.delegate = self
            
            //自动对页面进行缩放以适应屏幕
            webView?.scalesPageToFit = true
            //加载页面
            dispatch_async(dispatch_get_main_queue()) { 
                
                self.webView?.loadRequest(self.webRequest!)
            }
            
            self.view.addSubview(webView!)
            
            
            
        }
        
    }
    
    

    


