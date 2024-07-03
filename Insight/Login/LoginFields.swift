//
//  LoginFields.swift
//  Insight
//
//  Created by Mihir Shah on 6/14/24.
//

import SwiftUI

struct LoginFields: View {
    @StateObject private var viewModel = SignInViewModel()
    @State var showView = true
    @State private var isSecured: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.title)
                    .bold()
                    .padding()
                    
                VStack {
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
                
                Button(action: {
                    viewModel.signIn()
                    
                    NavigationLink {
                        MainView()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .frame(height: 55)
                        Text("Sign In")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                })
                .padding()
                
                NavigationLink {
                    CreateUserView()
                } label: {
                    Text("Create Account")
                }
            }
        }
    }
}

#Preview {
//    static var previews: some View {
//
//    }
    LoginFields()
}
