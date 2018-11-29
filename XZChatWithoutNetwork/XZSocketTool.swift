//
//  XZSocketTool.swift
//  XZChatWithoutNetwork
//
//  Created by admin on 2018/11/24.
//  Copyright © 2018年 admin. All rights reserved.
//

import Foundation

class XZSocketTool {
    
    private var client: GCDAsyncSocket?
    
//    private var dispatch_queque = DispatchQueue.main
//    private var delelgate: GCDAsyncSocketDelegate?
//    private var host = ""
//    private var port: UInt16 = 8080
//    private var timeOut: TimeInterval = 10
    
    private func client(delegate: GCDAsyncSocketDelegate?, queque: DispatchQueue?, Host: String, onPort: UInt16, withTimeout: TimeInterval) -> GCDAsyncSocket? {
        
//        delelgate = delegate
//        dispatch_queque = queque!
//        host = Host
//        port = onPort
//        timeOut = withTimeout
        
        client = GCDAsyncSocket(delegate: delegate, delegateQueue: queque)
        
        // 连接服务器 IP 和 Port
        let isConnect: Bool = ((try? client?.connect(toHost: Host, onPort: onPort, withTimeout: withTimeout)) != nil)
        
        if isConnect {
            print("连接成功");
        }else {
            print("连接失败");
        }
        
        return client
    }
    
    func xz_client(delegate: GCDAsyncSocketDelegate?, queque: DispatchQueue?, Host: String, onPort: UInt16, withTimeout: TimeInterval) -> GCDAsyncSocket {
        
        if client != nil {
            return client!
        }else {
            let client = XZSocketTool().client(delegate: delegate, queque: queque, Host: Host, onPort: onPort, withTimeout: withTimeout)
            
            return client!
        }
        
    }
    
}
