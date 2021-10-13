import Foundation
import RealmSwift

class Attendance: Object {
    dynamic var groupName:String = ""
    dynamic var nameList:[String] = []
    dynamic var date:Int = 0
    dynamic var status:String = ""
    
    override static func primaryKey() -> String? {
        return "groupName"
    }
}
