//
//  HYCookTopScrollerView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/20.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCookTopScrollerView: HYBaseView {

    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageViewControl: UIPageControl!
    
    
    //子控件数组
    lazy var scrollViews : [HYCookTopImageView] = [HYCookTopImageView]()
    
    //页数
    let pages = 3
    
    //搜索闭包
   static var search :(()->())?    
    //当前显示的view
    var showImageView :HYCookTopImageView?

//  lazy var items : [HYCookViewItem] = [HYCookViewItem]()
    
    var leftView  = HYCookTopImageView.view() as? HYCookTopImageView
    var rightView  = HYCookTopImageView.view() as? HYCookTopImageView
    var middleView  = HYCookTopImageView.view() as? HYCookTopImageView
    
    //替换模型
    var TempCookItem : HYCookViewItem?
    
    override func awakeFromNib() {
        setup()
    }
    
    
    ///包含搜索闭包的类构造方法
    class func view(search :(()->())?) -> HYBaseView {
    self.search = search
    return super.view()
    }
  
    
    
  @IBAction func searchOnclick() {
    print("点击搜索按钮")
    if let search = HYCookTopScrollerView.search{
    search()
        }
    }
    
  
}

// MARK: - 初始化和加载网络数据扩充类
extension HYCookTopScrollerView{
    private func setup()  {
        //设置页码
        pageViewControl.numberOfPages = pages
        scrollView.pagingEnabled = true
        
        ///添加到scrollview中
        scrollView.insertSubview(leftView!, atIndex: 0)
        scrollView.insertSubview(rightView!, atIndex: 0)
        scrollView.insertSubview(middleView!,atIndex: 0)

        //添加到数组中
        scrollViews = [leftView!,middleView!,rightView!]
        ///设置滚动空间
        scrollView.contentSize = CGSizeMake(HYScreenW * 3, scrollView.HY_height)
        //隐藏滚动滑块
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        
        showImageView = leftView
        
//        setScrollViewsAlpha(false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftView?.frame = CGRectMake(0, 0, HYScreenW, scrollView.HY_height)
     
        middleView?.frame  = CGRectMake(HYScreenW, 0, HYScreenW, scrollView.HY_height)
        
        rightView?.frame = CGRectMake(HYScreenW * 2, 0, HYScreenW, scrollView.HY_height)
        }
    }


// MARK: - 滚动代理扩充
extension HYCookTopScrollerView : UIScrollViewDelegate{

    
    ///滚动监听
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        setScrollViewsAlpha(true)
        /**
         *  无限循环滚动
         */
        let offset = scrollView.contentOffset.x
        loop(offset)
        
    }

    ///无限循环♻️
    func loop(offset : CGFloat) {
        if offset > 2 * HYScreenW {//向右滚动
            //顺序
            for(i,view)in scrollViews.enumerate(){
                if i == 0{
                //第一个
         TempCookItem = scrollViews.last?.cookItem
         scrollViews.last?.cookItem = view.cookItem
                }
                if i == scrollViews.count - 2{
                //倒数第二个
                view.cookItem = TempCookItem
                break
                }
                scrollViews[i].cookItem = scrollViews[i+1].cookItem
            }
        //滚动到中间位置
        self.scrollView.contentOffset = CGPointMake(HYScreenW, 0)
        }else if offset < 0 {//向左滚动
           //倒序
            for(i,view)in scrollViews.enumerate().reverse(){
                if i == scrollViews.count - 1{
            //最后一个
          TempCookItem = scrollViews.first?.cookItem
          scrollViews.first?.cookItem = view.cookItem
                }
            if i == 1{
                    //正数第二个
                view.cookItem = TempCookItem
                    break
                }
              scrollViews[i].cookItem = scrollViews[i-1].cookItem
            }
       ///滚动到中间位置
       self.scrollView.contentOffset = CGPointMake(HYScreenW, 0)
        }
    }
    
    
    
    ///减速结束
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
    setPageCurrent(offset)
//    setScrollViewsAlpha(false)
    }

    ///滚动结束
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        guard !decelerate else {
            let offset = scrollView.contentOffset.x
            setPageCurrent(offset)
                  return
        }
 
    }
    
     ///设置页码和显示的view
    func setPageCurrent(offset : CGFloat){
        switch offset {
        case 0:
            pageViewControl.currentPage = (leftView?.current)!
            showImageView = leftView
        case HYScreenW * 2:
            pageViewControl.currentPage = (rightView?.current)!
            showImageView = rightView
        default:
            pageViewControl.currentPage = (middleView?.current)!
            showImageView = middleView
        }
    }
 
    
    ///设置透明度
    /*
    func setScrollViewsAlpha(isShow : Bool)  {
        //alpha 设置显示的view为 1  其它的为0
        guard isShow else{
            for view in scrollViews {
                if view == showImageView {
                    view.imageView.alpha = 1
                }else{ view.imageView.alpha = 0 }
            }
        return
        }
        //alpha 全部设为 1
        for view in scrollViews {
                view.imageView.alpha = 1
        }
      
    }
     */
}