//
//  NewViewFile.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 20))
                .bold()
                .padding(.top , 50)
            
            Form {
                //title
                TextField("title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                
                //due date
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TlButton(title: "Save me", colorText: .white, background: .green) {
                    if viewModel.canSave {
                        viewModel.saveMe()
                        AnalyticsManager.shared.logEvent(name: "add_todo", params: [
                            "title_todo" : "\(viewModel.title)",
                            "tanggal_create" : "\(viewModel.dueDate)"
                            
                        ])
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("pease fill in all fields and selected due date that is today or newer"))
            }
        }
    }
}

#Preview {
    NewItemView( newItemPresented: Binding(get: {
        return true
    }, set: {
        _ in
    }))
}
