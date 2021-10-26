//
//  AddViewController.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/02.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
///MARK - Realm
//    let realmInstance = try! Realm()
    
    func addAttendanceCheckGroup(_ groupName:String,_ nameList:[String])->Attendance{
        let attendance = Attendance()
        return attendance
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
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

