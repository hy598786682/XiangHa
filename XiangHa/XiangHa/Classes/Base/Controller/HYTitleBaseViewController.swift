//
//  HYTitleBaseViewController.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/24.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYTitleBaseViewController: UIViewController {

    var VcTitle: String? = ""
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    title = VcTitle
    view.backgroundColor = UIColor.whiteColor()//
    }

    
    /**
     title构造方法
     
     - parameter title: 标题
     
     - returns: HYTitleBaseViewController
     */
    init(title : String){
    self.VcTitle = title
    super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
    super.init(nibName: nil, bundle: nil )
    }

    
}
