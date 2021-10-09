import UIKit

class HomeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupNameCell", for: indexPath) as
                UICollectionViewCell
        
        cell.layer.cornerRadius = 12.0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CalendarVC = storyboard.instantiateViewController(identifier: "CalendarVC")
        navigationController?.pushViewController(CalendarVC, animated: true)
    }
    
  
}

