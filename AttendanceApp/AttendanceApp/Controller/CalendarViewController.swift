import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController{
    @IBOutlet weak var calendar: FSCalendar!
    private let dateFormatter = DateFormatter()
    var selectItem: ClassName!
    lazy var attendance = selectItem.attendanceList
    
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
        let selectDate = dateFormatter.string(from: date)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showVC = storyboard.instantiateViewController(identifier: "ShowVC") as! ShowViewController
        showVC.selectItem = selectItem
        navigationController?.pushViewController(showVC, animated: true)
        
    }   
}
