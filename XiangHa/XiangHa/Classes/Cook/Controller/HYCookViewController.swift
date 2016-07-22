//
//  HYCookViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/20.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCookViewController: UITableViewController {
    
    //滚动栏数组
    private lazy var  cookItems : NSMutableArray = NSMutableArray()
    //知识栏数组
    private lazy var  knowledges : NSMutableArray = NSMutableArray()
    //精选专题数组
    private lazy var  specialItems : NSMutableArray = NSMutableArray()
    //精彩生活圈视图模型数组
    private lazy var  lifeViewItems : NSMutableArray = NSMutableArray()
    //滚动的cell
    private lazy var collectionCell :HYCollectionTableViewCell = HYCollectionTableViewCell()
    ///滚动view
    private weak var topScrollView: HYCookTopScrollerView?
    ///可拉伸tableViewHeaderView
    private  var stretchHeaderView :HYStretchableTableHeaderView?
    ///背景图片
    private var backgroundView :UIView?
    //偏移量
    private var offset : CGFloat = 0
    let scrollh :CGFloat = HYScreenH * 0.42
    //是否刷新
    private var isReLoad : Bool = true
    //是否加载
    private var isLoadLife : Bool = true
    
    //cellID
    private let ID = "cell"
    private let LifeID = "life"
    private let TopID = "topcell"
    private let SpecialID = "special"
    private let KnowLedgeID = "knowledge"
    private let CollectionCellID = "collectioncell"
    private let SectionHeaderViewID = "sectionheaderview"
    
    private var time : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupNavBar()
        
       setup()
        
       loadData()
        
       loadLifeData()
        
        }
    }



// MARK: - 初始化
extension HYCookViewController{

    
    /// 设置导航栏
    private  func setupNavBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "LK_xiangha"), highImage: nil, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.initWithImage(UIImage (named: "LK_feedback"), highImage: nil, target: self, action:  #selector(HYCookViewController.feedOnclick))
        
        let titleBtn = UIButton ( w: HYScreenW * 0.7, h:44 * 0.65 , text: "搜菜谱、食材等", target: self, action: #selector(HYCookViewController.searchOnclick))

        navigationItem.titleView = titleBtn
        
    }
    
    
    /// 初始化
    private func setup()  {
        
        //取消自动滚动
        automaticallyAdjustsScrollViewInsets = false
 
        /** 设置navigationBar的背景图片为渐变图片
        //navigationBar设置背景图片
 navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        //navigationBar设置阴影图片
      navigationController?.navigationBar.shadowImage = UIImage()
         */

        ///注册cellID
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        tableView.registerNib(UINib (nibName: "HYTableViewTopCell", bundle: nil), forCellReuseIdentifier: TopID)
        tableView.registerNib(UINib (nibName: "HYKnowLedgeTableViewCell", bundle: nil), forCellReuseIdentifier: KnowLedgeID)
        tableView.registerNib(UINib (nibName: "HYTableSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: SectionHeaderViewID)
        tableView.registerNib(UINib (nibName: "HYCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: CollectionCellID)
        tableView.registerNib(UINib (nibName:
            "HYSpecialTableViewCell", bundle: nil),forCellReuseIdentifier: SpecialID)
        tableView.registerClass(HYLifeTableViewCell.self, forCellReuseIdentifier: LifeID)
        
        
        //隐藏滑块
        tableView.showsVerticalScrollIndicator = false
        //添加所有子控件
        addChildAllView()
        
        
    }

}


// MARK: - 加载网络数据
extension HYCookViewController{
    
    
    ///加载网络数据
   private func loadData(){
        let paramters = ["type":"v2"]
        
        HYNetWorkTools.shareIntance.request(RequestType.GET, URLString: cookUrl, paramters: paramters) { (result, error) in
            
            var resultDict : [String : NSObject]?
            
            if ((result as? [String : NSObject]) == nil){
                
                ///数据返回失败 从沙盒中获取
                resultDict = self.getPlist() as? [String : NSObject]
                
            }else {
                ///数据返回成功 保存plist到沙盒中
                resultDict = result as? [String : NSObject]
                
                self.savePlist(result)
            }
            
            guard let dataDict = resultDict!["data"] as? [String : NSObject] else{
                print("字典解析失败")
                return
            }
            
            guard let array  = dataDict["recommend"] as? [[String : NSObject]] else{
                print("转数组失败")
                return
            }
            
            
            self.cookItems  =  HYCookViewItem.mj_objectArrayWithKeyValuesArray(array)
            
            
            //设置滑动View属性
            self.topScrollView?.leftView?.cookItem =   self.cookItems[0]
                as? HYCookViewItem
            self.topScrollView?.middleView?.cookItem =  self.cookItems[1] as? HYCookViewItem
            self.topScrollView?.rightView?.cookItem =   self.cookItems[2] as?HYCookViewItem
            
            guard let knowLedgeArray  = dataDict["nous"] as? [[String : NSObject]] else {
                print("转数组失败")
                return
            }
            
            self.knowledges = HYKnowledgeItem.mj_objectArrayWithKeyValuesArray(knowLedgeArray)
            
            //美食家数组
            guard let userArray  = dataDict["activeUser"] as? [[String : NSObject]] else {
                print("转数组失败")
                return
            }
            
            self.collectionCell.users = HYActiveUser.mj_objectArrayWithKeyValuesArray(userArray)
            //精选专题
            guard let sepicalArray = dataDict["topic"] as? [[String : NSObject]] else {
                print("转数组失败")
                return
            }
            
            self.specialItems = HYSpecialItem.mj_objectArrayWithKeyValuesArray(sepicalArray)
            
            
            self.tableView .reloadData()
        }
    }

    
    ///加载精彩生活数据
   private func loadLifeData() {
 
    let paramters = ["page" : 1 ,"pageTime" : "" ]
     
    HYNetWorkTools.shareIntance.request(.GET, URLString: lifeUrl, paramters: paramters) { (result, error) in
        
        
//       result?.writeToFile("/Users/hanyue/Desktop/life.plist", atomically: true)
        
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

}


// MARK: - 保存
extension HYCookViewController{
   private func savePlist(data:AnyObject?) {
        //保存到plist文件中
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            data?.writeToFile(CookPlistfilename, atomically: true)
        }
    }
    //获取plist文件
   private  func getPlist() -> AnyObject {
       let plist = NSDictionary(contentsOfFile:CookPlistfilename)
       return plist!
    }

}


// MARK: - 代理
extension HYCookViewController {

    
    ///设置每组行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
        return 1
        case 1:
        return self.knowledges.count
        case 2:
        return 1
        case 3:
        return self.specialItems.count
        case 4:
        return self.lifeViewItems.count
        default:
        return 0
        }
        
       
    }
    
    ///设置组数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
  
    
    ///设置cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        var cell : UITableViewCell? = nil
        switch indexPath.section {
        case 0://顶部cell
          cell = tableView.dequeueReusableCellWithIdentifier(TopID)
            (cell as? HYTableViewTopCell)?.onclick = {(sender : UIButton) in
                
                switch sender.tag {
                case 0://今日佳作
                    let goodFishVc = HYCookGoodFishViewController(title:(sender.titleLabel?.text)!)
                    
                    self.navigationController?.pushViewController(goodFishVc, animated: true)
                case 1://美食养生
                    let  deliciousVc = HYCookDeliciousViewController(title: (sender.titleLabel?.text)!)
                    
                    self.navigationController?.pushViewController(deliciousVc, animated: true)
                    return
                case 2://美食视频
                    let videoVc = HYCookVideoViewController(title: (sender.titleLabel?.text)!)
                    
                    self.navigationController?.pushViewController(videoVc, animated: true)
                    return
                case 3://菜谱分类
                    let cookVc = HYCookClassViewController(title: (sender.titleLabel?.text)!)
                    self.navigationController?.pushViewController(cookVc, animated: true)
                default:
                    return
                }
                
            }
            
            return cell!

        case 1://美食知识cell
            cell = tableView.dequeueReusableCellWithIdentifier(KnowLedgeID)
            (cell as? HYKnowLedgeTableViewCell)?.ledgeItem = self.knowledges[indexPath.row] as? HYKnowledgeItem
                return cell!
        case 2://人气美食家cell
            collectionCell = (tableView.dequeueReusableCellWithIdentifier(CollectionCellID) as? HYCollectionTableViewCell)!
            return collectionCell
        case 3://精选专题cell
         cell = tableView.dequeueReusableCellWithIdentifier(SpecialID)
        (cell as? HYSpecialTableViewCell)?.specialItem = self.specialItems[indexPath.row] as? HYSpecialItem
            return cell!
        case 4://精彩生活圈cell
            
        ///一定要用 dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) 不然界面会出现异常！！！
            
        cell = tableView.dequeueReusableCellWithIdentifier(LifeID, forIndexPath: indexPath)
//      cell = tableView.dequeueReusableCellWithIdentifier(LifeID)
        let lifeViewItem  = HYLifeViewItem()
        lifeViewItem.lifeItem = (self.lifeViewItems[indexPath.row] as? HYLifeViewItem)?.lifeItem
        (cell as? HYLifeTableViewCell)?.lifeViewItem = lifeViewItem
        return cell!
        default:
            cell = tableView.dequeueReusableCellWithIdentifier(ID)
            cell?.textLabel?.text = "\(indexPath.row)"
            return cell!
        }

    }
    
    
    
    ///组标题名
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : HYTableSectionHeaderView? = tableView.dequeueReusableHeaderFooterViewWithIdentifier(SectionHeaderViewID) as? HYTableSectionHeaderView
        var text = ""
        
        switch section {
        case 1:
        text = "美食知识"
        case 2:
        text = "人气美食家"
        case 3:
        text = "精选专题"
        case 4:
        text = "精彩生活圈"
        default:
            return nil
        }
        
        headerView?.titleLabel.text = text
        
        return headerView

    }
    
    ///设置cell高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 85
        case 1:
                return 80
        case 2:
            return 100
        case 3:
            return 200
        case 4:
            return (self.lifeViewItems[indexPath.row] as! HYLifeViewItem).cellHeight!
        default:
            return 44
        }
        
    }
    
    ///组尾高度
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    ///组头高度
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1,2,3,4:
             return 40
        default:
            return 0
        }
        
        
    }
    
    
    ///滚动监听
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
    offset = scrollView.contentOffset.y
    
     ///替换 tableViewHeaderView 滚动图片
    if (offset < -scrollh * 0.25)&&isReLoad {
    // 下拉偏移量大于 scrollh * 0.25
    isReLoad = false
        
    let  cookItem  =  topScrollView?.showImageView?.cookItem
    let  time      =  cookItem?.time
    let  times     = cookItem?.list.count
    //如果将要替换的图片是最后一张图片则数组标记time置0
    cookItem?.time = time! < times! - 1 ? (time! + 1) : 0
     
        
    //替换时的动画 先把图片透明度设为0.01然后替换模型 再将透明度复原
   UIView.animateWithDuration(0.2, animations: {
    self.topScrollView?.showImageView?.imageView.alpha = 0.01
    }, completion: { (true) in
    self.topScrollView?.showImageView?.cookItem = cookItem
    UIView.animateWithDuration(0.2, animations: {
    self.topScrollView?.showImageView?.imageView.alpha = 1
        })
   })
        }
        
        
        //根据拖动偏移量设置 topScrollView  的高度
    stretchHeaderView?.scrollViewDidScroll(scrollView)
      
        //设置导航栏是否隐藏
    navigationController?.setNavigationBarHidden(offset < (scrollh - 64.0), animated: false)
 

       
    if  tableView.cellForRowAtIndexPath(NSIndexPath (forRow: self.lifeViewItems.count - 2 , inSection: 4)) != nil && self.isLoadLife  {
        //当滚动到精猜生活headerview的时候去请求 精彩生活的网络数据
        self.isLoadLife = false
         self.loadLifeMoreData()
        }

    }
    
   ///滚动停止监听
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        ///判断是否还有减速
        isReLoad = !decelerate
    }
    ///减速停止
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        isReLoad = true
    }
    
    
}

// MARK: - 添加所有子控件
extension HYCookViewController{
   
    ///添加所有子控件
    private   func addChildAllView() {
    
    topScrollView = HYCookTopScrollerView.view({
            self.searchOnclick()
            self.navigationController?.navigationBarHidden = false
        }) as? HYCookTopScrollerView
    backgroundView = UIView (frame: self.topScrollView!.frame)
    backgroundView!.backgroundColor = UIColor.clearColor()
    //设置TableheaderView透明度为0 topScrollView获取焦点
    backgroundView!.alpha = 0
        
    stretchHeaderView = HYStretchableTableHeaderView()
    stretchHeaderView?.stretchHeaderForTableView(tableView, view: topScrollView!,viewFrame: CGRectMake(0, 0, HYScreenW , scrollh), subView: backgroundView!)
      
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.contentInset = UIEdgeInsets (top: 0.0, left: 0.0, bottom: 49.0, right: 0.0)
        ///设置可拖拽tableViewHeaderView 的尺寸
        stretchHeaderView!.resizeView()
    }
    
}

// MARK: - 事件监听
extension HYCookViewController{
    ///反馈
    @objc private func feedOnclick(){
        print("反馈")
    }
    
    ///搜索
    @objc private func searchOnclick()  {
       let searchVc = HYCookSearchViewController()
       navigationController?.pushViewController(searchVc, animated: true)
  
    }

}

// MARK: - 生命周期
extension HYCookViewController{

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    //界面即将显示的时候根据偏移量设置导航栏是否隐藏
        navigationController?.setNavigationBarHidden(offset < (scrollh - 64.0), animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
