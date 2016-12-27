//
//  DelegateViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/22.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditViewControllerDelegate {

    @IBOutlet var myTableView: UITableView!
    public var dataSource: [Dictionary<String, Any>]?
    public var selectIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createDataSource()
        self.selectIndexPath = IndexPath()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DelegateTableViewCell = self.myTableView.dequeueReusableCell(withIdentifier: "DelegateCell" , for: indexPath) as! DelegateTableViewCell
        let tempItem: Dictionary? = self.dataSource![indexPath.row]
        if tempItem != nil {
            let personName:String = tempItem!["name"] as! String
            cell.myLabel.text = personName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndexPath? = indexPath
        let currentSelectCell: DelegateTableViewCell? = self.myTableView.cellForRow(at: selectIndexPath!) as? DelegateTableViewCell
        let editViewController: DelegateEditViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DelegateEditViewController") as! DelegateEditViewController
        
        editViewController.delegate = self
        
        if currentSelectCell != nil {
            print(currentSelectCell!.myLabel.text!)
            
            editViewController.personOldName = currentSelectCell!.myLabel.text!
            print(editViewController.personOldName)
        self.navigationController?.pushViewController(editViewController, animated: true)
        }
    }
    
    public func fetchPersonName(name: String) {
        if selectIndexPath != nil {
            //获取当前点击Cell的索引
            let index = (selectIndexPath?.row)!
            print(self.dataSource!)
            //更新数据源中相应的数据
            self.dataSource![index]["name"] = name
            
            //重载TableView
            self.myTableView.reloadData()
        }
    }
    
    public func createDataSource() {
        self.dataSource = [Dictionary]()
        self.dataSource?.append(["name":"Jiles"])
        self.dataSource?.append(["name":"Amy"])
        self.dataSource?.append(["name":"Herry"])
    }
}
