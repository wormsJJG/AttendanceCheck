import Foundation
import RealmSwift

class Attendance: Object {
    dynamic var groupName: String = "" //primarykey
    dynamic var nameList: [Student] = []
}
class Student:Object {
    dynamic var name: String = ""
    dynamic var status: [Status] = []
}
class Status:Object {
    dynamic var status: String = ""
    dynamic var date: String = ""
}

