//
//  YXToolVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/12.
//

import UIKit
import AVFoundation

class YXToolVC: YXBaseVC, AVCapturePhotoCaptureDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        self.navigationView.titleLab.text = "工具"
        
        initView()
    }
    
    //MARK:- 初始化视图
    func initView() {
        
        let vc: YXPhotoVC = YXPhotoVC.init()
        self.pushToSonVC(vc: vc, animated: true)
    }
    
}
