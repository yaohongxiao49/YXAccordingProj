//
//  YXBaseNavigationView.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/11.
//

import UIKit
import SnapKit

/** 返回方式类型 */
enum YXBaseNavigationBackType {
    /** 推送方式 */
    case YXBaseNavigationBackTypePush
    /** 弹窗方式 */
    case YXBaseNavigationBackTypePresent
}

class YXBaseNavigationView: UIView {
    
    var _baseVC : YXBaseVC!
    var baseVC : YXBaseVC {
        
        get {
            return _baseVC
        }
        set {
            _baseVC = newValue
        }
    }
    
    var backType : YXBaseNavigationBackType = .YXBaseNavigationBackTypePush
    
    lazy var bgView : UIView = {
        
        let bgView = UIView.init()
        bgView.backgroundColor = UIColor.clear
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(self.yxNavigationHeight - self.yxStatusBarHeight)
        }
        return bgView
    }()
    
    lazy var titleLab : UILabel = {
        
        let titleLab = UILabel.init()
        titleLab.textAlignment = .center
        titleLab.font = UIFont.boldSystemFont(ofSize: 16)
        titleLab.textColor = UIColor.yxColorWithHexString(hex: "#000000")
        self.bgView.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return titleLab
    }()
    
    lazy var backBtn : UIButton = {
       
        let backBtn = UIButton.init(type: UIButton.ButtonType.custom)
        backBtn.setImage(UIImage.init(named: "YXBaseBackArrowImg"), for: UIControl.State.normal)
        backBtn.addTarget(self, action: #selector(progressBackBtn), for: UIControl.Event.touchUpInside)
        self.bgView.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(backBtn.snp.height)
        }
        return backBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yxColorWithHexString(hex: "#000000", alpha: 0.1)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 返回方法
    func backMethodByType(type: YXBaseNavigationBackType) {
        
    }
    
    //MARK:- 返回按钮事件
    @objc func progressBackBtn() {
        
        
    }
    
    //MARK:- 初始化视图
    func initView() {
        
        self.titleLab.text = "标题";
        self.backBtn.isHidden = true
    }
}