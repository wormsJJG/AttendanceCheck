//
//  ListNameTableViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/13.
//

import UIKit

class ListNameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameListLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellSetup()
    }
    private func cellSetup(){
        statusLabel.isEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
