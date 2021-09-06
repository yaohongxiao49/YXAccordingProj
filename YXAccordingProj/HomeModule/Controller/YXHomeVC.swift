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
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        self.view.bringSubviewToFront(self.navigationView)
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        
        collectionView.register(UINib.init(nibName: "YXHomeCollecCell", bundle: nil), forCellWithReuseIdentifier: NSStringFromClass(YXHomeCollecCell.classForCoder()))
        collectionView.register(UINib.init(nibName: "YXHomeCollecHeaderReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(YXHomeCollecHeaderReusableView.classForCoder()))
        
        collectionView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
        }
        
        return collectionView
    }()
    
    lazy var dataSourceArr : [YXHomeListModel] = {
       
        let valueArr : NSArray = [[kHomeListName: "一寸", kHomeListPixelWidth: "295", kHomeListPixelHeight: "413", kHomeListPrintWidth: "25", kHomeListPrintHeight: "35"], [kHomeListName: "小一寸", kHomeListPixelWidth: "260", kHomeListPixelHeight: "378", kHomeListPrintWidth: "22", kHomeListPrintHeight: "32"], [kHomeListName: "大一寸", kHomeListPixelWidth: "390", kHomeListPixelHeight: "567", kHomeListPrintWidth: "33", kHomeListPrintHeight: "48"], [kHomeListName: "二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "579", kHomeListPrintWidth: "35", kHomeListPrintHeight: "49"], [kHomeListName: "小二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "531", kHomeListPrintWidth: "35", kHomeListPrintHeight: "45"], [kHomeListName: "大二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "626", kHomeListPrintWidth: "35", kHomeListPrintHeight: "53"] , [kHomeListName: "大二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "626", kHomeListPrintWidth: "35", kHomeListPrintHeight: "53"], [kHomeListName: "大二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "626", kHomeListPrintWidth: "35", kHomeListPrintHeight: "53"], [kHomeListName: "大二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "626", kHomeListPrintWidth: "35", kHomeListPrintHeight: "53"], [kHomeListName: "大二寸", kHomeListPixelWidth: "413", kHomeListPixelHeight: "626", kHomeListPrintWidth: "35", kHomeListPrintHeight: "53"]]
        
        var dataSourceArr = YXHomeListModel.arrayOfModelsFromDictionaries(arr: valueArr)
        return dataSourceArr as! [YXHomeListModel]
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
        
        return self.dataSourceArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : YXHomeCollecCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(YXHomeCollecCell.classForCoder()), for: indexPath) as! YXHomeCollecCell
        let model: YXHomeListModel = self.dataSourceArr[indexPath.row]
        cell.reloadValueByModel(model: model)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(YXHomeCollecHeaderReusableView.classForCoder()), for: indexPath)
            
            return headerReusableView
        }
        else {
            return UICollectionReusableView.init()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch Int(indexPath.row) {
        case 0:
            let alertView: YXHomeAlertView = YXHomeAlertView.init(frame: self.view.bounds)
            let alertVC: YXAlertViewController = YXAlertViewController.alertControllerWithAlertView(alertView: alertView, preferredStyle: YXAlertViewControllerStyle.YXAlertViewControllerStyleActionSheet)
            self.present(alertVC, animated: true, completion: nil)
        default:
            let model: YXHomeListModel = self.dataSourceArr[indexPath.row]
            let vc: YXSeparationVC = YXSeparationVC.init()
            vc.model = model
            self.pushToSonVC(vc: vc, animated: true)
            break
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 10, left: 15, bottom: 10 + self.yxToolHeight, right: 15)
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
        
        return CGSize.init(width: collectionView.bounds.width, height: 274)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize.zero
    }
    
    //MARK:- UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        scrollView.bounces = offsetY > 0
        if offsetY >= 15 {
            self.navigationView.backgroundColor = UIColor.yxColorWithHexString(hex: "#FFFFFF")
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
