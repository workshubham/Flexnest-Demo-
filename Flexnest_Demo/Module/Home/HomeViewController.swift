//
//  HomeViewController.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: HomeTableView!
    @IBOutlet weak var btnRetry: UIButton!
    
    // Variable & constants
    private var pageNUmber: Int = 1
    private var totalPages: Int = 0
    private var userData: [UserViewModel] = [UserViewModel]()
    private let shimmerTableView = HomeShimmerTableView()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting Up UI
        setUpUi()
        // Fetching users details
        getUsersDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if refreshControl.isRefreshing {
            // Check if shimmer is showing
            checkShimmerShowing()
        }
        // Adding notification observers
        addNotificationObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        removeNotificationObservers()
    }
    
    /// Setting Up UI
    private func setUpUi() {
        // Adding pull to refresh
        addTableRefresh()
        // Adding loading tableView
        addLoadingTableView()
        // Fetching next users data
        tableView.getNextUsers = getNextUsersData(_:)
        // Bending boarder of retry button
        btnRetry.layer.cornerRadius = 10
    }
    
    /// Adding Pull to refresh to tableView
    private func addTableRefresh() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)
    }
    
    /// Fetching next users data
    private func getNextUsersData(_ paginatedRequest: Bool = false) {
        
        if paginatedRequest == true && totalPages > pageNUmber && Utility.isInternetAvailable() {
            pageNUmber += 1
            addLoadingTableView()
            getUsersDetails()
        }
    }
    
    // MARK: Shimmer TableView
    /// Adding shimmer tableView to show loading effect
    private func addLoadingTableView() {
        shimmerTableView.frame = CGRect(x: 0, y: 0,
                                        width: tableView.frame.width,
                                        height: (360*3))
        shimmerTableView.separatorStyle = .none
        tableView.tableFooterView = shimmerTableView
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            Utility.startShimmerAnimation(animateView: strongSelf.shimmerTableView)
        }
    }
    
    /// Removing Loading Table View
    private func removeLoadingTableView() {
        Utility.stopShimmerAnimation(animateView: shimmerTableView)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    /// Checking shimmer tabelView showing
    /// and if yes then starting animation
    private func checkShimmerShowing() {
        if tableView.tableFooterView == shimmerTableView {
            DispatchQueue.main.async { [weak self] in
                
                guard let strongSelf = self else { return }
                Utility.startShimmerAnimation(animateView: strongSelf.shimmerTableView)
            }
        }
    }
    
    /// Adding notification observers
    private func addNotificationObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(appEnterForeground),
                                       name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    /// Removing notification observers
    private func removeNotificationObservers() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    /// app enters foreground
    @objc private func appEnterForeground() {
        checkShimmerShowing()
    }
    
    /// Show retry button and reset data
    /// hide table view and shimmer table view
    private func showRetryButton() {
        
        pageNUmber = 1
        DispatchQueue.main.async {
            self.removeLoadingTableView()
            self.tableView.isHidden = true
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    /// Checking is there any local data
    private func checkLocalData() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        guard let localData = HomeModel(data: UserDefaultsManager.getUserData()) else { return }
        userData = []
        for user in localData.usersData {
            userData.append(UserViewModel(data: user))
        }
        removeLoadingTableView()
        tableView.userData = userData
    }
    
    // MARK: IBActions
    // Table refresh action
    @IBAction func refreshTableView(_ sender: Any) {
        if tableView.tableFooterView == shimmerTableView {
            return
        }
        userData = []
        tableView.userData = []
        tableView.isHidden = false
        addLoadingTableView()
        pageNUmber = 1
        getUsersDetails()
    }
    
    // Retry button (resetting data)
    @IBAction func btnRetryClicked(_ sender: Any) {
        refreshTableView(self)
    }
}

// MARK: Request Generator
extension HomeViewController: RequestGeneratorProtocol {
    
    /// Fetching usesr details
    private func getUsersDetails() {
        
        // Checking internet connection
        if !Utility.isInternetAvailable() {
            checkLocalData()
            return
        }
        guard let url = URL(string: completeUrl(endpoint: .getUsers(pageNUmber))) else {return}
        HomeWebService.shared.fetchUsersDetails(url: url) { [weak self] (response, _, _) in
            
            guard let strongSelf = self else { return }
            
            if let response = response {
                // Checking users data in response
                if response.usersData.count == 0 {
                    strongSelf.showRetryButton()
                    return
                }
                strongSelf.totalPages = response.totalPages
                for user in response.usersData {
                    strongSelf.userData.append(UserViewModel(data: user))
                }
                strongSelf.tableView.userData = strongSelf.userData
                strongSelf.removeLoadingTableView()
                if strongSelf.refreshControl.isRefreshing {
                    strongSelf.refreshControl.endRefreshing()
                }
            } else {
                guard let strongSelf = self else { return }
                strongSelf.showRetryButton()
            }
        }
    }
}
