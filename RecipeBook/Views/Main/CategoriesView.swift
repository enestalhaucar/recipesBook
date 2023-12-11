//
//  CategoriesView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    var body: some View {
        NavigationView {
            
            VStack {
                List{
                    ForEach(Category.allCases) { category in
                        NavigationLink {
                            CategoryView(category: category)
                        } label : {
                            Text(category.rawValue + "s")
                        }
                    }
                    
                }.scrollContentBackground(.hidden)
                .navigationTitle("Categories")
                
            }.background(Color(red: 1, green: 0.98, blue: 0.93))
        }
        
        
    }
}

#Preview {
    CategoriesView()
}
