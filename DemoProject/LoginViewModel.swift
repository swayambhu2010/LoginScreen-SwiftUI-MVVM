//
//  LoginViewModel.swift
//  DemoProject
//
//  Created by Swayambhu BANERJEE on 13/02/26.
//

import Foundation
import Combine
 

class LoginViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var loginSucess = false
    @Published var showError = false
    @Published var errorMsg = ""
    
    func validate() async {
        isLoading = true
        defer { isLoading = false }
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        if (userName == "Swayambhu") && (password == "123") {
            loginSucess = true
        } else {
            showError = true
            errorMsg = "Invalid username and password"
        }
    }
}
