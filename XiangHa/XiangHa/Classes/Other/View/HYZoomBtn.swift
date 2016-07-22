//
//  HYZoomBtn.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/30.
//  Copyright © 2016年 ios. All rights reserved.
//

//点击后图片缩放的button

import UIKit

class HYZoomBtn: HYRoundCornerView {
    //选择状态
    var selected : Bool = false
    //图片
    private var imgView : UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = true
        self.imgView.userInteractionEnabled = true
        addSubview(imgView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置尺寸
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.sizeToFit()
        imgView.center = CGPointMake(self.HY_width * 0.5, self.HY_height * 0.5)
   
    }
    
    ///默认图片
    var img : UIImage?{
    
        didSet{
        imgView.image = img
        }
    
    }
    ///选中图片
    var selectedImg : UIImage?
    
    ///点击事件的闭包
    private  var  block : (()->())?
    
    //添加点击监听
    func addAction( block:()->()) {
       self.block = block
       let tap = UITapGestureRecognizer(target: self, action: #selector(HYZoomBtn.action))
        
       self.addGestureRecognizer(tap)
        
    }
    
    @objc private  func action()  {
        
            //动画执行时间
            let duration = 0.15
        
            // 设定为缩放
            let animation  = CABasicAnimation (keyPath: "transform.scale")
        
            // 动画选项设定
            animation.duration = duration; // 动画持续时间
            
            // 缩放倍数
            animation.fromValue = 1.0 // 开始时的倍率
            animation.toValue = 0.0 // 结束时的倍率
            animation.autoreverses = true // 动画结束时执行逆动画

            // 添加动画  
            self.imgView.layer.addAnimation(animation, forKey: "scale-layer")
        
            //动画结束后切换图片
            HYDispatch_after.execute(duration, blok: {
            self.imgView.image = self.selected ? self.selectedImg : self.img
            })
        
           selected = !selected
        
           self.block!()
        
    }

}
