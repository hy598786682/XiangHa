//
//  HYADViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit
import MJExtension
import SDWebImage

class HYADViewController: UIViewController {
///欢迎图片
    @IBOutlet weak var lanunchImageView: UIImageView!
 ///广告占位图片
    @IBOutlet weak var containView: UIView!
    
 ///跳转按钮
    @IBOutlet weak var jumpBtn: UIButton!
    
    ///定时器
   private  weak var timer :NSTimer?
    
    private var adItem :HYADItem?
    
    ///跳转倒计时
    static var i  = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupLaunchImage()
        
        loadADData()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:#selector(HYADViewController.timeChange), userInfo: nil, repeats: true)

    }

    
///跳转监听
 
    @IBAction func jumpOnclick() {
        
        let tabVc  = HYMainTabBarViewController()
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = tabVc

        //销毁定时器
        timer?.invalidate()
    }
    
}

// MARK: - 方法
extension HYADViewController{

    ///设置启动图片
   private func setupLaunchImage() {
      
        var launchImage :UIImage? = nil
        
        if iPhone6p {
            launchImage = UIImage (named:"LaunchImage-800-Portrait-736h@3x")
        }else if iPhone6{
            launchImage = UIImage (named: "LaunchImage-800-667h@2x")
        }else if iPhone5{
          launchImage = UIImage (named: "LaunchImage-700-568h@2x")
        
        }else if iPhone4{
          launchImage = UIImage (named: "LaunchImage-568h@2x")
        
        }
        
        
        lanunchImageView.image = launchImage
       
    }

    
    
    ///加载网络数据
  private  func loadADData() {
        
        let paramters = ["code2" :adCode2]
      
    HYNetWorkTools.shareIntance.request(RequestType.GET, URLString: adUrl, paramters: paramters) { (result, error) in
        
        guard ((result as? [String : NSObject]) != nil) else{
        print("数据返回错误!")
        self.jumpOnclick()
        return
        }
        
        guard let fullDict  =  (result as? [String : NSObject])!["ad"] else{
        print("数据解析失败！")
        return
        }
        
        
        
        let adDict : [String : NSObject] = (fullDict as! Array).first!
        
        let adItem : HYADItem = HYADItem.mj_objectWithKeyValues(adDict)
        
        
        self.adItem = adItem
        
        let adImageView = UIImageView()
        
        self.containView.addSubview(adImageView)
        
        
        //设置尺寸
        
        let w  = HYScreenW
        
        var h  = adItem.w / HYScreenW * adItem.h
        
        
        h = h > (HYScreenH * 0.7) ? (HYScreenH * 0.85) : h
        
        
        adImageView.frame = CGRectMake(0, 0, w, h)
        
        
        //设置图片
        adImageView.sd_setImageWithURL(NSURL (string: adItem.w_picurl))
        
        
        
        //点击图片跳转到广告界面
        adImageView.userInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer( target: self, action: #selector(HYADViewController.tap))
        
        adImageView.addGestureRecognizer(tapGesture)
        
        
        }
        
        
        
    }
    
    
    /**
     广告图片点击事件
     */
  @objc private  func tap()  {
        let url  = NSURL (string: (adItem?.ori_curl)!)
        
        if UIApplication.sharedApplication().canOpenURL(url!){
        
            UIApplication.sharedApplication().openURL(url!)
        
        }
        
    }
    
    
    ///定时器监听
  @objc private func timeChange() {
   
       HYADViewController.i -= 1
    
        let title = String ("跳过\(HYADViewController.i)")
        
        jumpBtn.setTitle(title, forState: .Normal)
     
        if HYADViewController.i == -1 {
            jumpOnclick()
        }
        
        
    }
    
    

}