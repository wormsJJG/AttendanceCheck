//
//  addViewTableViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/23.
//

import UIKit

class addViewTableViewCell: UITableViewCell{
    @IBOutlet weak var listNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    fileprivate func setUp(){
        listNameTextField.returnKeyType = .done
        listNameTextField.delegate = self
    }
}
extension addViewTableViewCell:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        NotificationCenter.default.post(name: Notification.Name("student"), object: self, userInfo: ["student": listNameTextField.text ?? "nil"])
        
    }
}
