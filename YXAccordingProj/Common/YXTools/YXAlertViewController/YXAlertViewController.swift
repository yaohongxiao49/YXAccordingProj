//
//  YXAlertViewController.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/14.
//

import UIKit

/** 弹窗类型 */
enum YXAlertViewControllerStyle {
    /** alert */
    case YXAlertViewControllerStyleAlert
    /** sheet */
    case YXAlertViewControllerStyleActionSheet
}

/** 动画 */
enum YXAlertTransitionAnimation {
    case YXAlertTransitionAnimationFade
    case YXAlertTransitionAnimationScaleFade
    case YXAlertTransitionAnimationDropDown
    case YXAlertTransitionAnimationCustom
}

class YXAlertViewController: UIViewController {
    
    private(set) var alertView: UIView?
    var backgroundView: UIView?
    private(set) var preferredStyle: YXAlertViewControllerStyle?
    private(set) var transitionAnimation: YXAlertTransitionAnimation?
    private(set) var transitionAnimationClass: AnyClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

}
