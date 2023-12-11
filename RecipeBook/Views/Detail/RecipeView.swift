//
//  RecipeView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct RecipeView: View {

    @State var recipe : Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            }
            placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 30){
                HStack{
                    Spacer()
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button(action: {
                        if recipe.favorite {
                            recipe.favorite = false
                        }
                    }, label: {
                        Image(systemName: recipe.favorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .padding(.trailing,8)
                            .foregroundColor(.red)
                    })
                }
                
                VStack(alignment: .center, spacing: 30) {
                    if !recipe.desc.isEmpty {
                        Text(recipe.desc)
                            .padding()
                            .background(Color(red: 0.97, green: 0.87, blue: 0.57))
                            .cornerRadius(20)
                            
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Ingredients")
                                .font(.headline)
                            Text(recipe.ingredients)
                                
                        }.padding()
                            .background(Color(red: 0.97, green: 0.87, blue: 0.57))
                            .cornerRadius(20)
                            
                        

                    }
                    
                    
                    if !recipe.directions.isEmpty {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Directions")
                                .font(.headline)
                            Text(recipe.directions)
                        }.padding()
                            .background(Color(red: 0.97, green: 0.87, blue: 0.57))
                            .cornerRadius(20)

                    }
                }.frame(width: UIScreen.screenWidth * 8 / 10 , alignment: .leading)
            }.padding(.horizontal, 40)
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Color(red: 1, green: 0.98, blue: 0.93))
    }
}

#Preview {
    RecipeView(recipe: Recipe.all[0])
}
