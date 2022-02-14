//
//  ListNameTableViewCell.swift
//  AttendanceApp
//
//  Created by 정재근 on 2021/10/13.
//

import UIKit

class ListNameTableViewCell: UITableViewCell {
    // 숙제 - 클로저 캡처리스트 공부 후 self.statusLabel 코드쪽 빠진 거 찾기
    // 디비에 status값 저장하기
    @IBOutlet weak var nameListLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    let showVC = ShowViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    private func setupCell(){
        statusLabel.isEnabled = true
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func showAttendanceAlert(viewController: UIViewController){
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        let attendanceButton = UIAlertAction(title: "출석", style: .default) { _ in
            self.statusLabel.text = "출석"
            NotificationCenter.default.post(name: Notification.Name("status"), object: self, userInfo: ["status": self.statusLabel.text ?? "nil"])
            self.statusLabel.textColor = .green
        }
        let tardyButton = UIAlertAction(title: "지각", style: .default) { _ in
            self.statusLabel.text = "지각"
            NotificationCenter.default.post(name: Notification.Name("status"), object: self, userInfo: ["status": self.statusLabel.text ?? "nil"])
            self.statusLabel.textColor = .red
        }
        let absentButton = UIAlertAction(title: "결석", style: .default) { _ in
            self.statusLabel.text = "결석"
            NotificationCenter.default.post(name: Notification.Name("status"), object: self, userInfo: ["status": self.statusLabel.text ?? "nil"])
            self.statusLabel.textColor = .yellow
        }
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(attendanceButton)
        alert.addAction(tardyButton)
        alert.addAction(absentButton)
        alert.addAction(cancelButton)
        viewController.present(alert, animated: false, completion: nil)
    }
}
