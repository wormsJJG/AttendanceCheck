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
    var isEditing: Bool = false {
        didSet {
            
        }
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                
            } else if isSelected == false {
                
            }
        }
    }
}
