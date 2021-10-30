//
//  AddViewController.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/02.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    
    @IBAction func AddButton(_ sender: Any) {
        createAttendanceCheckGroup()
    }
    
    ///MARK - Realm
    let realm = try! Realm()
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
    func createAttendanceCheckGroup(){
        let attendance = Attendance()
        if let groupName = groupNameTextField.text {
            attendance.groupName = groupName
        }
        try! realm.write{
            realm.add(attendance)
        }
    }
//    func addAttendanceCheckGroup(_ groupName:String,_ nameList:[String])->Attendance{
//        let attendance = Attendance()
//        return attendance
//    }
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    struct Student {
        var name:String
    }
    
    var list:[Student] = [Student(name: "")]
    
    func create(_ student:Student){
        list.append(student)
    }
    
}

///MARK - TableViewSetup
extension AddViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as UITableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "명단"
    }
}


