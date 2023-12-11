//
//  SettingsView.swift
//  RecipeBook
//
//  Created by Enes Talha Uçar  on 5.12.2023.
//

import SwiftUI
import PhotosUI
import FirebaseAuth

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showWelcomeView : Bool
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var currentEmail = Auth.auth().currentUser?.email
    
    @State private var selectedPhotos : [PhotosPickerItem] = []
    @State private var data : Data?
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()    
                Text("Edit Profile")
                
                PhotosPicker(selection: $selectedPhotos, maxSelectionCount: 1, matching: .images) {
                    
                    if let data = data, let uiimage = UIImage(data: data) {
                        Image(uiImage: uiimage)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(40)
                            .aspectRatio(contentMode: .fill)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .center)
                            .foregroundColor(.black)
                            .background(.white)
                            .opacity(0.3)
                            .background(.white)
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                            )
                        
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
                Spacer()
                VStack() {
                    VStack(alignment: .leading) {
                        Text("Full Name")
                            .opacity(0.3)
                        TextField("", text: $fullName)
                    }
                    .frame(width: UIScreen.screenWidth * 7.1 / 10)
                    .padding()
                    .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                        ).padding(.bottom,10)
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .opacity(0.3)
                        
                    TextField(currentEmail! , text: $email)
                    }
                    .frame(width: UIScreen.screenWidth * 7.1 / 10)
                    .padding()
                    .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                        ).padding(.bottom,10)
                    
                    VStack(alignment: .leading) {
                        Text("Change Password")
                            .opacity(0.3)
                        TextField("", text: $password)
                    }
                    .frame(width: UIScreen.screenWidth * 7.1 / 10)
                    .padding()
                    .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.95, green: 0.42, blue: 0.13), lineWidth: 2)
                        ).padding(.bottom,10)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Save")
                            .frame(width: UIScreen.screenWidth * 8 / 10 ,height: 60)
                            .foregroundColor(.white)
                            .background(Color(red: 0.95, green: 0.42, blue: 0.13))
                            .cornerRadius(10)
                    })
                    
                    
                    
                    
                    
                    
                    
                    
                }
                Spacer()
                Spacer()
                Spacer()
                
            }
            .frame(width: UIScreen.screenWidth)
            .ignoresSafeArea(.container, edges: .bottom)
            .background(Color(red: 1, green: 0.98, blue: 0.93))
            
            
            
            
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView(showWelcomeView: .constant(false))
    }
}
/*  List {
 Button("Log Out") {
 Task {
 do {
 try viewModel.signOut()
 showWelcomeView = true
 } catch {
 print(error)
 }
 }
 }
 }
 */
