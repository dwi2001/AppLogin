//
//  ContentView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            
            // todo list view
            TabView {
                TodoListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("account", systemImage: "person.fill")
                    }
            } 
        } else {
            LoginView()
        }
    }
}



#Preview {
    MainView()
}


