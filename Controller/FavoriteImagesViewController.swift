import UIKit

class FavoriteImagesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var itemFavoriteImagesArray: [FavoriteCell] = {
        var blankCell = FavoriteCell()
        blankCell.name = "Coca-cola"
        blankCell.imageName = "kola"
        return [blankCell]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    //for segue.. clean mvc
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "" {
//            if let vc = segue.destination as? ShowImageViewController {
//                let favorite = sender as? FavoriteCell
//                print(favorite ?? "nil")
//                vc.favorite = favorite
//            }
//        }
//    }
}

extension FavoriteImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemFavoriteImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? FavoriteCollectionViewCell {
            
            itemCell.favorite = itemFavoriteImagesArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = itemFavoriteImagesArray[indexPath.row]
        // написать переход на ShowImage...Controller
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController") as? ShowImageViewController else{
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
