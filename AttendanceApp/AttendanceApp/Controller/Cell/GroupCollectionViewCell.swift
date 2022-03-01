//
//  GroupCollectionViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/13.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var selectIconView: UIImageView!
    var isEditing: Bool = false {
        didSet {
            selectIconView.isHidden = !isEditing
            selectIconView.image = UIImage(systemName: "checkmark.square")
        }
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectIconView.image = UIImage(systemName: isSelected ? "checkmark.square.fill" : "checkmark.square")
            } else if isSelected == false {
                selectIconView.image = UIImage(systemName: "checkmark.square")
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        selectIconView.isHidden = !isEditing
    }
}
