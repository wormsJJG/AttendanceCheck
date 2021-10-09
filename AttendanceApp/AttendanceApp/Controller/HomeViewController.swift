import UIKit

class HomeViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup() {
        title = "출석부"
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
  
}

