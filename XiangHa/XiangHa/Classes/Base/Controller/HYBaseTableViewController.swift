//
//  HYBaseTableViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/5.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYBaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(){
    super.init(style: .Grouped)
    }
   
    
    override init(style: UITableViewStyle) {
        super.init(style: .Grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// section数组
   lazy var groups : [NSObject] = [NSObject]()
    
   
}

// MARK: - 代理方法
extension HYBaseTableViewController{


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return self.groups.count
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //取出组模型数组
    let group = self.groups[section] as? HYSettingGroup
        
    return (group?.items?.count)!
    }
    
    
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = HYBaseSettingTableViewCell.cellWithTableView(tableView)
        
    let group = self.groups[indexPath.section] as? HYSettingGroup
     
    let item = group?.items![indexPath.row] as? HYSettingItem
        
    cell.item = item
        
    return cell
    
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  
     tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    /// 从总数组中取出组模型数组
     let group = self.groups[indexPath.section] as? HYSettingGroup
    /// 从行模型数组中取出行模型
    let item  = group?.items?[indexPath.row]  as? HYSettingItem
      
        if item?.operation != nil {
        item?.operation?(indexPath: indexPath)
        }else if item is HYSettingArrowItem {
        ///只有箭头模型才具备跳转功能
        let arrowItem = HYSettingArrowItem()
            
    if arrowItem.desVc != nil {
            
    let vc = (arrowItem.desVc as? UIViewController.Type)!.init()
            
    vc.title = arrowItem.title
    
    navigationController?.pushViewController(vc, animated: true)
        
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = self.groups[section] as? HYSettingGroup
        return group?.headerTitle
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let group = self.groups[section] as? HYSettingGroup
        return group?.footTitle
    }
    

}