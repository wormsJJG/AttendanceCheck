import Foundation
import RealmSwift

class Attendance: Object {
    @objc dynamic var groupName: String = "" //primarykey
    @objc dynamic var nameList: [Student] = []
}
class Student:Object {
    @objc dynamic var name: String = ""
    @objc dynamic var status: [Status] = []
    
}
class Status:Object {
    @objc dynamic var status: String = ""
    @objc dynamic var date: String = ""
    let statuss = List<Status>()
}

