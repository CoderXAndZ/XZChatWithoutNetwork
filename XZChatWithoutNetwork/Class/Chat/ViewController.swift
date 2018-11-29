//
//  ViewController.swift
//  XZChatWithoutNetwork
//
//  Created by admin on 2018/11/24.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: XZBaseViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    /// 用户输入文字
    private var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        view.backgroundColor = .white
       
    }
    
    /// 发送数据
    @objc private func sendData(words: String) {
        
        (self.tabBarController as? XZMainViewController)?.client?.write(words.data(using: .utf8)!, withTimeout: 5, tag: 123)
    }
    
    /// 发送
    @IBAction func sendAction(_ sender: UIButton) {
        textView.resignFirstResponder()
        
        print("向服务器发送数据:", text)
        sendData(words: text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        textView.resignFirstResponder()
    }
    
    deinit {
       
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        text = textView.text
    }
}

//   private var timer: Timer?
///// 开启时间定时器
//private func startTimer() {
//    timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(sendData), userInfo: nil, repeats: true)
//}
//
//private func stopTimer() {
//    timer?.invalidate()
//    timer = nil
//}

//        if #available(iOS 10.0, *) {
//            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {[weak self] (time) in
//
//                // 发送数据
//                if let weakSelf = self {
//                    print("发送数据")
//                    weakSelf.sendData(words: text)
//                }
//            })
//        }else {
//            startTimer()
//        }
