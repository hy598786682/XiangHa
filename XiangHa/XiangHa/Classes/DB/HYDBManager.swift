//
//  HYDBManager.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/28.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit
import FMDB

class HYDBManager: NSObject {
    // 将类设计成单例对象
    static let shareInstance : HYDBManager = HYDBManager()
    
    // MARK:- 定义数据库对象
    var db : FMDatabase!
}


// MARK:- 打开数据库的操作
extension HYDBManager {
    func openDB(dbPath : String) -> Bool {
        db = FMDatabase(path: dbPath)
        
        return db.open()
    }
}


// MARK:- 执行SQL语句的操作
extension HYDBManager {
    func execSQL(sqlString : String) -> Bool {
        return db.executeUpdate(sqlString, withArgumentsInArray: nil)
    }
}


// MARK:- 事务相关的操作
extension HYDBManager {
    func beginTransation() {
        db.beginTransaction()
    }
    
    func commitTransation() {
        db.commit()
    }
    
    func rollbackTransation() {
        db.rollback()
    }
}


// MARK:- 查询数据操作
extension HYDBManager {
    func queryData(querySQLString : String) -> [[String : NSObject]] {
        // 1.执行查询语句
        let resultSet = db.executeQuery(querySQLString, withArgumentsInArray: nil)
        
        // 2.开始查询数据
        let count = resultSet.columnCount()
        
        // 3.定义数组
        var tempArray = [[String : NSObject]]()
        
        // 4.开始查询
        while resultSet.next() {
            var dict = [String : NSObject]()
            for i in 0..<count {
                let key = resultSet.columnNameForIndex(i)
                let value = resultSet.stringForColumnIndex(i)
                
                dict[key] = value
            }
            
            tempArray.append(dict)
        }
        
        return tempArray
    }

}
