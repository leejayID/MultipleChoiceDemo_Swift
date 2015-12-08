//
//  MultipleChoiceViewController.swift
//  MultipleChoiceDemo_Swift
//
//  Created by LeeJay on 15/12/8.
//  Copyright © 2015年 以撒网. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CellDelegate {

    var tableView: UITableView = UITableView()
    var dataSource: NSMutableArray = NSMutableArray()
    
    func onBtn(sender: UIButton) {
        
//        for model in dataSource as! [MultipleChoiceModel] {
//            model.select = true
//        }
        sender.selected = !sender.selected
        if sender.selected {
            sender.setTitle("全不选", forState: .Normal)
            for var i=0; i<dataSource.count; i++ {
                let model: MultipleChoiceModel = dataSource[i] as! MultipleChoiceModel
                model.select = true
            }
        } else {
            sender.setTitle("全选", forState: .Normal)
            for var i=0; i<dataSource.count; i++ {
                let model: MultipleChoiceModel = dataSource[i] as! MultipleChoiceModel
                model.select = false
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button: UIButton = UIButton()
        button.frame = CGRectMake(0, 0, 50, 30)
        button.setTitle("全选", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.addTarget(self, action: Selector("onBtn:"), forControlEvents: .TouchUpInside)
        let buttonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = buttonItem;
        
        self.title = "多选"
        self.view.backgroundColor = UIColor.whiteColor()
    
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.registerClass(MultipleChoiceTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        let arr: [String] = ["照片",
                            "姓名",
                            "性别",
                            "证件",
                            "出生年月",
                            "手机",
                            "微信",
                            "QQ",
                            "邮箱",
                            "行业",
                            "职位",
                            "企业名称",
                            "目前薪资",
                            "学历",
                            "工作年限",
                            "婚姻状况",
                            "现居住地",
                            "工作经历",
                            "照片",
                            "姓名",
                            "性别",
                            "证件",
                            "出生年月",
                            "手机",
                            "微信",
                            "QQ",
                            "邮箱",
                            "行业",
                            "职位",
                            "企业名称",
                            "目前薪资",
                            "学历",
                            "工作年限",
                            "婚姻状况",
                            "现居住地",
                            "工作经历"];
        
        for name in arr {
            let model: MultipleChoiceModel = MultipleChoiceModel()
            model.name = name
            model.select = false
            dataSource.addObject(model)
        }
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MultipleChoiceTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MultipleChoiceTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        let model: MultipleChoiceModel = dataSource[indexPath.row] as! MultipleChoiceModel
        cell.model = model
/*
        cell.CallBackBlock = {[weak self](isSelect: Bool, indexPath: NSIndexPath) ->Void in
            let model: MultipleChoiceModel = self!.dataSource[indexPath.row] as! MultipleChoiceModel
            model.select = isSelect
            self!.dataSource.replaceObjectAtIndex(indexPath.row, withObject: model)
            tableView.reloadData()
        }
*/
        return cell
    }
    
    func cellForSelect(isSelect: Bool, atIndexPath indexPath: NSIndexPath) {
        let model: MultipleChoiceModel = dataSource[indexPath.row] as! MultipleChoiceModel
        model.select = isSelect
        dataSource.replaceObjectAtIndex(indexPath.row, withObject: model)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
