//
//  HYLifeBaseTableViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/13.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeBaseTableViewController: UITableViewController {
    //精彩生活圈视图模型数组
    private lazy var  lifeViewItems : NSMutableArray = NSMutableArray()
    
    private let LifeID = "life"
    
    private var time : Int = 1
    
    //是否加载
    private var isLoadLife : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    tableView.registerClass(HYLifeTableViewCell.self, forCellReuseIdentifier: LifeID)
        
    tableView.showsVerticalScrollIndicator = false
        
    loadLifeData()
        
    tableView.tableFooterView = UIView()
        
    }
  
    
}

// MARK: - 方法
extension HYLifeBaseTableViewController{

    ///加载精彩生活数据
    private func loadLifeData() {
        
        let paramters = ["page" : 1 ,"pageTime" : "" ]
        
        HYNetWorkTools.shareIntance.request(.GET, URLString: lifeUrl, paramters: paramters) { (result, error) in
            
            guard (result as? [String : NSObject]) != nil else {
                print("精彩生活圈数据加载失败")
                //      self.isLoadLife = true
                return
            }
            
            guard let array  = result!["data"] as? [[String : NSObject]] else{
                print("转数组失败")
                return
            }
            
            
            for lifeItem in HYLifeItem.mj_objectArrayWithKeyValuesArray(array){
                let lifeViewItem = HYLifeViewItem()
                lifeViewItem.lifeItem = lifeItem as? HYLifeItem
                self.lifeViewItems.addObject(lifeViewItem)
            }
            
            ///刷新数据
            self.tableView.reloadData()
        }
        
        
    }
    
    ///加载精彩生活更多的数据
    private func loadLifeMoreData(){
        
        time += 1
        
        let paramters = ["page":time ,"pageTime" : "" ]
        
        HYNetWorkTools.shareIntance.request(.GET, URLString: lifeUrl, paramters: paramters as! [String : NSObject]) { (result, error) in
            
            //        result?.writeToFile("/Users/hanyue/Desktop/life2.plist", atomically: true)
            
            guard (result as? [String : NSObject]) != nil else {
                print("精彩生活圈数据加载失败")
                //      self.isLoadLife = true
                return
            }
            
            guard let array  = result!["data"] as? [[String : NSObject]] else{
                print("转数组失败")
                return
            }
            
            
            for lifeItem in HYLifeItem.mj_objectArrayWithKeyValuesArray(array){
                let lifeViewItem = HYLifeViewItem()
                lifeViewItem.lifeItem = lifeItem as? HYLifeItem
                self.lifeViewItems.addObject(lifeViewItem)
                
            }
            
            ///刷新数据
            self.tableView.reloadData()
            self.isLoadLife = true
        }
    }


    ///设置cell高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.lifeViewItems[indexPath.row] as! HYLifeViewItem).cellHeight!
        }
}

// MARK: - 代理
extension HYLifeBaseTableViewController{

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifeViewItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(LifeID,forIndexPath: indexPath)
        let lifeViewItem  = HYLifeViewItem()
        lifeViewItem.lifeItem = (self.lifeViewItems[indexPath.row] as? HYLifeViewItem)?.lifeItem
        (cell as? HYLifeTableViewCell)?.lifeViewItem = lifeViewItem
        return cell

    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
    
        NSNotificationCenter.defaultCenter().postNotificationName(HYLifeNotification, object: scrollView)
        
        if  tableView.cellForRowAtIndexPath(NSIndexPath (forRow: self.lifeViewItems.count - 2 , inSection: 0)) != nil && self.isLoadLife  {
            //当滚动到精猜生活headerview的时候去请求 精彩生活的网络数据
            self.isLoadLife = false
            self.loadLifeMoreData()
        }
    }
    
    
    
    
}


