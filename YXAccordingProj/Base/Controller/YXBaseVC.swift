//
//  YXBaseVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

class YXBaseVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
