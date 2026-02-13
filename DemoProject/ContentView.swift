//
//  ContentView.swift
//  DemoProject
//
//  Created by Swayambhu BANERJEE on 13/02/26.
//

import SwiftUI

// Question 1. How the data will be passed to viewmodel
// Validation is required

// Question 2. How will i handle the login success?


struct ContentView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    TextField("Username", text: $viewModel.userName, prompt: Text("Username").foregroundStyle(.white.opacity(0.6)))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1.0)
                        }
                        .frame(maxWidth: .infinity)
                    
                    SecureField("Password", text: $viewModel.password,
                                prompt: Text("Password").foregroundStyle(.white.opacity(0.6)))
                    .padding(.horizontal, 10)
                    .frame(height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1.0)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        Task {
                            await viewModel.validate()
                        }
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                    }
                    .disabled(viewModel.isLoading)
                }
                .padding(32)
            }
            .navigationDestination(isPresented: $viewModel.loginSucess) {
                HomeView()
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("Ok") { }
        }
        message: {
            Text(viewModel.errorMsg)
        }
    }
}

#Preview {
    ContentView()
}
