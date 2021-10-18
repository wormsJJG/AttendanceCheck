import Foundation
import RealmSwift

class Attendance: Object {
    dynamic var groupName:String = ""
    dynamic var nameList:[String] = []
    dynamic var date:String = ""
    dynamic var status:String = ""
    
    override static func primaryKey() -> String? {
        let date = "\(Date())"
        return "groupName"
    }
}
