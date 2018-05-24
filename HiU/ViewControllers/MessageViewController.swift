//
//  MessageViewController.swift
//  HiU
//
//  Created by Pranshi on 3/7/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import TLYShyNavBar
import MGCollapsingHeader

class MessageViewController: UIViewController, MGCollapsingHeaderDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    var navigationBarLabel = UILabel.init()
    var leftBackBarButtonItem = UIBarButtonItem.init()
    var rightBarButtonItem = UIBarButtonItem.init()
    var rightSearchBarButtonItem = UIBarButtonItem.init()
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    var searchPressed = false
    
    
    
    
    @IBOutlet weak var mgCollapsingHeaderView: MGCollapsingHeaderView!
    @IBOutlet weak var mgCollapsingHeaderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableViewMessage: UITableView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var imageViewCelebrity: UIImageView!
    @IBOutlet weak var imageViewRankBG: UIImageView!
    @IBOutlet weak var imageViewRank: UIImageView!
    @IBOutlet weak var labelRank: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@", "MessageViewController - viewDidLoad")
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("%@", "MessageViewController - viewWillAppear")
        
        prepareNavigation()
        
        
        mgCollapsingHeaderView.delegate = self
        mgCollapsingHeaderView.setCollapsingConstraint(mgCollapsingHeaderViewHeight)
        mgCollapsingHeaderView.addFadingSubview(viewHeader, fadeBy: 0.3)
        
        
        prepareHeader()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationBarLabel.removeFromSuperview()
        NotificationCenter.default.removeObserver(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        NSLog("%@", "MessageViewController - prepare")
    }
    
    func prepareNavigation()  {
        self.navigationController?.navigationBar.tintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        NSLog("%@", "MessageViewController - prepareNavigation - set tintcolor")
        self.navigationController?.navigationBar.barTintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        if let navigationBar = self.navigationController?.navigationBar {
            NSLog("%@", "MessageViewController - prepareNavigation - navigationBar")
            let firstFrame = CGRect(x: (navigationBar.frame.size.width/2) - 80, y:(navigationBar.frame.size.height/2) - 10, width: 160, height:20)
            navigationBarLabel = UILabel(frame: firstFrame)
            navigationBarLabel.text = NSLocalizedString("message", comment: "")
            navigationBarLabel.textColor = UIColor.white
            navigationBarLabel.textAlignment = NSTextAlignment.center
            navigationBarLabel.font = Fonts.Medium
            navigationBar.addSubview(navigationBarLabel)
        }
        
        var leftBackBarButtonImge = UIImage(named: "back_icon")
        leftBackBarButtonImge = leftBackBarButtonImge?.withRenderingMode(.alwaysOriginal)
        leftBackBarButtonItem = UIBarButtonItem.init(
            image: leftBackBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(backPressed))
        
        self.navigationItem.leftBarButtonItem = leftBackBarButtonItem
        
        var rightBarButtonImge = UIImage(named: "charity_vertical_dots")
        rightBarButtonImge = rightBarButtonImge?.withRenderingMode(.alwaysOriginal)
        rightBarButtonItem = UIBarButtonItem.init(
            image: rightBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(openRightMenu))
        
        var rightSearchBarButtonImge = UIImage(named: "charity_search_icon")
        rightSearchBarButtonImge = rightSearchBarButtonImge?.withRenderingMode(.alwaysOriginal)
        rightSearchBarButtonItem = UIBarButtonItem.init(
            image: rightSearchBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(openSearchBar))
        
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func backPressed(sender: UIButton)  {
        NSLog("backPressed", "")
        if searchPressed {
            searchPressed = false
            self.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
            self.navigationController?.navigationBar.addSubview(navigationBarLabel)
            
            self.navigationItem.titleView = nil
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func openRightMenu(sender: UIButton)  {
        NSLog("openRightMenu", "")
    }
    
    func openSearchBar(sender: UIButton)  {
        NSLog("openSearchBar", "")
        searchPressed = true
        self.navigationItem.rightBarButtonItems = nil
        self.navigationBarLabel.removeFromSuperview()
        
        searchBar.placeholder = NSLocalizedString("search", comment: "")
        self.navigationItem.titleView = searchBar
        
        
    }
    
    
    
    func scrollViewDidScroll(_ scrollView:UIScrollView){
        self.mgCollapsingHeaderView.collapse(withScroll: scrollView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:MessageInitialTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MessageInitialTableViewCell", for: indexPath) as? MessageInitialTableViewCell)!
            cell.labelCompleteForm.text = NSLocalizedString("complete_form", comment: "")
            
            return cell
        } else if indexPath.row == 1{
            let cell:MessageLuckyNameTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MessageLuckyNameTableViewCell", for: indexPath) as? MessageLuckyNameTableViewCell)!
            
            cell.labelLuckyOne.text = NSLocalizedString("lucky_one", comment: "")
            cell.labelLuckyOne.font = UIFont(name: "Nanami", size: 15)
            cell.labelLuckyOne.layer.shadowColor = UIColor.black.cgColor
            cell.labelLuckyOne.layer.shadowRadius = 3.0
            cell.labelLuckyOne.layer.shadowOpacity = 1.0
            cell.labelLuckyOne.layer.shadowOffset = CGSize(width: 4, height: 4)
            
            let bottomBorder = CALayer()
            bottomBorder.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2).cgColor
            bottomBorder.frame = CGRect(x: 0, y: cell.viewLuckOne.frame.size.height - 1, width: cell.viewLuckOne.frame.width, height: 1)
            cell.viewLuckOne.layer.addSublayer(bottomBorder)
            cell.viewLuckOne.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            
            
            
            
            cell.labelName.text = NSLocalizedString("name", comment: "")
            cell.labelName.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            cell.labelName.font = UIFont(name: "Nanami", size: 10)
            return cell
        }else if indexPath.row == 2{
            let cell:MessageTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as? MessageTableViewCell)!
            
            cell.labelMessage.text = NSLocalizedString("message", comment: "")
            cell.labelMessage.font = UIFont(name: "Nanami", size: 15)
            cell.labelMessage.layer.shadowColor = UIColor.black.cgColor
            cell.labelMessage.layer.shadowRadius = 3.0
            cell.labelMessage.layer.shadowOpacity = 1.0
            cell.labelMessage.layer.shadowOffset = CGSize(width: 4, height: 4)
            
            let bottomBorder = CALayer()
            bottomBorder.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2).cgColor
            bottomBorder.frame = CGRect(x: 0, y: cell.viewMessage.frame.size.height - 1, width: cell.viewMessage.frame.width, height: 1)
            cell.viewMessage.layer.addSublayer(bottomBorder)
            cell.viewMessage.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            
            
            
            
            cell.labelWords.text = NSLocalizedString("your_words", comment: "")
            cell.labelWords.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            cell.labelWords.font = UIFont(name: "Nanami", size: 10)
            
            cell.labelCharacter.text = NSLocalizedString("less_characters", comment: "")
            cell.labelCharacter.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            cell.labelCharacter.font = UIFont(name: "Nanami", size: 9)
            
            
            return cell
        }else if indexPath.row == 3{
            let cell:MessageValueTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MessageValueTableViewCell", for: indexPath) as? MessageValueTableViewCell)!
            
            let bottomBorder = CALayer()
            bottomBorder.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2).cgColor
            bottomBorder.frame = CGRect(x: 0, y: cell.viewValue.frame.size.height - 1, width: cell.viewValue.frame.width, height: 1)
            cell.viewValue.layer.addSublayer(bottomBorder)
            cell.viewValue.backgroundColor = UIColor(patternImage: UIImage(named: "message_bg")!)
            
            
            cell.labelValue.text = NSLocalizedString("value", comment: "")
            cell.labelValue.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            cell.labelValue.font = UIFont(name: "Nanami", size: 10)
            
            cell.niceButtonValue.setTitle("50 USD", for: .normal)
            cell.niceButtonValue.setTitleColor(Helper.UIColorFromRGB(rgbValue: 0x000000), for: .normal)
            cell.niceButtonValue.titleLabel?.font = UIFont(name: "Nanami", size: 9)
            
            
            return cell
        }else if indexPath.row == 4{
            let cell:MessageNextTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MessageNextTableViewCell", for: indexPath) as? MessageNextTableViewCell)!
            
            
            cell.buttonNext.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
            cell.buttonNext.setTitleColor(Helper.UIColorFromRGB(rgbValue: 0xFFFFFF), for: .normal)
            cell.buttonNext.titleLabel?.font = UIFont(name: "Nanami", size: 11)
            cell.buttonNext.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
            cell.buttonNext.addTarget(self, action: #selector(openToChooseCharity), for: .touchUpInside)
            
            
            return cell
        }else {
            
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 30.0
        }else if indexPath.row == 1{
            return 90.0
        }else if indexPath.row == 2{
            return 127.0
        }else if indexPath.row == 3{
            return 70.0
        }else if indexPath.row == 4{
            return 60.0
        }else{
            return 0.0
        }
    }
    
    func headerDidCollapse(toOffset offset: Double) {
        
    }
    
    func headerDidFinishCollapsing() {
        
    }
    
    func headerDidExpand(toOffset offset: Double) {
        
    }
    
    func headerDidFinishExpanding() {
        
    }
    
    func prepareHeader() {
        NSLog("prepareHeader")
        let selectedDashboardModal = Shared.shared.dashboardModalData
        
        imageViewCelebrity.image = UIImage(named: (selectedDashboardModal?.celebrityImage)!)
        imageViewCelebrity.layer.shadowColor = UIColor.black.cgColor
        imageViewCelebrity.layer.shadowOpacity = 1
        imageViewCelebrity.layer.shadowOffset = CGSize.zero
        
        labelName.text = selectedDashboardModal?.celebrityName
        labelCategory.text = selectedDashboardModal?.celebrityCategory
        labelRank.text = selectedDashboardModal?.celebrityRating
        imageViewRankBG.image = UIImage(named: "list_inner_bevel")
        imageViewRank.image = UIImage(named: (selectedDashboardModal?.celebrityRatingImage)!)
    }
    
    func openToChooseCharity(_ sender:UIButton) {
        NSLog("openToChooseCharity")
        let charityViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharityViewController")
        self.navigationController?.pushViewController(charityViewController, animated: true)
    }

}
