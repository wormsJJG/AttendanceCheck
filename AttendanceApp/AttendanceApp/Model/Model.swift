import Foundation
import RealmSwift

class ClassName: Object {
    @objc dynamic var groupName: String = ""
    var attendanceList = List<Attendance>()
}
class Attendance: Object {
    var studentList = List<Student>()
    @objc dynamic var date: String = ""
}
class Student: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var status: String = ""
}



