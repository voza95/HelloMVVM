//
//  UsersTableViewController.swift
//  HelloMVVM
//
//  Created by Mohammad Azam on 11/30/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class UsersTableViewController : UITableViewController {
    
    private var usersListViewModel :UsersListViewModel!
    private var dataAccess :DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataAccess = DataAccess()
        self.usersListViewModel = UsersListViewModel(dataAccess: self.dataAccess)
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersListViewModel.userViewModels.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = (self.tableView.indexPathForSelectedRow)!
        
        let registrationTVC = segue.destination as! RegistrationTableViewController
        
        let userViewModel = self.usersListViewModel.userViewModels[indexPath.row]
        
        registrationTVC.selectedUserViewModel = userViewModel 
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let userViewModel = self.usersListViewModel.userViewModels[indexPath.row]
        cell.textLabel?.text = "\(userViewModel.firstName!), \(userViewModel.lastName!)" // this prints Optional("John") why Optional??
        return cell
    }
    
    
}
