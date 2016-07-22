//
//  HYNetWorkTools.swift
//  XiangHa
//
//  Created by 韩越 on 16/6/19.
//  Copyright © 2016年 ios. All rights reserved.
//

import UIKit
import AFNetworking


///网络请求类型的枚举
enum RequestType {
    case GET
    case POST
}


class HYNetWorkTools: AFHTTPSessionManager {

    ///单例
    static let shareIntance : HYNetWorkTools = {
    let tools = HYNetWorkTools()
    //添加text/html格式
    tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
    
    
    
    
}

// MARK: - 封装网络请求的方法
extension HYNetWorkTools{

    func request(requestType :RequestType,URLString:String,paramters : [String : NSObject],finishedCallback :(result:AnyObject?,error :NSError?)->()) -> () {
        
        
      //1.抽取成功的回调
        let successCallBack = { (task :NSURLSessionDataTask, result :AnyObject?) in
            finishedCallback(result:result,error :nil)
        }
      //2.抽取失败的回调
        let failureCallBack = { (task :NSURLSessionDataTask?, error :NSError) in
            finishedCallback(result:nil,error :error)
        }
        
      //3.发送网络请求
        
        if requestType == .GET {
        
        GET(URLString, parameters: paramters, progress: nil, success:successCallBack , failure: failureCallBack)
        
        
        }else {
        
        POST(URLString, parameters: paramters, progress: nil, success: successCallBack, failure: failureCallBack)
        
        }
        
    }


}