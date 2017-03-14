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
        view.addSubview(nextBtn)
        
        let viewBGCenter = self .view.center.x
        var accountCenter = self.userTF.center
        accountCenter.x = viewBGCenter
        
        var passwordCenter = self.pswTF.center
        passwordCenter.x = viewBGCenter
        
        UIView.animate(withDuration: 0.4, delay: 0.5, options:.curveEaseOut, animations: {
            self.userTF.center = accountCenter
        }) { (true) in
            self.userTF.placeholder = "用户名"
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.pswTF.center = passwordCenter
        }) { (true) in
            self.pswTF.placeholder = "密码"
        }
        
        UIView.animate(withDuration: 0.4, delay: 1, options: .curveEaseOut, animations: { 
            self.userTF.frame.size = CGSize.init(width: 300, height: 100)
            self.userTF.center = self.view.center
        }) { (true) in
            
        }
        
        UIView.transition(from: self.userTF, to: self.pswTF, duration: 0.5, options: .transitionCrossDissolve) { (true) in
            
        }
    }
    
    //MARK: -Events
    func nextBtnPressed(sender: UIButton) -> Void {
        let viewContoller: SecAnimationViewController = SecAnimationViewController()
        self.navigationController?.pushViewController(viewContoller, animated: true)
    }
    
    //MARK: -Setter And Getter
    lazy var userTF: UITextField = {
        var userTF: UITextField = UITextField.init(frame: CGRect.init(x: -300, y: 200, width: 200, height: 50))
        userTF.backgroundColor = UIColor.red
        return userTF
    }()
    
    lazy var pswTF: UITextField = {
        var pswTF: UITextField = UITextField.init(frame: CGRect.init(x: -300, y: 100, width: 200, height: 50))
        pswTF.backgroundColor = UIColor.blue
        return pswTF
    }()
    
    lazy var nextBtn: UIButton = {
        var nextBtn: UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 400, width: 250, height: 100))
        nextBtn.backgroundColor = UIColor.red
        nextBtn.setTitle("下一页", for: UIControlState.normal)
        nextBtn.addTarget(self, action: #selector(nextBtnPressed), for: UIControlEvents.touchUpInside)
        return nextBtn
    }()
}
