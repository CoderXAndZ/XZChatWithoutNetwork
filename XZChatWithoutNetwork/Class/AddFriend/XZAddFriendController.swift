//
//  XZAddFriendController.swift
//  XZChatWithoutNetwork
//
//  Created by admin on 2018/11/24.
//  Copyright © 2018年 admin. All rights reserved.
//  添加好友

import Foundation

class XZAddFriendController: XZBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        view.backgroundColor = .orange
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
}
