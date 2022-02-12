//
//  ShowViewController.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/04.
//

import UIKit
import RealmSwift

class ShowViewController: UIViewController {
    
    var groupName:String?
    var selectItem:ClassName!
    var attendance:Attendance!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    fileprivate func setUp(){
        navigationItem.title = "Attendance"
    }
    
}

extension ShowViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendance.studentList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNameCell", for: indexPath) as! ListNameTableViewCell
        cell.nameListLabel.text = attendance.studentList[indexPath.row].name
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "명단"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.visibleCells[indexPath.row] as! ListNameTableViewCell
        cell.showAttendanceAlert(viewController: self)
    
    }
 
}
