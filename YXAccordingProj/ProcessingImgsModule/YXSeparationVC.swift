//
//  YXSeparationVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/14.
//

import UIKit

class YXSeparationVC: YXBaseVC {
    
    var model: YXHomeListModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationView.titleLab.text = "相册选择"
        self.navigationView.backBtn.isHidden = false
        
        initView()
    }
    
    //MARK:- 初始化视图
    func initView() {
        
    }

}
