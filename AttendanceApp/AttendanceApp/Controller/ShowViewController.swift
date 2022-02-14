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
    var selectDate: String?
    var selectItem:ClassName!
    var attendance:Attendance!
    var studentStatus: String?
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    fileprivate func setUp(){
        navigationItem.title =  selectDate
        addObserver()
    }
    func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(inputStatus(_:)), name: Notification.Name("status"), object: nil)
    }
    @objc func inputStatus(_ notification: Notification){
        let status = notification.userInfo?["status"] as! String
        studentStatus = status
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
