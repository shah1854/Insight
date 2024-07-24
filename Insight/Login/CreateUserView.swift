//
//  CreateUserView.swift
//  Insight
//
//  Created by Mihir Shah on 7/3/24.
//

import SwiftUI

struct CreateUserView: View {
    @StateObject private var viewModel = CreateUserViewModel()
    @State private var isSecured: Bool = true
    @State var showView = false
    
    var body: some View {
        NavigationStack {
            if showView {
                MainView(showSignIn: false)  // This will show the main view when `showView` is true
            } else {
                createView  // Otherwise, it will show the login form
            }
        }
    }
    
    var createView: some View {
        NavigationView {
            VStack {
                Text("Create Account")
                    .font(.title)
                    .bold()
                    .padding()
                    
                VStack {
                    TextField(
                        "Name",
                        text: $viewModel.name
                    )
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    TextField(
                        "Email",
                        text: $viewModel.email
                    )
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
//                    SecureField(
//                        "Password",
//                        text: $viewModel.password
//                    )
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField(
                                    "Password",
                                    text: $viewModel.password
                                )
                            } else {
                                TextField(
                                    "Password",
                                    text: $viewModel.password
                                )
                            }
                        }
                        .padding(.trailing, 32)
                        .textInputAutocapitalization(.never)

                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding()
                
                VStack {
                    Text("List 3 topics that interest you")
                    TextField(
                        "Interest 1",
                        text: $viewModel.interest1
                    )
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    TextField(
                        "Interest 2",
                        text: $viewModel.interest2
                    )
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    TextField(
                        "Interest 3",
                        text: $viewModel.interest3
                    )
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    showView = viewModel.newUser()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .frame(height: 55)
                        Text("Create Account")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                })
                .padding()
            }
        }
        
    }
}

#Preview {
    CreateUserView()
}
