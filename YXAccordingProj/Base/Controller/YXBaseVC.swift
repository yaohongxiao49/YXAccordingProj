//
//  YXBaseVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit
import SnapKit

class YXBaseVC: UIViewController {
    
    lazy var navigationView : YXBaseNavigationView = {
        
        let navigationView = YXBaseNavigationView.init();
        navigationView.baseVC = self
        self.view.addSubview(navigationView)
        navigationView.snp.makeConstraints { make in
            
            make.left.top.right.equalToSuperview()
            make.height.equalTo(self.yxNavigationHeight)
        }
        
        return navigationView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    
}
