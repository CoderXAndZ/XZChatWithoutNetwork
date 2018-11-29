//
//  XZBaseViewController.swift
//  RTYX
//
//  Created by admin on 2017/11/24.
//  Copyright © 2017年 XZ. All rights reserved.
//  基类

import UIKit

class XZBaseViewController: UIViewController {
    
    /// 重写 title
    override var title: String? {
        didSet {
            self.navigationItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        
    }

}
