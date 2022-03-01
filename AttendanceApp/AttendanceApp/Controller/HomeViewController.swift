import UIKit
import RealmSwift

class HomeViewController: UIViewController{
    
    @IBOutlet weak var groupListTableView: UICollectionView!
    
    private let realm = try! Realm()
    private var className:[ClassName] = []
    
    let fileURL = Realm.Configuration.defaultConfiguration.fileURL
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        }
    override func viewWillAppear(_ animated: Bool) {
        className = realm.objects(ClassName.self).map({$0})
        groupListTableView.reloadData()
    }
    fileprivate func setView(){
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"),style: .plain, target: self,  action: #selector(plusButton))
        let deleteButton = UIBarButtonItem(title: "삭제",style: .plain, target: self,  action: #selector(deleteAction))
        deleteButton.isEnabled = false
        deleteButton.tintColor = .red
        navigationItem.rightBarButtonItems = [addButton, deleteButton]
        navigationItem.leftBarButtonItem = editButtonItem
        editButtonItem.title = "선택"
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing == true {
            editButtonItem.title = "취소"
        }else{
            editButtonItem.title = "선택"
        }
        groupListTableView.allowsMultipleSelection = editing
        navigationItem.rightBarButtonItems![0].isEnabled = !editing
        navigationItem.rightBarButtonItems![1].isEnabled = editing
        groupListTableView.indexPathsForSelectedItems?.forEach({ (indexPath) in groupListTableView.deselectItem(at: indexPath, animated: false)})
        groupListTableView.indexPathsForVisibleItems.forEach{ (indexPath) in
            let cell = groupListTableView.cellForItem(at: indexPath) as! GroupCollectionViewCell
            cell.isEditing = editing
        }
    }
    @objc fileprivate func plusButton(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "addView") as! AddViewController
        navigationController?.pushViewController(addVC, animated: true)
    }
    @objc fileprivate func deleteAction(){
        try! realm.write {
            if let selectedItems = groupListTableView.indexPathsForSelectedItems {
                let items = selectedItems.map{$0.item}.sorted().reversed()
                for item in items{
                    realm.delete(className[item])
                }
                groupListTableView.deleteItems(at: selectedItems)
                className = realm.objects(ClassName.self).map({$0})
                groupListTableView.reloadData()
            }
        }
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
        cell.isEditing = isEditing
        if className.count == 0{
            cell.groupNameLabel?.text = "출석부를 만들어보세요!"
        }else{
            cell.groupNameLabel?.text = className[indexPath.row].groupName
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing {
            if className.count == 0{
                
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let calendarVC = storyboard.instantiateViewController(identifier: "CalendarVC") as! CalendarViewController
                let classNameData = className[indexPath.item]
                calendarVC.selectItem = classNameData
                navigationController?.pushViewController(calendarVC, animated: true)
            }
        }else{
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GroupCollectionViewCell else{
            return true
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
        }else{
            return true
        }
    }
}

