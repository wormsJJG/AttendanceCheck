import UIKit
import RealmSwift

class HomeViewController: UIViewController{
    
    @IBOutlet weak var groupListTableView: UICollectionView!
    
    private let realm = try! Realm()
    private var className:[ClassName] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        className = realm.objects(ClassName.self).map({$0})
        groupListTableView.reloadData()
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if className.count == 0{
            return 1
        }
        return className.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupNameCell", for: indexPath) as!
                GroupCollectionViewCell
        cell.layer.cornerRadius = 12.0
        if className.count == 0{
            cell.groupNameLabel?.text = "출석부를 만들어보세요!"
        }else{
            cell.groupNameLabel?.text = className[indexPath.row].groupName
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if className.count == 0{
            
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let calendarVC = storyboard.instantiateViewController(identifier: "CalendarVC") as! CalendarViewController
            let classNameData = className[indexPath.item]
            calendarVC.selectItem = classNameData
            navigationController?.pushViewController(calendarVC, animated: true)
            
        }
        
    }
    
}

