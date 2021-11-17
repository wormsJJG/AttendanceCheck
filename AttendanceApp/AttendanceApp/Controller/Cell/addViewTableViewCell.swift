//
//  addViewTableViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/23.
//

import UIKit

class addViewTableViewCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var listNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        
    }
    fileprivate func setUp(){
        listNameTextField.returnKeyType = .done
        listNameTextField.delegate = self
    }
    
    var studentList:[Student] = []

    func addStudentList(_ name:String){
        let student = Student()
        student.name = name
        studentList.append(student)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addStudentList(listNameTextField.text ?? "nil")
        print(studentList)
        print(studentList.count)
        return true
    }
}
