//
//  HYMainNavigationViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYMainNavigationViewController: UINavigationController,UIGestureRecognizerDelegate {
    //是否已加载截屏图片
     var isNotAddBeforeImageView : Bool = true
    //占位图片开始偏移量
    let beforeImageStartOffect : CGFloat  = 15
    //截屏图片的imageview
    lazy var beforeImageView :UIImageView? = UIImageView()
    
    override func loadView() {
        super.loadView()
        setup()
        //设置全屏滑动返回
//       setBackPan()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - 重写
extension HYMainNavigationViewController{
 
    /// 重写push 设置返回按钮  创建截屏imageView
    override func pushViewController(viewController: UIViewController, animated: Bool) {
    //创建截屏imageView
     let  beforeImage = UIImage.imageWithView((UIApplication.sharedApplication().keyWindow?.rootViewController?.view)!)
     beforeImageView = UIImageView (image: beforeImage)
      /// 非根控制器隐藏BottomBar 添加拖动手势
        if self.childViewControllers.count > 0{
            view.userInteractionEnabled = true
            let pan :UIPanGestureRecognizer = UIPanGestureRecognizer (target: self, action: #selector(HYMainNavigationViewController.pan(_:)))
            pan.delegate = self
            view.addGestureRecognizer(pan)
            let btn = UIButton (type: .Custom)
            btn.setImage(UIImage (named: "z_z_topbar_ico_back"), forState: .Normal)
             btn.setImage(UIImage (named: "z_z_topbar_ico_back"), forState: .Highlighted)
            // 一定要设置尺寸 ⬇️
            btn.sizeToFit()
            btn.addTarget(self, action: #selector(HYMainNavigationViewController.back), forControlEvents: .TouchUpInside)
            //不需要设置偏移量
//            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            let leftItemBar = UIBarButtonItem (customView: btn)
            viewController.navigationItem.leftBarButtonItem = leftItemBar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    ///重写pop
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
    beforeImageView?.removeFromSuperview()
    isNotAddBeforeImageView = true
     return  super.popViewControllerAnimated(animated)
    }
    
}
// MARK: - 添加事件和方法
extension HYMainNavigationViewController{

    /**
     初始化
     */
    func setup() {
        
        //设置title字体大小
        let navBar = UINavigationBar.appearance()
        var attrNor:[String:NSObject] = Dictionary ()
        attrNor[NSFontAttributeName ] = UIFont.boldSystemFontOfSize(14)
        navBar.titleTextAttributes = attrNor
        
        //设置title字体颜色
        
        var attr:[String:NSObject] = Dictionary ()
        attr[NSForegroundColorAttributeName] = UIColor.whiteColor()
        navBar.titleTextAttributes = attr
        navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
        
        //设置导航栏背景颜色
        
  navBar.barTintColor = HYOrangeBackgroundColor
     
    }
    
    
    ///位移计算
    func setFrameWithoffect(offect : CGFloat){
        
        //向右移
        view.HY_x += ( view.HY_x + offect > 0 ) ? offect : 0
        
        
        //偏移比列
        let beforeImageOffect :CGFloat = view.HY_x / HYScreenW * 10
        //设置占位图片位置大小
        beforeImageView?.HY_y = (beforeImageStartOffect - beforeImageOffect )
        beforeImageView?.HY_x = (beforeImageStartOffect - beforeImageOffect )
        beforeImageView?.HY_height = HYScreenH + 2 * (beforeImageOffect - beforeImageStartOffect )
        
    }
    
    
    ///停止拖动之后设置view位置尺寸
    func resume(isResume : Bool)  {
        view?.HY_x = isResume ? 0 : HYScreenW
        self.beforeImageView?.HY_x = isResume ? self.beforeImageStartOffect : 0
        self.beforeImageView?.HY_y = isResume ? self.beforeImageStartOffect :0
        guard isResume else {
            self.beforeImageView?.HY_height = HYScreenH
            return
        }
        self.beforeImageView?.HY_height -= 2 * self.beforeImageStartOffect
    }
    
    ///拖动监听事件
    func pan(pan: UIPanGestureRecognizer)  {
        guard childViewControllers.count > 1 else {
            //根控制器
            return
        }
        let point = pan.translationInView(pan.view)
        if isNotAddBeforeImageView{
            UIApplication.sharedApplication().keyWindow?.insertSubview(beforeImageView!, atIndex: 0)
            isNotAddBeforeImageView = false
        }
        
        setFrameWithoffect(point.x)
        
        if pan.state == .Ended{
            guard pan.view?.HY_x > (HYScreenW * 0.35) else {
                UIView.animateWithDuration(0.4, animations: {
                    //小于屏幕三分之一则还原
                    self.resume(true)
                })
                return
            }
            //大于屏幕三分之一则pop
            UIView.animateWithDuration(0.5, animations: {
                self.resume(false)
                }, completion: { (true) in
                    //动画结束后pop
                    self.popViewControllerAnimated(false)
            })
            
        }
        ///复位
        pan.setTranslation(CGPointZero, inView: pan.view)
    }
    
    //返回事件 : pop
    func back()  {
        popViewControllerAnimated(true)
    }

 
    /**
     设置全屏滑动返回(还原系统滑动返回)
     interactivePopGestureRecognizer
     target=<_UINavigationInteractiveTransition 0x14c710280>)>>)
     Optional(<UIScreenEdgePanGestureRecognizer: 0x14c551720; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x14c71ea80>; target= <(action=handleNavigationTransition:
     */
    /*
    func setBackPan()  {
        let target = interactivePopGestureRecognizer?.delegate
        
        //   print(interactivePopGestureRecognizer)
        //添加拖动手势
        let pan = UIPanGestureRecognizer (target: target, action: Selector("handleNavigationTransition:"))
        view.addGestureRecognizer(pan)
        pan.delegate = self
    }
    */
    
    ///开始拖动手势
    /*
     func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
     return childViewControllers.count > 1
     }
     */
}

