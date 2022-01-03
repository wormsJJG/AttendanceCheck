import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController{
    @IBOutlet weak var calendar: FSCalendar!
    let status = Status()
    private let dateFormatter = DateFormatter()
    var groupName:String?
    var nameList = List<Student>()
    var selectItem:Attendance!
    
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
        status.date = dateFormatter.string(from: date)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showVC = storyboard.instantiateViewController(identifier: "ShowVC") as! ShowViewController
        showVC.selectItem = selectItem
        showVC.groupName = groupName
        showVC.nameList = nameList
        showVC.selectDate = status.date
        navigationController?.pushViewController(showVC, animated: true)
        
    }   
}
