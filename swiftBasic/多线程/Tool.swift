//
//  Tool.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2017/3/5.
//  Copyright © 2017年 tinypace. All rights reserved.
//

import UIKit

class Tool: NSObject {
    static let shareTool = Tool()
    
    // 私有化构造方法，阻止其他对象使用这个类的默认的'()'构造方法
    private override init() {}
}
