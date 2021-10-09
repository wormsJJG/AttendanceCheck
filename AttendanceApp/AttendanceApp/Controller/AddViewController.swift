//
//  AddViewController.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/02.
//

import UIKit

class AddViewController: UIViewController {

    var sections:Array<String> = ["제목","명단"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        title = "명단 추가"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
///MARK - TableViewSetup
extension AddViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as UITableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    
    
    
}
