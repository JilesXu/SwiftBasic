//
//  ThreadViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2017/2/5.
//  Copyright © 2017年 tinypace. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /**********NSThread**********/
        //方法1:创建并启动
//        let thread = Thread.init(target: self, selector: #selector(run), object: nil)
//        thread.name = "thread1"
//        thread.start()
        
        //方法2:创建并自启动
//        Thread.detachNewThreadSelector(#selector(run), toTarget: self, with: nil)
//        print(Thread.current)
        /**********GCD**********/
        //第一点：主队列
        let queue = DispatchQueue.main
        //第二点：全局队列
        var queueGlobal = DispatchQueue.global(qos: .userInitiated)
        // 如果不指定qos那就是默认default  global(qos: .default)
        queueGlobal = DispatchQueue.global()
        //第二点：自己创建的队列
        let queue1 = DispatchQueue.init(label: "queue1", qos: .default, attributes:.concurrent)
        print(queue)

    }
    public func run() {
        print(Thread.current)
    }
}
