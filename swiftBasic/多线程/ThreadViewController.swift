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
//        let delay = DispatchTime.now() + 5
//        
//        DispatchQueue.main.asyncAfter(deadline: delay) {
//            print(Thread.current)
//            print("hello world")
//        }
        //第六点：队列组
//        let group = DispatchGroup.init()
//        let queue5 = DispatchQueue.global()
//        
//        queue5.async(group: group, qos: .default) { 
//            for _ in 0..<3 {
//                NSLog("group-01 - %@", Thread.current)
//            }
//        }
//        DispatchQueue.main.async(group: group) { 
//            for _ in 0..<2 {
//                NSLog("group-02 - %@", Thread.current)
//            }
//        }
//        group.notify(queue: DispatchQueue.main) { 
//            print("完成*****\(Thread.current)")
//        }
        //NSBlockOperation
//        let operation = BlockOperation.init { 
//            print(Thread.current)
//        }
//        for i in 0..<5 {
//            operation.addExecutionBlock {
//                print("第\(i)次*****\(Thread.current)")
//            }
//        }
//        
//        operation.start()
        
        //第七点：创建队列 主队列
//        let queue6 = OperationQueue.main
        //第八点：其他队列
//        let queue = OperationQueue()
//    
//        let operation = BlockOperation.init { 
//            print(Thread.current)
//        }
//        for i in 0..<5 {
//            operation.addExecutionBlock { () -> Void in
//                print("第\(i)次 - \(Thread.current)")
//            }
//        }
//        queue.addOperation(operation)
        
        let queue7 = OperationQueue.init()
        let operation1 = BlockOperation.init { 
            print("下载图片")
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        let operation2 = BlockOperation.init { 
            print("打水印")
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        let operation3 = BlockOperation.init { 
            print("上传图片")
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        operation2.addDependency(operation1)
        operation3.addDependency(operation2)
        
        queue7.addOperations([operation1, operation2, operation3], waitUntilFinished: false)
        
    }
    public func run() {
        print(Thread.current)
    }
}
