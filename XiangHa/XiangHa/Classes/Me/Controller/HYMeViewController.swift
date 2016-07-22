//
//  HYMeViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYMeViewController: HYBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        
    }

  
}
// MARK: - 方法
extension HYMeViewController{

    ///初始化
   private func setup() {
    
   tableView.contentInset = UIEdgeInsetsMake(-44 - 20, 0, 0, 0)
   view.backgroundColor = HYcollectionViewBackgroundColor
   tableView.showsVerticalScrollIndicator = false
    
   tableView.sectionHeaderHeight = 0
   tableView.sectionFooterHeight = 13
    
    ///添加顶部cell
    let group = HYSettingGroup.groupWithItems([HYSettingItem()])
    groups.append(group)
    
    setupGroup0() ///添加第一组
    setupGroup1() ///添加第二组
    setupGroup2() ///添加第三组
    setupGroup3() ///添加第四组
    
    
    }


 
    private func setupGroup0(){ ///第一组
    /// 防止循环引用
    weak var  weakSelf : HYBaseTableViewController? = self
        
    let item1 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_dingdan"), title: "我的订单")
    item1.subTitle = " 查看所有订单"
    item1.operation = {(indexPath : NSIndexPath) ->
        Void in
           
       let vc = HYSettingChildController()
       vc.hidesBottomBarWhenPushed = false
       vc.title = "我的订单"
       weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
    
        let item2 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_dingdan"), title: "优惠券")

        item2.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "我的优惠券"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    let group = HYSettingGroup.groupWithItems([item1,item2])
        
    groups.append(group)
        
    }
    
    private func setupGroup1(){ ///第二组
        /// 防止循环引用
        weak var  weakSelf : HYBaseTableViewController? = self
        
        let item1 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_exchange"), title: "积分商城")
        item1.subTitle = "8积分"
        item1.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "积分商城"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        let item2 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_remen"), title: "热门活动")

        item2.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "美食专题"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
 
        }
        
        
        let item3 = HYSettingArrowItem(image: UIImage (named: "LK_NEW_ME_MeiShiJia"), title: "认证美食家")
        item3.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "申请认证"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        let group = HYSettingGroup.groupWithItems([item1,item2,item3])
        
        groups.append(group)
        
    }
    
    
    private func setupGroup2(){ ///第三组
        /// 防止循环引用
        weak var  weakSelf : HYBaseTableViewController? = self
        let item1 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_shangjia"), title: "我是商家")
        
        item1.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "登录"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        let group = HYSettingGroup.groupWithItems([item1])
        
        groups.append(group)
        
        
    }
    
    private func setupGroup3(){
    
        /// 防止循环引用
        weak var  weakSelf : HYBaseTableViewController? = self
        
        let item1 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_add"), title: "邀请好友")
        item1.operation = {(indexPath : NSIndexPath) ->
            Void in
        }
        
        let item2 = HYSettingArrowItem(image: UIImage (named: "LK_New_Me_setting"), title: "设置")
        
        item2.operation = {(indexPath : NSIndexPath) ->
            Void in
            
            let vc = HYSettingChildController()
            vc.hidesBottomBarWhenPushed = false
            vc.title = "设置"
            weakSelf?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        let group = HYSettingGroup.groupWithItems([item1,item2])
        
        groups.append(group)

    }
    

}

// MARK: - 代理方法
extension HYMeViewController{

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard indexPath.section != 0 else {
        let cell = HYMeControllerTopCell()
        return cell
        }
        return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard indexPath.section != 0 else {
        return 250
        }
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    

    
}

// MARK: - 生命周期
extension HYMeViewController{
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ///隐藏导航栏
      navigationController?.navigationBarHidden = true
        
    }

}