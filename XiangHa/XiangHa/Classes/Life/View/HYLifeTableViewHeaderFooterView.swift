//
//  HYLifeTableViewHeaderFooterView.swift
//  XiangHa
//
//  Created by 韩越 on 16/7/12.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYLifeTableViewHeaderFooterView: UITableViewHeaderFooterView {

    var isOpen : Bool = false
    
    var onclick : (() -> ())?
    
    
    private var imageView : UIImageView? = nil
    
    override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
        
    contentView.backgroundColor = HYcollectionViewBackgroundColor
        
    imageView = UIImageView(image: UIImage(named: "z_quan_ico_more_arrow"))
    imageView?.transform = CGAffineTransformMakeRotation(3 * CGFloat(M_PI_2));
    contentView.addSubview(imageView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     imageView?.sizeToFit()
     imageView?.center = contentView.center
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if self.onclick != nil{
        
        isOpen = !isOpen
        
       let point = isOpen ? CGFloat(3 * M_PI_2) : CGFloat(M_PI_2)
            
       imageView?.transform = CGAffineTransformMakeRotation(point);

       self.onclick!()
        
       }
    }
    
    
    

}
