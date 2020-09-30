//
//  ShowImageViewController.swift
//  Pickterest
//
//  Created by Roman Dod on 8/26/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentTextField: UITextField!
    var imageV: UIImage?
    @IBOutlet weak var mainImageView: UIImageView! {
        didSet{
            guard let image = favorite?.imageName else {
                return
            }
            mainImageView.image = UIImage(named: image)
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!
    
    var favorite: FavoriteCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.keyboardDismissMode = .onDrag
        commentTextField.delegate = self
//        mainImageView.contentMode = .scaleAspectFit
//        mainImageView.image = imageV
//        let center = mainImageView?.center as! CGPoint
//        mainImageView.center = center
        
        self.registerForKeyboardNotifications()

    }
    

        private func registerForKeyboardNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc private func keyboardWillShow(_ notification: NSNotification) {
//            if bottomConstraint.constant > 0 { return }
            
            let userInfo = notification.userInfo!
//            let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            print(userInfo)
            
           // scrollView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardScreenEndFrame.height, right: 0)
            
            if notification.name == UIResponder.keyboardWillHideNotification {
                scrollView.contentInset = .zero
            } else {
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardScreenEndFrame.height - view.safeAreaInsets.bottom, right: 0)
            }
            
//            if notification.name == UIResponder.keyboardWillHideNotification {
//                bottomConstraint.constant = 0
//
//            } else {
//                bottomConstraint.constant = keyboardScreenEndFrame.height
//                scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentSize.height)
//            }
            
//            view.needsUpdateConstraints()
//
//            UIView.animate(withDuration: animationDuration) {
//                self.view.layoutIfNeeded()
//            }
        }
}

extension ShowImageViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        if textField == commentTextField {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
    
    
    
}
