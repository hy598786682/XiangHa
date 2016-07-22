//
//  HYLifeViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/18.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeViewController: UITableViewController {
    
    private var vc =  HYLifeMenuViewController()
    
    private let headerView = HYLifeTableViewHeaderFooterView()
    
    private let HeaderID : String = "HEADERID"
    
    private let FirstID :  String = "FIRSTID"
    
    private let BottomID : String = "BOTTOMID"
    
    private let BottomCellID : String = "BOTTOMCELLID"
    
    private let BottonHeaderID : String = "BOTTOMHEADERID"
    
    private let topView = UIView()
    
    private let scroll  = UIScrollView()
    
    private var mainView : UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        tableView.contentInset.top = 64
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HYLifeViewController.notification(_:)), name: HYLifeNotification, object: nil)
        setUp()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
}


// MARK: - 初始化方法
extension HYLifeViewController{
    
   /// 初始化,设置导航条内容
   private func setUp() {
    
        view.backgroundColor =  HYcollectionViewBackgroundColor
    
        navigationItem.leftBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "navigation_join"), highImage: nil, target: self, action: #selector(HYLifeViewController.plus))
        navigationItem.rightBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "navigation_news"), highImage: nil, target: self, action:  #selector(HYLifeViewController.news))
        navigationItem.title = "生活圈"
    
    tableView.registerClass(HYLifeBottomTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: BottonHeaderID)
    
    tableView.registerClass(HYLifeTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderID)
    
  
    tableView.registerNib(UINib (nibName: "HYLifeTableViewTopCell", bundle: nil), forCellReuseIdentifier: FirstID)
    
    tableView.registerNib(UINib(nibName: "HYLifeTableViewBottomCellTableViewCell" , bundle: nil), forCellReuseIdentifier: BottomID)
    
    tableView.registerClass(HYLifeTableViewBottomCell.self, forCellReuseIdentifier: BottomCellID)
    
    tableView.separatorStyle = .None
    
    ///点击事件
    headerView.onclick = {
    self.headerView.tintColor = HYcollectionViewBackgroundColor
    self.tableView.reloadData()
    }
    
    }
    
    
   @objc private func notification(notification : NSNotification){
    
   let scrollView = notification.object as! UIScrollView
    
    let contentoffsetY : CGFloat = scrollView.contentOffset.y

//    print(tableView.contentOffset.y)
    guard contentoffsetY > 0 else{
        tableView.contentOffset.y = -64
        return
    }
    guard contentoffsetY < 200 else{
        tableView.contentOffset.y = 200 - 64
        return
    }
    tableView.contentOffset.y = -64 + contentoffsetY
    
    }
}


// MARK: - 代理方法
extension HYLifeViewController{


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return headerView.isOpen ? 1 : 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            return headerView
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCellWithIdentifier(FirstID)!
        case 1:
            return tableView.dequeueReusableCellWithIdentifier(BottomID)!
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier(BottomCellID) as? HYLifeTableViewBottomCell
            cell?.bottomView = vc.view
            return cell!
        default:
            return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        }
    }
    
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
        return 44
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 180
        case 2:
            return HYScreenH
        default:
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
}


    // MARK: - 点击事件
extension HYLifeViewController{
    
        // 下订单
       @objc private  func plus() {
            
            let discoverVc =   HYDiscoverViewController()
            
            navigationController?.pushViewController(discoverVc, animated: true)
            
            print("点击添加按钮")
        }
        
        // 购物车
        @objc private  func news() {
            print("点击消息按钮")
        }

}
