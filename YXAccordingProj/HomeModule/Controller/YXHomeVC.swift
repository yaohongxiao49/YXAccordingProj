//
//  YXHomeVC.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

class YXHomeVC: YXBaseVC, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.yxScreenWidth, height: 40)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.headerReferenceSize = CGSize.zero
        layout.footerReferenceSize = CGSize.zero
        
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:self.yxScreenWidth, height:self.yxScreenHeight), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        
        collectionView.register(UINib.init(nibName: "YXHomeCollecCell", bundle: nil), forCellWithReuseIdentifier: NSStringFromClass(YXHomeCollecCell.classForCoder()))
        
        collectionView.snp.makeConstraints { make in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.navigationView.snp.bottom)
        }
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationView.backgroundColor = UIColor.clear
        self.navigationView.titleLab.text = "首页"
        self.view.backgroundColor = UIColor.yxColorWithHexString(hex: "#F5F5F5")
        
        initView()
    }
    
    //MARK:- UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : YXHomeCollecCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(YXHomeCollecCell.classForCoder()), for: indexPath) as! YXHomeCollecCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            return UICollectionReusableView.init()
        }
        else {
            return UICollectionReusableView.init()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 10, left: 15, bottom: 10, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.yxScreenWidth - 30, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize.zero
    }
    
    //MARK:- UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 15 {
            self.navigationView.backgroundColor = UIColor.yxColorWithHexString(hex: "#FFFFFF");
        }
        else {
            self.navigationView.backgroundColor = UIColor.clear
        }
    }
    
    //MARK:- 初始化视图
    func initView() {
        
        self.collectionView.reloadData()
    }

}
