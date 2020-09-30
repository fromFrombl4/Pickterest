//
//  ViewController.swift
//  Pickterest
//
//  Created by Roman Dod on 8/25/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

//struct Params {
//    var name: String
//    var pass: String
//}

class ViewController: UIViewController {
    @IBOutlet weak var applicationLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var transparentView: UIView!
    
    let cornerR: CGFloat = 10
    let userName = "user"
    let password = "user"
    let modalHeight = 200
    let modalWidth = 400
    
//    private var params = Params(name: "", pass: "")
    
    let redColorCode = "ea907a"
    let orangeColorCode = "fbc687"
    let milkColorCode = "f4f7c5"
    let greyColorCode = "aacdbe"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
//        for family: String in UIFont.familyNames {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family) {
//                print("== \(names)")
//            }
//        }
        
        self.setGradientBackground()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let font = UIFont(name: "EuphemiaUCAS-Italic", size: 25)
        applicationLabel.font = font
        applicationLabel.textAlignment = .center
        
        applicationLabel.textColor = .white
        applicationLabel.text = "PINTEREST"
        
        loginTextField.backgroundColor = .white
        loginTextField.layer.cornerRadius = cornerR
        
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = cornerR
        passwordTextField.isSecureTextEntry = true
        
        
    }
    
    @IBAction func pressedLoginTextField(_ sender: UITextField) {
    }
    @IBAction func pressedPasswordField(_ sender: UITextField) {
    }
    @IBAction func pressedLoginButton(_ sender: UIButton) {
        
        
        if loginTextField.text == userName && passwordTextField.text == password {
            
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "GalleryViewController") as? GalleryViewController else {
                return
            }
            self.navigationController?.pushViewController(controller, animated: true)
//            self.present(controller, animated: true, completion: nil)
        } else {
             let xibView = WrongPasswordModal.instanceFromNib()
            xibView.frame = CGRect(x: Int(transparentView.frame.size.width / 2 - xibView.frame.size.width / 2), y: Int(transparentView.frame.size.height / 2 - xibView.frame.size.height / 2), width: modalWidth, height: modalHeight)
            transparentView.addSubview(xibView)
            
            transparentView.alpha = 0.4
            
            
        }
        transparentView.alpha = 1
//        checkShouldEnableLoginButton()
    }
    
//    private func checkShouldEnableLoginButton(){
//
//        if !params.name.isEmpty && !params.pass.isEmpty {
//
//            loginButton.isEnabled = true
//        } else {
//            loginButton.isEnabled = false
//        }
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

extension ViewController: UITextFieldDelegate {
    func setGradientBackground() {
          
          let gradient = CAGradientLayer()
    
          gradient.colors = [hexStringToUIColor(hex: redColorCode).cgColor, hexStringToUIColor(hex: orangeColorCode).cgColor, hexStringToUIColor(hex: milkColorCode).cgColor, hexStringToUIColor(hex: greyColorCode).cgColor]
          gradient.opacity = 0.3
          gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
          gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
          
          gradient.frame = self.view.bounds
          self.view.layer.addSublayer(gradient)
          
      }
      
      func hexStringToUIColor (hex:String) -> UIColor {
          var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

          if (cString.hasPrefix("#")) {
              cString.remove(at: cString.startIndex)
          }

          if ((cString.count) != 6) {
              return UIColor.gray
          }

          var rgbValue:UInt64 = 0
          Scanner(string: cString).scanHexInt64(&rgbValue)

          return UIColor(
              red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: CGFloat(1.0)
          )
      }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        guard let text = textField.text else {
//            return
//        }
//
//        if textField == loginTextField {
//            params.name = text
//        } else if textField == passwordTextField {
//            params.pass = text
//        }
//    }
}
