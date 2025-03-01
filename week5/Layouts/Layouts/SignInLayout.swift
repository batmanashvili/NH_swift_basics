//
//  SignInLayout.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

enum AuthPage {
    case login
    case register
    case forgot
}

struct SignInLayout: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var authPage: AuthPage = .login
    
    var signInView: some View {
        VStack(spacing: 16) {
            CircleImage(size: 100)
            
            Form{
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }.frame(maxHeight: 150)
            HStack{
                Spacer()
                Button(action: {
                    if(username != "" && password != ""){
                        print("You are authenticated. :)")
                    }else{
                        print("Enter username and Password")
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8).frame(width: 120, height: 40)
                        Text("Login").foregroundStyle(.white).font(.headline)
                    }
                })
            }.padding()
        }
    }
    
    var registerView: some View {
        VStack{
            CircleImage(size: 100)
        }
    }
    
    var forgotView: some View {
        VStack{
            CircleImage(size: 100)
        }
    }
    
    
    
    var body: some View {
        switch authPage {
        case .login:
            signInView
        case .register:
            registerView
        case .forgot:
            forgotView
        }
        
    }
}

#Preview {
    SignInLayout()
}
