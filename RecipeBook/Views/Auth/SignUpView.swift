//
//  SignUpView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModels()
    @Binding var showWelcomeView : Bool
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: UIScreen.screenWidth * 3.5 / 5, height: UIScreen.screenWidth * 3.5 / 5)
                    .background(.white)
                    .cornerRadius(155)
                
                Image("Frame3")
                    .resizable()
                    .frame(width: 203, height: 237)
            }.padding(.top,70)
                .padding(.bottom, 25)
            Spacer()
            
            TextField("Email", text: $viewModel.email)
                .frame(width: UIScreen.screenWidth * 7.1 / 10, height: 20)
                .padding()
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                ).padding(.bottom,10)
            SecureField("Password", text: $viewModel.password)
                .frame(width: UIScreen.screenWidth * 7.1 / 10, height: 20)
                .padding()
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                ).padding(.bottom,10)
            Spacer()
            Button(action: {
                Task {
                        do {
                            try await viewModel.singUp()
                            showWelcomeView = false
                        } catch {
                            print("Error signing in: \(error.localizedDescription)")
                        }
                    }
            }, label: {
                Text("Sign Up")
                    .frame(width: UIScreen.screenWidth * 8 / 10 ,height: 60)
                    .foregroundColor(.white)
                    .background(Color(red: 0.95, green: 0.42, blue: 0.13))
                    .cornerRadius(10)
            })
            
            
            Spacer()
            Spacer()
        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .background(Color(red: 1, green: 0.98, blue: 0.93))
    }
}

#Preview {
    SignUpView(showWelcomeView: .constant(false))
}
