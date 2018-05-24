//
//  DashboardViewController.swift
//  HiU
//
//  Created by Pranshi on 1/11/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import TLYShyNavBar


class DashboardViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    static let TAG = "DashboardViewController"
    
    var navigationBarLabel = UILabel.init()
    var leftBarButtonItem = UIBarButtonItem.init()
    var leftBackBarButtonItem = UIBarButtonItem.init()
    var rightBarButtonItem = UIBarButtonItem.init()
    var rightSearchBarButtonItem = UIBarButtonItem.init()
    let searchController = UISearchController(searchResultsController: nil)
    let tabBarItemTitles = [NSLocalizedString("name", comment: ""), NSLocalizedString("category", comment: ""), NSLocalizedString("country", comment: "")]
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    var dashboardModal = [DashboardModal]()
    
    
    
    @IBOutlet weak var viewCelebrity: UIView!
    @IBOutlet weak var viewTabBar: UIView!
    @IBOutlet weak var dashboardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@", "DashboardViewController - viewDidLoad")
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareNavigation()
        
        prepareTabBar()
        
        prepareFilter()
        
        prepareDashboardData()
        
        prepareTableView()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationBarLabel.removeFromSuperview()
        
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
        NSLog("%@", "DashboardViewController - prepare")
    }
    
    
    func prepareNavigation() {
        NSLog("%@", "DashboardViewController - prepareNavigation")
        
        self.slideMenuController()?.navigationController?.navigationBar.tintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        NSLog("%@", "DashboardViewController - prepareNavigation - set tintcolor")
        self.slideMenuController()?.navigationController?.navigationBar.barTintColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        
        self.slideMenuController()?.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        if let navigationBar = self.slideMenuController()?.navigationController?.navigationBar {
            NSLog("%@%@", "DashboardViewController - prepareNavigation - set tintcolor", navigationBar .isKind(of: SlideMenuController.self) ? "Yes" : "No")
            let firstFrame = CGRect(x: (navigationBar.frame.size.width/2) - 80, y:(navigationBar.frame.size.height/2) - 10, width: 160, height:20)
            navigationBarLabel = UILabel(frame: firstFrame)
            navigationBarLabel.text = NSLocalizedString("dashboard", comment: "")
            navigationBarLabel.textColor = UIColor.white
            navigationBarLabel.textAlignment = NSTextAlignment.center
            navigationBarLabel.font = Fonts.Medium
            navigationBar.addSubview(navigationBarLabel)
        }
        
        self.slideMenuController()?.navigationItem.setHidesBackButton(true, animated: true)
        
        var leftBarButtonImge = UIImage(named: "menu")
        leftBarButtonImge = leftBarButtonImge?.withRenderingMode(.alwaysOriginal)
        leftBarButtonItem = UIBarButtonItem.init(
            image: leftBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(openLeftMenu))
        
        self.slideMenuController()?.navigationItem.leftBarButtonItem = leftBarButtonItem
        
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
        
        self.slideMenuController()?.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
    }
    
    func openLeftMenu(sender: UIButton)  {
        NSLog("openLeftMenu", "")
        let isLeftOpen = self.slideMenuController()?.isLeftOpen()
        if (isLeftOpen)! {
            self.slideMenuController()?.closeLeft()
        }else{
            self.slideMenuController()?.openLeft()
        }
    }
    
    func openRightMenu(sender: UIButton)  {
        NSLog("openRightMenu", "")
    }
    
    func openSearchBar(sender: UIButton)  {
        NSLog("openSearchBar", "")
        var leftBackBarButtonImge = UIImage(named: "back_icon")
        leftBackBarButtonImge = leftBackBarButtonImge?.withRenderingMode(.alwaysOriginal)
        leftBackBarButtonItem = UIBarButtonItem.init(
            image: leftBackBarButtonImge,
            style: .plain,
            target: self,
            action: #selector(resetMenu))
        
        self.slideMenuController()?.navigationItem.leftBarButtonItem = leftBackBarButtonItem
        self.slideMenuController()?.navigationItem.rightBarButtonItems = nil
        self.navigationBarLabel.removeFromSuperview()
        
        searchBar.placeholder = NSLocalizedString("search", comment: "")
        self.slideMenuController()?.navigationItem.titleView = searchBar
        
        
    }
    
    func resetMenu(sender: UIButton)  {
        self.slideMenuController()?.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.slideMenuController()?.navigationItem.rightBarButtonItems = [rightBarButtonItem, rightSearchBarButtonItem]
        self.slideMenuController()?.navigationController?.navigationBar.addSubview(navigationBarLabel)
        
        self.slideMenuController()?.navigationItem.titleView = nil
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    // MARK: - Tab Bar
    func prepareTabBar() {
        NSLog("prepareTabBar", "")
        let screenSize = UIScreen.main.bounds
        let screenWidth =  screenSize.width
        let tabBarHeight = 50
        
        self.viewTabBar.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 50)
        self.viewTabBar.backgroundColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        
        let tabBarWidth = Int(self.viewTabBar.frame.width / 3)
        
        var currentIndex = 0
        
        for tabBarItemTitle in tabBarItemTitles {
            let buttonName = UIButton(type: UIButtonType.custom)
            buttonName.frame = CGRect(x: currentIndex * tabBarWidth, y: 0, width: tabBarWidth, height: tabBarHeight)
            buttonName.setTitle(tabBarItemTitle, for: .normal)
            buttonName.titleLabel?.font = Fonts.Medium
            buttonName.titleLabel?.textColor = UIColor.white
            buttonName.setBackgroundImage(UIImage(named: "history_tab_bg"), for: .selected)
            buttonName.setBackgroundImage(nil, for: .normal)
            buttonName.addTarget(self, action: #selector(buttonTabClicked), for: .touchUpInside)
            if currentIndex == 0{
                buttonName.isSelected = true
            }
            self.viewTabBar.addSubview(buttonName)
            currentIndex = currentIndex + 1
        }
    }
    
    func buttonTabClicked(sender: UIButton!){
        NSLog("buttonTabClicked", "")
        NSLog(sender.currentTitle!)
        for tabBarItemTitle in tabBarItemTitles {
            let isEqualTabBarTitle = (tabBarItemTitle == sender.currentTitle)
            NSLog("isEqualTabBarTitle", "")
            if (isEqualTabBarTitle){
                NSLog("true", "")
                sender.isSelected = true
            }else{
                NSLog("false", "")
                sender.isSelected = false
            }
        }
    }
    
    func prepareFilter() {
        NSLog("prepareFilter", "")
        let screenSize = UIScreen.main.bounds
        let screenWidth =  screenSize.width
        let tabBarHeight = 50
        
        self.viewCelebrity.frame = CGRect(x: 0, y: Int(self.viewTabBar.frame.origin.y + self.viewTabBar.frame.height), width: Int(screenWidth), height: tabBarHeight)
        
        let labelCelebrity = UILabel.init()
        labelCelebrity.frame = CGRect(x: (self.viewCelebrity.frame.width / 2) - 100, y: (self.viewCelebrity.frame.height / 2) - 10, width: 200, height: 20)
        labelCelebrity.text = NSLocalizedString("select_celebrity", comment: "")
        labelCelebrity.font = Fonts.Small
        labelCelebrity.textColor = Helper.UIColorFromRGB(rgbValue: 0xcf00d2)
        self.viewCelebrity.addSubview(labelCelebrity)
        
    }
    
    // MARK: - Tableview
    func prepareTableView()  {
        NSLog("prepareTableView", "")
        let screenSize = UIScreen.main.bounds
        let screenWidth =  screenSize.width
        let screenheight =  screenSize.height
        
        self.dashboardTableView.frame = CGRect(x: 0, y: (self.viewCelebrity.frame.origin.y + self.viewCelebrity.frame.height), width: screenWidth, height: screenheight - (self.viewTabBar.frame.height - self.viewCelebrity.frame.height))
        
        
    }
    
    // MARK: - Prepare dummy data
    func prepareDashboardData()  {
        NSLog("prepareTableView", "")
        
        
        let dashboardAnderson = DashboardModal(celebrityImage: "andres_cepeda", celebrityName: "Andres Cepeda", celebrityCategory: "Musico", celebrityRating: "6.2", celebrityRatingImage: "list_glow_bar")
        dashboardModal.append(dashboardAnderson)
        
        let dashboardScarlett = DashboardModal(celebrityImage: "scarlett_johansson", celebrityName: "Scarlett Johansson", celebrityCategory: "Actriz", celebrityRating: "7.5", celebrityRatingImage: "list_glow_bar_copia")
        dashboardModal.append(dashboardScarlett)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardModal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell else {
            fatalError("The deque cell is not an instance of DashboardTableviewCell")
        }
        
        let dashboardData = dashboardModal[indexPath.row]
        
        cell.imageViewCelebrity.image = UIImage(named: dashboardData.celebrityImage)
        cell.imageViewCelebrity.layer.shadowColor = UIColor.black.cgColor
        cell.imageViewCelebrity.layer.shadowOpacity = 1
        cell.imageViewCelebrity.layer.shadowOffset = CGSize.zero
        
        cell.labelName.text = dashboardData.celebrityName
        cell.labelCategory.text = dashboardData.celebrityCategory
        cell.labelRating.text = dashboardData.celebrityRating
        cell.imageViewRatingBG.image = UIImage(named: "list_inner_bevel")
        cell.imageViewRating.image = UIImage(named: dashboardData.celebrityRatingImage)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("%@ - didSelectRowAt", DashboardViewController.TAG)
        
        let messageViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MessageViewController")
        Shared.shared.dashboardModalData = dashboardModal[indexPath.row]
        self.navigationController?.pushViewController(messageViewController, animated: true)
        
    }

}
