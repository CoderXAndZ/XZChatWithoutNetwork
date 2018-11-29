//
//  XZMainViewController.swift
//  RTYX
//
//  Created by admin on 2017/11/24.
//  Copyright © 2017年 XZ. All rights reserved.
//  tabBar

import UIKit

class XZMainViewController: UITabBarController {
    
    var client: GCDAsyncSocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        setupChildControllers()
        //
        client = XZSocketTool().xz_client(delegate: self, queque: DispatchQueue.main, Host: "192.168.2.104", onPort: 8080, withTimeout: 10)
        
        print("client:", client ?? "没创建成功")
        
        // 监听接收数据
        client?.readData(withTimeout: -1, tag: 123)
    }
    
    deinit {
        client?.delegate = nil
        client?.disconnect()
        client = nil
    }
    
}

// MARK: - GCDAsyncSocketDelegate
extension XZMainViewController: GCDAsyncSocketDelegate {
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        
        print("连接上了服务器")
    }
    
    /// 数据接收
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        
        let recieverStr = String(data: data, encoding: .utf8)
        
//        textView.text = recieverStr
        
        print("接收到服务端的数据：", recieverStr ?? "没有数据")
        
        // 监听服务端发来的数据
        client?.readData(withTimeout: -1, tag: 123)
        
        // 本地推送
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didReadPartialDataOfLength partialLength: UInt, tag: Int) {
        
        print("didReadPartialDataOfLength:", partialLength)
    }
    
    // 数据发送
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        
        //        print("向服务器发送数据")
    }
    
    // 与服务器断开连接
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
        print("与服务器断开连接,错误：\n", err ?? "没有错误")
    }
    
}

// MARK: - 设置界面
extension XZMainViewController {
    
    // 设置所有的子控制器
    private func setupChildControllers() {
        let array = [
                     ["clsName":"ViewController","title":"消息","imgName":"message_center"],
                     ["clsName":"XZFriendsListController","title":"好友","imgName":"profile"],
                     ["clsName":"XZAddFriendController","title":"添加","imgName":"discover"]
                  ]
        
        var arrayVc = [UIViewController]()
        
        for i in 0..<array.count {
            let dic = array[i]
            let vc = controller(dict: dic)
            
            arrayVc.append(vc)
        }
        
        viewControllers = arrayVc
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: [clsName,clsName,imgName]
    /// - Returns: 子控制器
    private func controller(dict:[String:String]) -> UIViewController {
        
        // 1.取得字典的值
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imgName = dict["imgName"]
            else {
            return UIViewController()
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: clsName)
        
        // 3.给子控制器设置值
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: "tabbar_" + imgName)
        vc.tabBarItem.selectedImage = UIImage.init(named:  "tabbar_" + imgName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let nav = XZNavigationController.init(rootViewController: vc)
        
        // 4.设置 tabbar 的标题字体(大小)
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
        // 系统默认是 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)],for: .normal)
        
        return nav
    }
    
}
