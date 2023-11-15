//
//  LoginViewViewModel.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import FirebaseAuth
import Foundation


class LoginViewViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    
    func login() {
        guard validate() else {
            return
        }
        
        //try login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
   private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please input valid email"
            return false
        }
       return true
     }
    
}
