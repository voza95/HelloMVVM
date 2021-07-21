//
//  UsersListViewModel.swift
//  HelloMVVM
//
//  Created by Mohammad Azam on 11/30/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class UsersListViewModel {
    
    var userViewModels :[UserViewModel] = [UserViewModel]()
    private var dataAccess :DataAccess
    
    init(dataAccess :DataAccess) {
        self.dataAccess = dataAccess
        
        populateUsers()
    }
    
    private func populateUsers() {
        
        let users = self.dataAccess.getAllUsers()
        self.userViewModels =  users.flatMap { user in
            return UserViewModel(user: user)
        }
    }
}

class UserViewModel {
    
    var firstName :String!
    var lastName :String!
    
    init(user :User) {
        self.firstName = user.firstName
        self.lastName = user.lastName
    }
    
}








