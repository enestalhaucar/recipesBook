//
//  WelcomeView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 7.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.screenWidth * 3.5 / 5, height: UIScreen.screenWidth * 3.5 / 5)
                        .background(.white)
                        .cornerRadius(155)
                    
                    Image("Frame")
                        .resizable()
                        .frame(width: 203, height: 237)
                }.padding(.top,25)
                
                Text("Welcome to RecipeBook !")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top)

                
                Text("Discover, Share, and Create Delicious Recipes with Our Culinary Hub.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink{
                    SignInView()
                } label: {
                    Text("Sign In")
                        .font(
                            Font.custom("Roboto", size: 15)
                                .weight(.bold)
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(Color(red: 0.62, green: 0.5, blue: 0.17))
                        .background(Color(red: 0.97, green: 0.87, blue: 0.57))
                        .cornerRadius(10)
                        .padding(.horizontal,25)
                }.padding(.bottom,10)
                
                NavigationLink(destination: SignInView()) {
                    Text("Sign Up")
                        .font(
                            Font.custom("Roboto", size: 15)
                                .weight(.bold)
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(Color(red: 0.72, green: 0.61, blue: 0.3))
                        .background(Color(red: 1, green: 0.97, blue: 0.88))
                        .cornerRadius(10)
                        .padding(.horizontal,25)
                }.padding(.bottom,30)
                
                

                    
                
                
                
            }.background(
                Image("screen-02 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400)

        )
        }
    }
}



#Preview {
    NavigationStack{
        WelcomeView()
    }
}
