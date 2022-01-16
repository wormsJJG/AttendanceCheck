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
        return selectItem.attendanceList.studentList
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNameCell", for: indexPath) as! ListNameTableViewCell
        cell.nameListLabel.text = nameList[indexPath.row].name
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "명단"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        attendanceCheck()
    }
    func attendanceCheck(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        let attendanceButton = UIAlertAction(title: "출석", style: .default) {(action) in }
        let tardyButton = UIAlertAction(title: "지각", style: .default) {(action) in }
        let absentButton = UIAlertAction(title: "결석", style: .default) {(action) in }
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel) {(action) in }
        
        alert.addAction(attendanceButton)
        alert.addAction(tardyButton)
        alert.addAction(absentButton)
        alert.addAction(cancelButton)
        present(alert, animated: false, completion: nil)
    }
}
