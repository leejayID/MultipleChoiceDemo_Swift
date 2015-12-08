//
//  ViewController.swift
//  MultipleChoiceDemo_Swift
//
//  Created by LeeJay on 15/12/8.
//  Copyright © 2015年 以撒网. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    var datas: NSArray = NSArray()
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Swift学习Demo"
        
        tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        datas = ["多选","其他"]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = datas[indexPath.row]  as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let vc: MultipleChoiceViewController = MultipleChoiceViewController()
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

