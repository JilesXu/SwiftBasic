//
//  AnimationViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2017/3/11.
//  Copyright © 2017年 tinypace. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userTF)
        view.addSubview(pswTF)
        
        var accountCenter = userTF.center
        accountCenter.x += 200
        
        UIView.animate(withDuration: 1, delay: 0.5, options:.curveEaseInOut, animations: {
            self.userTF.center = accountCenter
        }) { (true) in
            self.userTF.placeholder = "到位"
        }
    }
    
    //MARK: -Setter And Getter
    lazy var userTF: UITextField = {
        var userTF: UITextField = UITextField.init(frame: CGRect.init(x: -100, y: 200, width: 200, height: 50))
        userTF.backgroundColor = UIColor.red
        return userTF
    }()
    lazy var pswTF: UITextField = {
        var pswTF: UITextField = UITextField.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 50))
        pswTF.backgroundColor = UIColor.blue
        return pswTF
    }()
}
