//
//  HYCollectionTableViewCell.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/25.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit

class HYCollectionTableViewCell: HYBaseTableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    
    let ID = "cell"

    var users : NSMutableArray? {
        didSet{
         
        collection.reloadData()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupFoot()
    }

}


extension HYCollectionTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{

    
    
    private func setupFoot()  {
     
     
        
      let flowLayout = UICollectionViewFlowLayout()
        
      let H :CGFloat = collection.HY_height
        
      let W : CGFloat = H * 0.73
        
      flowLayout.itemSize = CGSizeMake(W, H)
      
        
        
      flowLayout.scrollDirection = .Horizontal
        
      flowLayout.minimumLineSpacing = 0
       
      flowLayout.minimumInteritemSpacing = 0
        
        
      collection?.setCollectionViewLayout(flowLayout, animated: true)
      collection?.backgroundColor = UIColor.whiteColor()
        
      collection!.delegate = self
        
      collection!.dataSource = self
        
      collection!.registerNib(UINib (nibName: "HYCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ID)
        
      collection?.showsHorizontalScrollIndicator = false
        
    }

    
    override func layoutSubviews() {
        
    super.layoutSubviews()
 
    }

}



// MARK: - 数据源代理
extension HYCollectionTableViewCell {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        //判断数组是否为空 为空返回0
        
        return users?.count ?? 0

    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath) as? HYCollectionViewCell
  
       cell!.userItem = users![indexPath.row] as? HYActiveUser
        return cell!
    }
    
    
    
    
}