import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var imageV: UIImage?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTaped(_:)))
        firstImageView.isUserInteractionEnabled = true
        firstImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTaped(_ handler: UITapGestureRecognizer){
        guard let tappedImage = handler.view as? UIImageView else {
            return
        }
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController") as? ShowImageViewController
        else {
            return
        }
        controller.imageV = imageV
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func pressedAddButton(_ sender: UIButton) {
        self.imagePicker.sourceType = .photoLibrary
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pressedBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension GalleryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            self.firstImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        } else if let pickedImage = info[.originalImage] as? UIImage {
            self.secondImageView.image = imageV
            picker.dismiss(animated: true, completion: nil)
        }
        else if let pickedImage = info[.originalImage] as? UIImage {
            self.thirdImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
