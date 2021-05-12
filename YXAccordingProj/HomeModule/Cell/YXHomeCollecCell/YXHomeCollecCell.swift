//
//  YXHomeCollecCell.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/12.
//

import UIKit

class YXHomeCollecCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var pixelTitleLab: UILabel!
    @IBOutlet weak var pixelSizeLab: UILabel!
    @IBOutlet weak var printTitleLab: UILabel!
    @IBOutlet weak var printSizeLab: UILabel!
    @IBOutlet weak var takingPicBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reloadValueByModel(model: YXHomeListModel) {
        
        self.titleLab.text = model.name as String?
        self.pixelSizeLab.text = NSString.localizedStringWithFormat("%dx%dx", model.pixelWidth, model.pixelHeight) as String?
        self.printSizeLab.text = NSString.localizedStringWithFormat("%dx%dmm", model.printWidth, model.printHeight) as String?
    }

    //MARK:- 拍照按钮事件
    @IBAction func progressTakingPicBtn(_ sender: UIButton) {
        
    }
}
