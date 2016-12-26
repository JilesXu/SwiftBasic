//
//  DelegateEditViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/26.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func fetchPersonName(name: String) -> Void
}

class DelegateEditViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var personOldName:String?
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.personOldName != nil {
            self.textField.text = self.personOldName!
        }
        let barItem =  UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(backToPreview))
        self.navigationItem.leftBarButtonItem = barItem
    }
    
    public func backToPreview() -> Void {
        let name:String! = self.textField.text
        if  name != "" {
            if delegate != nil {
                delegate!.fetchPersonName(name: name)
            }
        }
        self.navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
