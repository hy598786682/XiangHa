//
//  HYBaseMenuViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/4.
//  Copyright © 2016年 ios. All rights reserved.
//
/**
 自定义导航控制器基类
 */


import UIKit

class HYBaseMenuViewController: UIViewController {

    private let ID : String = "CELL"
    
    var topView : UIScrollView? ///顶部导航栏
    private var underLineView : UIView? ///滑块
    var collectionView : UICollectionView? ///内容
    private var selectBtn : UIButton? ///选中按钮
    private lazy var  titleBtns : [NSObject]? = [NSObject]()///标题数组
    private var isInitial : Bool? ///是否已经初始化
    

    override func viewDidLoad() {
        super.viewDidLoad()//

     ///初始化
      setUp()
    }
    
    
    ///选中第几个标题按钮
    internal func selectTypeBtn(type : Int){
        
        if type < 0 || type >= titleBtns?.count ?? 0{
            return
        }
        ///type 没有越界
        titleBtnOnclick(titleBtns![type] as! UIButton)
    }

}

// MARK: - 方法
extension HYBaseMenuViewController{

    private func setUp() {
        ///添加底部内容View
        setUpbottomContentView()
        ///添加顶部标题View
        setUpTopTitleView()
        ///关闭额外滚动
        automaticallyAdjustsScrollViewInsets = false
    }


    ///添加底部内容View
    private func setUpbottomContentView() {
    
    ///创建流水布局
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSizeMake(HYScreenW, HYScreenH)
    flowLayout.minimumLineSpacing = 0
        
    ///设置滚动方向
    flowLayout.scrollDirection = .Horizontal
        
    ///创建UIcollectionView
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
     view.addSubview(collectionView!)
     collectionView?.scrollsToTop = false
    ///开启分页
     collectionView?.pagingEnabled = true
     collectionView?.showsHorizontalScrollIndicator = false
//   collectionView?.bounces = false 关闭弹簧
    ///添加代理
    collectionView?.dataSource = self
    collectionView?.delegate = self
    collectionView?.backgroundColor = HYcollectionViewBackgroundColor
   ///注册cell
     collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: ID)
    }
    
    ///添加顶部标题View
    private func setUpTopTitleView(){
    ///创建UIScrollView
        
    topView = UIScrollView(frame: CGRectMake(0, 64, HYScreenW, 40))
        
    topView?.backgroundColor = HYtopViewBackgroundColor
    
    view.addSubview(topView!)
        
    }
    
    
    ///添加所有标题
    private func setUpAllTitle(){
        let count : Int = childViewControllers.count
        let btnW  : CGFloat = HYScreenW / CGFloat(count)
        var btnX  : CGFloat = 0
        let btnH  : CGFloat = (topView?.HY_height)!
        
        
        for i in 0..<count{
        let titleBtn = UIButton(type: .Custom)
        titleBtn.tag = i
        
        let vc = childViewControllers[i]
        ///设置标题 选中颜色为红色
        titleBtn.setTitle(vc.title, forState: .Normal)
         titleBtn.setTitleColor(HYBlackBackgroundColor, forState: .Normal)
        titleBtn.setTitleColor(HYRedBackgroundColor, forState: .Selected)
        
        ///设置标题字体
        titleBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        btnX = CGFloat(i) * btnW
            
        titleBtn.frame = CGRectMake(btnX, 0, btnW, btnH)
            
        ///监听点击事件
        titleBtn.addTarget(self, action: #selector(HYBaseMenuViewController.titleBtnOnclick(_:)), forControlEvents: .TouchUpInside)
        topView?.addSubview(titleBtn)
            
            
           if i == 0 {///添加下划线
            
           let h : CGFloat = 1.5
           let y : CGFloat = (topView?.HY_height)! - h
                
           underLineView = UIView()
           underLineView?.HY_height = h
           titleBtn.titleLabel?.sizeToFit()
           underLineView?.HY_width = (titleBtn.titleLabel?.HY_width)!
           underLineView?.HY_centerX = titleBtn.HY_centerX
           underLineView?.HY_y = y
           underLineView?.backgroundColor = HYRedBackgroundColor
           topView?.addSubview(underLineView!)
           titleBtnOnclick(titleBtn)
                
            }
        titleBtns?.append(titleBtn)
        }
    }
    
    ///选中按钮
    private func selBtn(titleBtn : UIButton){
    selectBtn?.selected = false
    titleBtn.selected = true
    selectBtn = titleBtn
    
    //移动下划线位置
        
        //UIView.animateWithDuration(0.25) {
      self.underLineView?.HY_centerX = titleBtn.HY_centerX
        //}
    
    }
    
    
    ///标题按钮点击事件
   @objc private func titleBtnOnclick(titleBtn : UIButton){
        let i : Int = titleBtn.tag
        
    ///重复点击标题按钮的时候刷新当前界面
    if titleBtn == selectBtn {
    //刷新当前界面
    let vc = childViewControllers[i] as? HYBaseRecommendViewController
    vc!.updateData()
        }
 
   //1.选中标题
   selBtn(titleBtn)
   //2.切换界面 滚动collectionView 修改偏移量
    let offsetX : CGFloat = CGFloat(i) * HYScreenW
    collectionView?.contentOffset = CGPointMake(offsetX, 0)
    }
}


// MARK: - 代理方法
extension HYBaseMenuViewController : UICollectionViewDelegate , UICollectionViewDataSource{

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
     ///获取角标
     let i :CGFloat = scrollView.contentOffset.x / HYScreenW
     ///获取选中标题
    let selBtn : UIButton = (titleBtns?[Int(i)] as? UIButton)!
     
    ///选中标题
     self.selBtn(selBtn)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    ///有新的cell出现的时候才会调用
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath)
        
        ///移除之前的子控制器的View
        for view : UIView in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        cell.backgroundColor = UIColor.whiteColor()
        
        ///取出对应的子控制器添加到对应的cell上
        let vc = childViewControllers[indexPath.row]
        vc.view.frame = HYScreen
        cell.contentView.addSubview(vc.view)
        
        return cell
    }
}

// MARK: - 生命周期
extension HYBaseMenuViewController{

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
        guard isInitial == false  else {
        ///添加所有标题
        setUpAllTitle()
        isInitial = true
        return
        }
    }
}




