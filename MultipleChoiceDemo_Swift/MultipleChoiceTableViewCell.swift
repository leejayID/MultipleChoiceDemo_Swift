//
//  MultipleChoiceTableViewCell.swift
//  MultipleChoiceDemo_Swift
//
//  Created by LeeJay on 15/12/8.
//  Copyright © 2015年 以撒网. All rights reserved.
//

import UIKit

protocol CellDelegate: NSObjectProtocol {
    
    func cellForSelect(_ isSelect: Bool, atIndexPath indexPath: IndexPath)
}

class MultipleChoiceTableViewCell: UITableViewCell {

    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

    var isSelecet: Bool = false
    var titleLabel: UILabel = UILabel()
    var selectBtn: UIButton = UIButton()
    var indexPath: IndexPath = IndexPath()
    
    //Delegate
    weak var delegate: CellDelegate?
    
    //Block
    var CallBackBlock: ((_ select: Bool, _ indexPath: IndexPath) -> Void)!
    
    var model: MultipleChoiceModel {
        get {
            return self.model
        }
        set(newModel) {
            setBtnSelected(newModel.select!)
            titleLabel.text = newModel.name
            isSelecet = newModel.select!
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        config()
    }
    
    fileprivate func config() {
        titleLabel.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
        self.contentView.addSubview(titleLabel)
        
        selectBtn.frame = CGRect(x: SCREEN_WIDTH-40, y: 7, width: 30, height: 30)
        selectBtn.setImage(UIImage(named: "selected.png"), for: UIControlState())
        selectBtn.addTarget(self, action: #selector(MultipleChoiceTableViewCell.onBtnClick(_:)), for: .touchUpInside)
        self.contentView.addSubview(selectBtn)
    }
    
    func setBtnSelected(_ selected: Bool) {
        if selected {
            selectBtn.setImage(UIImage(named: "selected.png"), for: UIControlState())
        } else {
            selectBtn.setImage(UIImage(named: "unselected.png"), for: UIControlState())
        }
    }
    
    func onBtnClick(_ sender: UIButton) {
        isSelecet = !isSelecet
        if delegate?.responds(to: Selector(("cellForSelect:"))) != nil {
            delegate?.cellForSelect(isSelecet, atIndexPath: indexPath)
//        } else if CallBackBlock != nil {
//            CallBackBlock(select: isSelecet, indexPath: indexPath)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
