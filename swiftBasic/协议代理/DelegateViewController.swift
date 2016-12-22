//
//  DelegateViewController.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/22.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var myTableView: UITableView!
    private var dataSource: Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.dataSource = self
        self.createDataSource()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DelegateTableViewCell = self.myTableView.dequeueReusableCell(withIdentifier: "DelegateCell" , for: indexPath) as! DelegateTableViewCell
//        let tempItem: Dictionary? = self.dataSource[indexPath.row]
//        if tempItem != nil {
//            let imageName:String = tempItem![IMAGE_NAME]!
//            cell.girlImageView.image = UIImage(named: imageName)
//            
//            let girlName:String = tempItem![GIRL_NAME]!
//            cell.girlNameLable.text = girlName
//        }
        return cell
    }
    public func createDataSource() {
        self.dataSource = [{"name" : "Jiles"}, {"name" : "May"}, {"name" : "Amy"}]
    }
}
