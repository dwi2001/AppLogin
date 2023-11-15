//
//  TlButton.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import SwiftUI

struct TlButton: View {
    let title : String
    let colorText: Color
    let background : Color
    let action : () -> Void
    
    var body: some View {
        Button {
            // attempt login
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundStyle(colorText)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TlButton(title: "", colorText: .white, background: .blue){
        //action
    }
}
