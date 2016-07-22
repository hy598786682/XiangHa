//
//  HYBaseRecommendViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/4.
//  Copyright © 2016年 ios. All rights reserved.
//



/// 推荐界面基类 : UITableViewController
import UIKit

class HYBaseRecommendViewController: UITableViewController {

    private lazy var items : NSMutableArray? = NSMutableArray()
    private let ID : String = "CELL"
    var gtype : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///初始化
        setUp()
        ///加载网络数据
        loadNewData()
    }
}

// MARK: - 方法
extension HYBaseRecommendViewController{

    ///初始化
    private func setUp(){
    ///设置偏移量
   tableView.contentInset = UIEdgeInsetsMake(64 + 40, 0, 0, 0)
        
//   tableView.registerNib(UINib (nibName: "", bundle: nil), forCellReuseIdentifier: ID)
        
    }
    
    ///加载网络数据
    private func  loadNewData(){

       
    /// 路径无法访问！！！！！！！！
        
    let paramters  = ["g1" : 1 , "page" : 1 , "type" : "typeRecommend"]
    HYNetWorkTools.shareIntance.request(.GET, URLString: menuUrl, paramters: paramters) { (result, error) in
            
//    result?.writeToFile("/Users/hanyue/Desktop/recommend.plist", atomically: true)
   
        }
    }
    
    ///刷新界面
    func updateData()  {
        
    }
}

// MARK: - 代理 协议 方法
extension HYBaseRecommendViewController{

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

   
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//       let cell = tableView.dequeueReusableCellWithIdentifier(ID)
//        
//        
//       return cell!
//    }
    
    
    

}
