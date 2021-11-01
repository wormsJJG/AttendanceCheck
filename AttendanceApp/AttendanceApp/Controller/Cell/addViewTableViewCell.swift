//
//  addViewTableViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/23.
//

import UIKit

class addViewTableViewCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var listNameTextField: UITextField!
    
 
    var list:[String] = []

    func create(_ name:String?){
        list.append(name ?? "")
        print(list,"asdasdasdsad")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        listNameTextField.resignFirstResponder()
        create(listNameTextField.text)
        print("클릭")
        return true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        listNameTextField.returnKeyType = .done
        textFieldShouldReturn(listNameTextField)
    }


}
