import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController{
    @IBOutlet weak var calendar: FSCalendar!
    private let dateFormatter = DateFormatter()
    var selectItem: ClassName!
    var studentList:[Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFSCalendar()
    }
    private func setupFSCalendar(){
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}
extension CalendarViewController: FSCalendarDelegate,FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showVC = storyboard.instantiateViewController(identifier: "ShowVC") as! ShowViewController
        let selectDate = dateFormatter.string(from: date)
        let attendanceList = selectItem.attendanceList
        let selectedAttendances = attendanceList.filter{ $0.date == selectDate }
        if selectedAttendances.first != nil{
            showVC.selectItem = selectItem
            showVC.attendance = selectedAttendances.first
        }else {
            let newAttendance = Attendance()
            newAttendance.studentList = selectItem.attendanceList.first!.studentList
            newAttendance.date = selectDate
            showVC.selectItem = selectItem
            showVC.attendance = newAttendance
        }
        navigationController?.pushViewController(showVC, animated: true)
    }   
}
