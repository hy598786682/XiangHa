//
//  HYStretchableTableHeaderView.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/24.
//  Copyright © 2016年 ios. All rights reserved.
//

/// 可拉伸tableViewHeaderView

import UIKit

class HYStretchableTableHeaderView: NSObject {

    
    private weak var  view  :UIView?
    private weak var  tableView : UITableView?
    private var  initialFrame : CGRect?
    private var defaultViewHeight : CGFloat?
    
    
    func stretchHeaderForTableView(tableView : UITableView , view :UIView , viewFrame : CGRect , subView :UIView)  {
       
      self.tableView = tableView
      self.view = view
      view.frame = viewFrame
      self.initialFrame = self.view?.frame
      self.defaultViewHeight = initialFrame?.height
        
    let emptyTableHeaderView : UIView = UIView (frame:initialFrame!)
     
    self.tableView?.tableHeaderView = emptyTableHeaderView
        
    self.tableView?.addSubview(self.view!)
    self.tableView?.addSubview(subView)
        
    }
    
    
    
    func scrollViewDidScroll(scrollView : UIScrollView) {
      
        var f : CGRect   = self.view!.frame;
        f.size.width = (self.tableView?.HY_width)!;
        self.view!.frame  = f;
        
        if(scrollView.contentOffset.y < 0)
        {
            let offsetY :CGFloat = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
            
            self.initialFrame!.origin.y =  offsetY * -1;
            
//           self.initialFrame!.origin.x =  offsetY * -0.5;
//            self.initialFrame!.size.width  = (self.tableView?.HY_width)! + offsetY;
            
            self.initialFrame!.size.height = self.defaultViewHeight! + offsetY;
            
            self.view!.frame = initialFrame!;
        
        }

    }

    ///设置尺寸
    func resizeView() {
        
        self.initialFrame!.size.width = (self.tableView?.HY_width)!
        self.view!.frame = initialFrame!
        
    }
}
