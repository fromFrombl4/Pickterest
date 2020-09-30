import UIKit

class WrongPasswordModal: UIView {
    @IBOutlet weak var modalImage: UIImageView!
    @IBOutlet weak var modalLabel: UILabel!
    @IBOutlet weak var modalButton: UIButton!

//
    @IBAction func pressedModalButton(_ sender: UIButton) {

        self.removeFromSuperview()
    }
    
    class func instanceFromNib() -> WrongPasswordModal {
        return UINib(nibName: "WrongPasswordModal", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WrongPasswordModal
    }
    
    
}
