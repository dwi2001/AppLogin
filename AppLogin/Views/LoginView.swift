//
//  LoginView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // headers
                HeaderView(title: "To Do List", subTitle: "Do Things ", angel: 15, background: .blue)
                
                // form input
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("username", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TlButton(
                        title: "Log in",
                        colorText: .white,
                        background: .blue){
                            viewModel.login()
                            AnalyticsManager.shared.logEvent(name: "Button_Login", params: [
                                "button_name" : "Button_login"
                            ])
                        }
                }.offset(y: -30)
                
                // create account
                VStack {
                    Text("New Accound Here?")
                    NavigationLink( "Create An Account", destination: RegisterView())
                        .navigationBarTitleDisplayMode(.inline)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .analyticsScreen(name: "Login View")
            .onAppear{
                AnalyticsManager.shared.logEvent(name: "AnalyticView_Appear")
            }
            .onDisappear {
                AnalyticsManager.shared.logEvent(name: "AnalyticView_Disapear")
            }
            
        }
    }
}

#Preview {
    LoginView()
}
