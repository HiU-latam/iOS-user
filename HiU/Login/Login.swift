//
//  Login.swift
//  HiU
//
//  Created by Lady Diana Cortes on 15/10/17.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit
import AWSAuthUI
import AWSFacebookSignIn
import SlideMenuControllerSwift

class Login: UIViewController {
    
    @IBOutlet weak var signInBgImageView: UIImageView!
    @IBOutlet weak var signInBackButton: UIButton!
    @IBOutlet weak var signInInfoButton: UIButton!
    @IBOutlet weak var signInIconImageView: UIImageView!
    @IBOutlet weak var signInEmailTextField: UITextField!
    @IBOutlet weak var signInPasswordTextField: UITextField!
    @IBOutlet weak var signInLoginWithLabel: UILabel!
    @IBOutlet weak var signInTwitterButton: UIButton!
    @IBOutlet weak var signInFBButton: UIButton!
    @IBOutlet weak var signInInstagramButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@", "Login - viewDidLoad")
        
        initView()
//      presentAuthUIViewController()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func presentAuthUIViewController() {
        let config = AWSAuthUIConfiguration()
        config.addSignInButtonView(class: AWSFacebookSignInButton.self)
        
        // you can use properties like logoImage, backgroundColor to customize screen
        // config.canCancel = false // this will disallow end user to dismiss sign in screen
        
        // you should have a navigation controller for your view controller
        // the sign in screen is presented using the navigation controller
        
        AWSAuthUIViewController.presentViewController(
            with: navigationController!,  // you should have your navigation controller here
            configuration: config,
            completionHandler: {(
                _ signInProvider: AWSSignInProvider, _ error: Error?) -> Void in
                if error == nil {
                    DispatchQueue.main.async(execute: {() -> Void in
                        // handle successful callback here,
                        // e.g. pop up to show successful sign in
                    })
                }
                else {
                    // end user faced error while loggin in,
                    // take any required action here
                }
        })
    }
    
    func initView() {
        let screenSize = UIScreen.main.bounds
        let screenWidth =  screenSize.width
        let screenheight =  screenSize.height
        
        signInBgImageView.frame = CGRect(x:0, y:0, width:screenWidth, height:screenheight)
        
        let signInIconImage = UIImage(named:"icon_login")
        let signInIconImageSize = signInIconImage?.size
        let signInIconImageWidth = signInIconImageSize?.width
        let signInIconImageHeight = signInIconImageSize?.height
        signInIconImageView.frame = CGRect(x: (screenWidth / 2) - (signInIconImageWidth! / 2), y: 10 + (signInIconImageHeight! / 2), width: signInIconImageWidth!, height: signInIconImageHeight!)
        
        let signInBackImage = UIImage(named:"sign_in_back_icon")
        let signInBackImageSize = signInBackImage?.size
        let signInBackImageWidth = signInBackImageSize?.width
        let signInBackImageHeight = signInBackImageSize?.height
        signInBackButton.frame = CGRect(x: 10, y: signInIconImageView!.frame.origin.y + (signInIconImageHeight! / 2) - (signInBackImageHeight! / 2), width:signInBackImageWidth!, height:signInBackImageHeight!)
        
        let signInInfoImage = UIImage(named:"sign_in_info")
        let signInInfoImageSize = signInInfoImage?.size
        let signInInfoImageWidth = signInInfoImageSize?.width
        let signInInfoImageHeight = signInInfoImageSize?.height
        signInInfoButton.frame = CGRect(x: (screenWidth - signInInfoImageWidth! - 10), y: signInIconImageView!.frame.origin.y + (signInIconImageHeight! / 2) - (signInInfoImageHeight! / 2), width:signInInfoImageWidth!, height:signInInfoImageHeight!)
        
        signInEmailTextField.frame = CGRect(x: 0, y: (screenheight / 2) - 20, width:(screenWidth - 40), height:40)
        signInEmailTextField.backgroundColor = UIColor.white
        signInEmailTextField.layer.shadowColor = UIColor.black.cgColor
        signInEmailTextField.layer.shadowOpacity = 1
        signInEmailTextField.layer.shadowOffset = CGSize.zero
        signInEmailTextField.rightViewMode = UITextFieldViewMode.always
        let signInEmailRightImage = UIImage(named:"sign_in_check_icon")
        let signInEmailRightImageSize = signInEmailRightImage?.size
        let signInEmailRightImageWidth = signInEmailRightImageSize?.width
        let signInEmailRightImageHeight = signInEmailRightImageSize?.height
        let signInEmailRightImageView = UIImageView(frame: CGRect(x: (signInEmailTextField.frame.size.width - signInEmailRightImageWidth!), y: (signInEmailTextField.frame.size.height / 2) - (signInEmailRightImageHeight! / 2), width: signInEmailRightImageWidth! + 20, height:signInEmailRightImageHeight!))
        signInEmailRightImageView.contentMode = UIViewContentMode.center
        signInEmailRightImageView.image = signInEmailRightImage
        signInEmailTextField.rightView = signInEmailRightImageView
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: signInEmailTextField.frame.size.height))
        signInEmailTextField.leftView = leftPaddingView
        signInEmailTextField.leftViewMode = UITextFieldViewMode.always
        
        signInPasswordTextField.frame = CGRect(x: 40, y: signInEmailTextField.frame.origin.y + signInEmailTextField.frame.size.height + 20, width:(screenWidth - 40), height:40)
        signInPasswordTextField.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        signInPasswordTextField.layer.shadowColor = UIColor.black.cgColor
        signInPasswordTextField.layer.shadowOpacity = 1
        signInPasswordTextField.layer.shadowOffset = CGSize.zero
        signInPasswordTextField.leftViewMode = UITextFieldViewMode.always
        let signInPasswordLeftImage = UIImage(named:"sign_in_eye_active_icon")
        let signInPasswordLeftImageSize = signInPasswordLeftImage?.size
        let signInPasswordLeftImageWidth = signInPasswordLeftImageSize?.width
        let signInPasswordLeftImageHeight = signInPasswordLeftImageSize?.height
        let signInPasswordLeftImageView = UIImageView(frame: CGRect(x: 0, y: (signInPasswordTextField.frame.size.height / 2) - (signInPasswordLeftImageHeight! / 2), width: signInPasswordLeftImageWidth! + 20, height:signInPasswordLeftImageHeight!))
        signInPasswordLeftImageView.contentMode = UIViewContentMode.center
        signInPasswordLeftImageView.image = signInPasswordLeftImage
        signInPasswordTextField.leftView = signInPasswordLeftImageView
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: signInPasswordTextField.frame.size.height))
        signInPasswordTextField.rightView = rightPaddingView
        signInPasswordTextField.rightViewMode = UITextFieldViewMode.always
        
        signInLoginWithLabel.frame = CGRect(x: ((screenWidth / 2) - 80), y: signInPasswordTextField.frame.origin.y + signInPasswordTextField.frame.size.height + 20, width: 160, height: 20)
        signInLoginWithLabel.text = NSLocalizedString("login_with", comment: "")
        signInLoginWithLabel.font = Fonts.Small
        signInLoginWithLabel.textColor = UIColor.white
        signInLoginWithLabel.contentMode = UIViewContentMode.center
        
        let signInTwitterImage = UIImage(named:"sign_in_objeto_inteligente_vectorial")
        let signInTwitterImageSize = signInTwitterImage?.size
        let signInTwitterImageWidth = signInTwitterImageSize?.width
        let signInTwitterImageHeight = signInTwitterImageSize?.height
        signInTwitterButton.frame = CGRect(x: (screenWidth / 2) - (signInTwitterImageWidth! / 2), y: signInLoginWithLabel!.frame.origin.y + signInLoginWithLabel!.frame.size.height + 20, width:signInTwitterImageWidth!, height:signInTwitterImageHeight!)
        signInTwitterButton.setImage(signInTwitterImage, for: UIControlState.normal)
        
        let signInFBImage = UIImage(named:"sign_in_fb")
        let signInFBImageSize = signInFBImage?.size
        let signInFBImageWidth = signInFBImageSize?.width
        let signInFBImageHeight = signInFBImageSize?.height
        signInFBButton.frame = CGRect(x: signInTwitterButton.frame.origin.x - signInFBImageWidth! - 20, y: signInLoginWithLabel!.frame.origin.y + signInLoginWithLabel!.frame.size.height + 20, width:signInFBImageWidth!, height:signInFBImageHeight!)
        signInFBButton.setImage(signInFBImage, for: UIControlState.normal)
        
        let signInInstagramImage = UIImage(named:"sign_in_instagram")
        let signInInstagramImageSize = signInInstagramImage?.size
        let signInInstagramImageWidth = signInInstagramImageSize?.width
        let signInInstagramImageHeight = signInInstagramImageSize?.height
        signInInstagramButton.frame = CGRect(x: signInTwitterButton.frame.origin.x + signInTwitterButton.frame.size.width + 20, y: signInLoginWithLabel!.frame.origin.y + signInLoginWithLabel!.frame.size.height + 20, width:signInInstagramImageWidth!, height:signInInstagramImageHeight!)
        signInInstagramButton.setImage(signInInstagramImage, for: UIControlState.normal)
        
        signInButton.frame = CGRect(x: (screenWidth / 2) - 80, y: signInTwitterButton!.frame.origin.y + signInTwitterButton!.frame.size.height + 20, width:160, height:30)
        signInButton.setTitle(NSLocalizedString("sign_in", comment: ""), for: UIControlState.normal)
        signInButton.titleLabel?.font = Fonts.Small
        signInButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signInButton.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        signInButton.addTarget(self, action: #selector(signInButtonOnClick), for: .touchUpInside)
        
        signUpButton.frame = CGRect(x: (screenWidth / 2) - 80, y: (screenheight - 30), width:160, height:10)
        let attrTextNewhere = NSMutableAttributedString(string: String(format:"%@?", NSLocalizedString("new_here", comment: "")))
        attrTextNewhere.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, attrTextNewhere.length))
        let attrTextSignUp = NSMutableAttributedString(string: NSLocalizedString("sign_up", comment: ""))
        attrTextSignUp.addAttribute(NSForegroundColorAttributeName, value: Helper.UIColorFromRGB(rgbValue: 0xcf00d2), range: NSMakeRange(0, attrTextSignUp.length))
        let attributedText = NSMutableAttributedString()
        attributedText.append(attrTextNewhere)
        attributedText.append(attrTextSignUp)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        signUpButton.setAttributedTitle(attributedText, for: .normal)
        signUpButton.titleLabel?.font = Fonts.Small
        
        
    }
    
    func signInButtonOnClick(sender: UIButton!) {
        NSLog("signInButtonOnClick", "")
        let leftMenuviewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController")
        let mainMenuviewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController")
        let slideMenuController = SlideMenuController(mainViewController: mainMenuviewController, leftMenuViewController: leftMenuviewController)
        NSLog("signInButtonOnClick - %@", slideMenuController)
        self.navigationController?.pushViewController(slideMenuController, animated: true)
    }
}
