//
//  HeaderView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 08/11/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subTitle : String
    let angel : Double
    let background : Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angel))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundStyle(.white)
                Text(subTitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "", subTitle: "", angel: 15, background: .blue)
}
