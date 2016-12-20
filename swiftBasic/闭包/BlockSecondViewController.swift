//
//  BlockSecondViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/20.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

class BlockSecondViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var backToFirstViewControllerButton: UIButton!
    
    typealias InputClosureType = (String) -> Void
    var backClosure : InputClosureType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backClosure == nil ? print("yes") : print("no")
    }
    ///swift3.0默认闭包不可逃逸,所以需要声明逃逸闭包,闭包setter方法
    func setBackClosure(tempClosure: @escaping InputClosureType) {
        self.backClosure = tempClosure
        self.backClosure == nil ? print("yes") : print("no")
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.backClosure == nil ? print("yes") : print("no")
        if self.backClosure != nil {
            let tempString : String? = self.textField.text
            if tempString != nil {
                backClosure!(tempString!)
            }
        }
        self.navigationController!.popViewController(animated: true)
    }
}
