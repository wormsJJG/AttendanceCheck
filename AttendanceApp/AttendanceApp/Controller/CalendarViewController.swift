import UIKit
import FSCalendar

class CalendarViewController: UIViewController{
    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFSCalendar()
    }
    private func setupFSCalendar(){
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.locale = Locale(identifier: "ko_KR")
    }
}
extension CalendarViewController: FSCalendarDelegate,FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ShowVC = storyboard.instantiateViewController(identifier: "ShowVC")
        print("선택한 날짜는 \(date)")
        navigationController?.pushViewController(ShowVC, animated: true)
    }   
}
