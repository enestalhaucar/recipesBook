//
//  SignTextField.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import SwiftUI

struct SignTextField: View {
    @State var username : String
    var body: some View {
        TextField("Username", text: $username )
                .frame(width: UIScreen.screenWidth * 7 / 10, height: 20)
                .padding()
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                )
    }
}

#Preview {
    SignTextField(username: "")
}
