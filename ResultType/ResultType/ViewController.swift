


import UIKit

class ViewController: UIViewController {
    var followers: [Follower] = []
    var hasMoreFollowers = false
    var isLoadingMoreFollowers = false
    
    func getFollowers(username: String, page: Int) {
        showLoadingView()
        isLoadingMoreFollowers = true
        
        // Prev
        //        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] (followers, errorMessage) in
        
        NetworkManager.shared.getFollowers2(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
                case .success(let followers):
                    self.updateUI(with: followers)
                    
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
            
            /* Prev
             guard let followers = followers else {
             self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: errorMessage!.rawValue, buttonTitle: "Ok")
             return
             }
             self.updateUI(with: followers)
             */
            
            self.isLoadingMoreFollowers = false
        }
    }
    
    
    
    func updateUI(with followers: [Follower]) {
        
        if followers.count < 100 { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)
        
        if self.followers.isEmpty {
            let message = "This user doesn't have any followers. Go follow them."
            
            DispatchQueue.main.async {
                self.showEmptyStateView(with: message, in: self.view)
            }
            return
        }
        self.updateData(on: self.followers)
    }
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
    }
    func showLoadingView() {
        
    }
    func dismissLoadingView() {
        
    }
    func updateData(on: [Follower]) {
        
    }
    func showEmptyStateView(with: String, in: UIView) {
        
    }
}
