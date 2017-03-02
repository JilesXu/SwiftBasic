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
//        //第一点：主队列
//        let queue = DispatchQueue.main
//        //第二点：全局队列
//        var queueGlobal = DispatchQueue.global(qos: .userInitiated)
//        // 如果不指定qos那就是默认default  global(qos: .default)
//        queueGlobal = DispatchQueue.global()
//        //第二点：自己创建的队列
//        let queue1 = DispatchQueue.init(label: "queue1", qos: .default, attributes:.concurrent)//并行队列
//        //第三点：同步任务 会阻塞当前线程
//        let queue2 = DispatchQueue.init(label: "queue2")
//        queue2.sync {
//            print("Hello World")
//        }
//        //第四点：异步任务 不会阻塞当前线程
//        let queue3 = DispatchQueue(label: "queue3")
//        queue3.async {
//            print("Hello World")
//        }
//        print("Hello")
        
        /**********为了更好的理解同步和异步，和各种队列的使用，下面看两个示例**********/
        /*****示例一*****/
//        print("之前**********/\(Thread.current)")
//        DispatchQueue.main.sync {
//            print("sync**********/\(Thread.current)")
//        }
//        print("之后**********/\(Thread.current)")
        
        /*****示例二*****/
//        let queue4 = DispatchQueue.init(label: "queue4")
//        print("之前**********/\(Thread.current)")
//        queue4.async {
//            print("sync之前**********/\(Thread.current)")
//            queue4.sync {
//                print("sync**********/\(Thread.current)")
//            }
//            print("sync之后**********/\(Thread.current)")
//        }
//        print("之后**********/\(Thread.current)")
        //第五点：延时执行
        let delay = DispatchTime.now() + 5
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            print(Thread.current)
            print("hello world")
        }
    }
    public func run() {
        print(Thread.current)
    }
}
