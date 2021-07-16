//
//  YXHomeAlertView.swift
//  YXAccordingProj
//
//  Created by ios on 2021/6/30.
//

import UIKit

class YXHomeAlertView: UIView, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView: UITableView = {
       
        let tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        tableView.estimatedRowHeight = 30
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        
        tableView.register(YXHomeAlertViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(YXHomeAlertViewCell.classForCoder()))
        
        return tableView
    }()
    
    //MARK:- UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: YXHomeAlertViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YXHomeAlertViewCell.classForCoder()), for: indexPath) as! YXHomeAlertViewCell
        
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 初始化视图
    func initView() {
                
        self.tableView.reloadData()
    }
    
}
