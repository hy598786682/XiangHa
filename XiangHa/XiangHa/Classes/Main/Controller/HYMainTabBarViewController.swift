//
//  HYMainTabBarViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYMainTabBarViewController: UITabBarController {
    ///发布按钮
   private var publishBtn : HYZoomBtn?
    //遮罩
    private var shade = UIView()
    
   ///发布View
    private var publishView : HYPublishView?
    
    
   override func loadView() {
        super.loadView()
        
        
        /// 初始化TabBar文字颜色
        
        
        let item = UITabBarItem.appearance()
        
        var attr:[String:NSObject] = Dictionary ()
        
        attr[NSForegroundColorAttributeName] = UIColor.grayColor()
        
        item.setTitleTextAttributes(attr, forState: .Selected)
        
        
        ///初始化TabBar文字大小
        
        var attrNor:[String:NSObject] = Dictionary ()
        
        attrNor[NSFontAttributeName ] = UIFont.systemFontOfSize(13)
        
        item.setTitleTextAttributes(attrNor, forState: .Normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

}


// MARK: - 扩充方法
extension HYMainTabBarViewController{
 
     ///初始化
        func setUp(){
       tabBar.backgroundColor = UIColor.whiteColor()

     //添加所有子控制器及底部按钮
        setUpAllChildControllerAndTabItem()
        
     //添加中间发布按钮
       setUpPublishBtn()

    }
    
    //添加发布View
    private func addPublishView()  {
    publishView =  HYPublishView.view({
            print("发帖")
            }, menuBtnOnclick: { 
            print("写菜谱")
        })
    shade.addSubview(publishView!)
    //超出父控件的部分隐藏
    shade.clipsToBounds = true
    publishView!.frame = CGRectMake(0, HYScreenH + publishView!.HY_height, HYScreenW, publishView!.HY_height)
        
    }
    
    ///添加遮罩
    private func addShade(){
        
        shade.frame = CGRectMake(0, 0, HYScreenW, HYScreenH - 49)
        shade.backgroundColor = UIColor(white: 0, alpha: 0)
        shade.alpha = 0
        view.addSubview(shade)
    
    }
    
    /// 添加所有子控制器及底部按钮
    private func setUpAllChildControllerAndTabItem() {
        //学做菜
    let cookVc  = HYCookViewController()
     setUponeChildController(cookVc, imageName: "z_home_menu_ico_caipu", selectImageName: "z_home_menu_ico_caipu_active", title: "学做菜")
    
       //商城
        let shopVc = HYShopViewController()
        setUponeChildController(shopVc, imageName: "z_home_menu_ico_surprise", selectImageName: "z_home_menu_ico_surprise_active", title: "商城")
        //发布
        let publishVc = HYPublishViewController()
        setUponeChildController(publishVc, imageName: "", selectImageName: "", title: "")
        //生活圈
        let lifeVc = HYLifeViewController()
        setUponeChildController(lifeVc, imageName: "z_home_menu_ico_quan", selectImageName: "z_home_menu_ico_quan_active", title: "生活圈")
        //我的
        let meVc = HYMeViewController()
        setUponeChildController(meVc, imageName: "z_home_menu_ico_me", selectImageName: "z_home_menu_ico_me_active", title: "我的")
        
         meVc.navigationController?.navigationBarHidden = true
        
    }
    
    /// 添加中间发布按钮
    private func setUpPublishBtn() {
 
        let publishBtn = HYZoomBtn()
        
        self.publishBtn = publishBtn
        
        publishBtn.img = UIImage (named: "z_home_center_round_btn")
        
        publishBtn.selectedImg = UIImage (named: "z_home_center_btn")
        
        publishBtn.backgroundColor = HYOrangeBackgroundColor2
        
        publishBtn.HY_width = 52
        publishBtn.HY_height = self.tabBar.HY_height - 14
        
        
        publishBtn.center = CGPointMake(self.tabBar.HY_width * 0.5, self.tabBar.HY_height * 0.5)
        
        publishBtn.addAction() {
        self.PublishonClick()
        }
        self.tabBar.addSubview(publishBtn)
    }

}


// MARK: - 方法
extension HYMainTabBarViewController{
 
    ///包装一个子控制器
    private func setUponeChildController(controller : UIViewController ,imageName : String,selectImageName : String,title : String) {
        //判断是否是发布控制器 如果不是则用NavigationViewController进行包装
        guard controller is HYPublishViewController else{
            
            //不是发布控制器
            
            let nav = HYMainNavigationViewController(rootViewController:controller)
            
            controller.tabBarItem.title = title
            controller.tabBarItem.image = UIImage.imageWithOriginalRenderingMode(imageName)
            controller.tabBarItem.selectedImage = UIImage.imageWithOriginalRenderingMode(selectImageName)
            
            self.addChildViewController(nav)
            return
        }
        
        //是发布控制器
        
        controller.tabBarItem.enabled = false
        self.addChildViewController(controller)
      
    }
 
    
    
    ///点击发布按钮
   private func PublishonClick()  {
    
    print("点击发布按钮")
    
    //点击发布按钮则添加遮罩和发布View
    if publishBtn!.selected {
        //添加遮罩
        self.addShade()
        //添加发布view
        self.addPublishView()
    }
    
    ///改变tabbar子控件透明度 及 遮罩
    for view in self.tabBar.subviews{
        if view == publishBtn {
            continue
        }
        UIView .animateWithDuration(0.3, animations: {
            view.alpha = self.publishBtn!.selected ? 0 : 1
        })
    }
    
    
    let publishBtnH = self.publishView!.HY_height + 30
    UIView.animateWithDuration(0.3, animations: {
        //设置遮罩层透明度,点击发布设为1，取消发布设为0
        self.shade.alpha = self.publishBtn!.selected ? 1 : 0
        //设置遮罩层颜色透明度,点击发布设为0.7，取消发布设为0
        let alpha  :CGFloat = self.publishBtn!.selected ? 0.7 : 0
        self.shade.backgroundColor = UIColor(white: 0, alpha: alpha)
        /**
         弹出 和 关闭 发布按钮
         改变弹出发布按钮所在View 的 y值
         弹出 y : HYScreenH + publishView!.HY_height  ->
         HYScreenH - publishBtnH - 49 - 15   ->
         HYScreenH - publishBtnH - 49
         
         关闭 y : HYScreenH - publishBtnH - 49        ->
         HYScreenH + publishView!.HY_height
         */
        self.publishView!.HY_y = self.publishBtn!.selected ? (HYScreenH - publishBtnH - 49 - 15) : (HYScreenH + publishBtnH)
        }, completion: { (true) in
            UIView.animateWithDuration(0.1, animations: {
                if self.publishBtn!.selected{
                    self.publishView!.HY_y = HYScreenH - publishBtnH - 49
                }
                else {//取消发布则移除遮罩和发布View
                    self.shade.removeFromSuperview()
                }
                
            })
    })

    }

}