//
//  AddViewController.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/02.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController,UITextFieldDelegate {
    var studentList:[Student] = []

    @IBOutlet weak var addButton: UIBarButtonItem!
    func create(_ student: Student){
        studentList.append(student)
    }
    
    let cell = addViewTableViewCell()
    @IBOutlet weak var insertStudentNameTableView: UITableView!
    @IBAction func AddButton(_ sender: Any) {
        
        createAttendanceCheckGroup()
    }
    
    
    ///MARK - Realm
    let realm = try! Realm()
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
    func createAttendanceCheckGroup(){
        let className = ClassName()
        let attendance = Attendance()
        if let groupName = groupNameTextField.text {
            className.groupName = groupName
            attendance.studentList.append(objectsIn: studentList)
            className.attendanceList.append(attendance)
        }
        try! realm.write{
            realm.add(className)
            navigationController?.popViewController(animated: true)
        }
    }
    ///MARK - Realm End
    fileprivate func setUp(){
        addObserver()
        groupNameTextField.becomeFirstResponder()
        groupNameTextField.delegate = self
        textFieldDidChangeSelection(groupNameTextField)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if groupNameTextField.text!.count > 0 {
            addButton.isEnabled = true
        }else{
            addButton.isEnabled = false
        }
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(addStudent(_:)), name: Notification.Name("student"), object: nil)

    }
    @objc func addStudent(_ notification: Notification){
        let studentName = notification.userInfo?["student"] as! String// String
        let student = Student()
        student.name = studentName
        create(student)
        insertStudentNameTableView.insertRows(at: [IndexPath(row: self.studentList.count, section: 0)], with: .none)
    }
}
///MARK - TableViewSetup
extension AddViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! addViewTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "명단"
    }
}


