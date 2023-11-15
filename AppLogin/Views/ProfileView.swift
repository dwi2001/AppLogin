//
//  ProfileView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import Foundation
import SwiftUI


struct ProfileView : View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body : some View {
        NavigationView {
            VStack {
                //avatar
                if let user = viewModel.user {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                        .padding(.top, 50)
            
                    // information
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Nama :")
                            Text(user.name)
                        }.padding(.all, 5)
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }.padding(.all, 5)
                        HStack {
                            Text("join date : ")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding(.all, 5)
                    }.padding(.top, 10)
                    
                    //button log out
                    Button("Sign out"){
                        viewModel.logOut()
                    }.padding(.top, 20)
                    
                    Spacer()
                    
                } else {
                    Text("loading user Loading")
                }
            }
            .navigationTitle("profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
