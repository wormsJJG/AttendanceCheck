import Foundation
import RealmSwift

class Attendance: Object {
    @objc dynamic var groupName: String = "" //primarykey
    var nameList = List<Student>()
}
class Student:Object {
    @objc dynamic var name: String = ""
    var status = List<Status>()
}
class Status:Object {
    @objc dynamic var status: String = ""
    @objc dynamic var date: String = ""
}

