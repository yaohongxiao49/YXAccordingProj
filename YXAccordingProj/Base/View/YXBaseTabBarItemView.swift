//
//  YXBaseTabBarItemView.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

typealias YXBaseTabBarItemViewTapBlock = (YXBaseTabBarItemView) ->(Void)

class YXBaseTabBarItemView: UIView {
    
    var yxBaseTabBarItemViewTapBlock: YXBaseTabBarItemViewTapBlock?
    var imgV : UIImageView?
    var titleLab : UILabel?
    var btn : UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- progress
    //FIXME: 点击按钮
    @objc func progressBtn(sender: UIButton) {
        
        self.yxBaseTabBarItemViewTapBlock!(self)
    }
    
    //MARK:- setting
    public var itemModel : YXBaseTabBarItemModel? {
        didSet {
            
            updateView()
        }
    }
    
    //MARK:- 初始化视图
    func initView() {
     
        let tapGesture = UITapGestureRecognizer.init(target: self, action: Selector(("tapGesture")))
        self.addGestureRecognizer(tapGesture)
        
        self.imgV = UIImageView.init(frame: CGRect.init(x: 0, y: 6, width: self.bounds.size.width, height: 25))
        self.imgV?.contentMode = .scaleAspectFit
        self.addSubview(self.imgV!)
        
        self.titleLab = UILabel.init(frame: CGRect.init(x: 0, y: (self.imgV?.frame.maxY)!, width: self.bounds.size.width, height: 16))
        self.titleLab?.textAlignment = .center
        self.titleLab?.font = .boldSystemFont(ofSize: 10)
        self.titleLab?.textColor = UIColor.white
        self.addSubview(self.titleLab!)
        
        self.btn = UIButton.init(type: UIButton.ButtonType.custom)
        self.btn?.backgroundColor = UIColor.clear
        self.btn?.frame = self.bounds
        self.btn?.addTarget(self, action: #selector(progressBtn), for: UIControl.Event.touchUpInside)
        self.addSubview(self.btn!)
    }
    
    //MARK:- 更新视图
    func updateView() {
        
        switch self.itemModel?.type {
        case .YXBaseTabBarItemStateTypeNor:
            self.imgV?.image = UIImage.init(named: (self.itemModel?.norIcon!)! as String)
            self.titleLab?.textColor = self.itemModel?.norTitleColor
        case .YXBaseTabBarItemStateTypeSel:
            self.imgV?.image = UIImage.init(named: (self.itemModel?.selIcon!)! as String)
            self.titleLab?.textColor = self.itemModel?.selTitleColor
        default:
            self.imgV?.image = UIImage.init(named: (self.itemModel?.norIcon!)! as String)
            self.titleLab?.textColor = self.itemModel?.norTitleColor
        }
        
        self.titleLab?.text = self.itemModel?.itemTitle as String?
    }
}
