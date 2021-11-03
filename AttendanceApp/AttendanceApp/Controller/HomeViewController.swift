import UIKit
import RealmSwift

class HomeViewController: UIViewController{
    
    private let realm = try! Realm()
    private var attendances:[Attendance] = []
    //MARK: - Realm
    func getAllAttendance(){
    }
    func deleteAttendance(item: Attendance){
    }
    //MARK: - Realm End
    override func viewDidLoad() {
        super.viewDidLoad()
        attendances = realm.objects(Attendance.self).map({$0})

    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if attendances.count == 0{
            return 1
        }
        return attendances.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupNameCell", for: indexPath) as!
                GroupCollectionViewCell
        cell.layer.cornerRadius = 12.0
        if attendances.count == 0{
            cell.groupNameLabel?.text = "출석부를 만들어보세요!"
        }else{
            cell.groupNameLabel?.text = attendances[indexPath.row].groupName
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CalendarVC = storyboard.instantiateViewController(identifier: "CalendarVC")
        navigationController?.pushViewController(CalendarVC, animated: true)
    }
    
}

