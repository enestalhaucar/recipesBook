//
//  AddRecipeView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 6.12.2023.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM : RecipesViewModel
    @State private var name : String = ""
    @State private var selectedCategory : Category = Category.main
    @State private var description : String = ""
    @State private var ingredients : String = ""
    @State private var directions : String = ""
    @State private var navigateToRecipe = false
    var recipe : Recipe
    
    @State var selectedPhotos : [PhotosPickerItem] = []
    @State var data : Data?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Image")) {
                    PhotosPicker(selection: $selectedPhotos, maxSelectionCount: 1, matching: .images) {
                        
                        if let data = data, let uiimage = UIImage(data: data) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .frame(height: 200)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .center)
                                .frame(maxWidth: .infinity)
                            
                                .foregroundColor(.black)
                                .opacity(0.3)
                        }
                       
                    }.onChange(of: selectedPhotos) { oldValue, newValue in
                        guard let photo = selectedPhotos.first else {
                            return
                        }
                        photo.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data): 
                                if let data = data {
                                    self.data = data
                            }
                            case .failure(let failure):
                                fatalError("\(failure)")
                                
                            }
                        }
                    }
                    
                }
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                    }
                }
                ToolbarItem {
                    Button {
                        saveRecipe()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                    .disabled(selectedPhotos.isEmpty || name.isEmpty || description.isEmpty || ingredients.isEmpty || directions.isEmpty )
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(.stack)
    }
}

#Preview {
    AddRecipeView(recipe: Recipe.all[0])
        .environmentObject(RecipesViewModel())
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePublished = dateFormatter.string(from: now)
        let recipe = Recipe(name: name, image: "", desc: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublished: datePublished, url: "", favorite: false)
        
        recipesVM.addRecipe(recipe: recipe)
    }
}
