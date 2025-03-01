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
    @Binding var isAuthenticated: Bool
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var authPage: AuthPage = .login
    
    
    var signInView: some View {
        VStack(spacing: 24) {
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
                        isAuthenticated = true
                    }else{
                        print("Enter username and Password")
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8).frame(width: 120, height: 40).foregroundStyle(.black)
                        Text("Login").foregroundStyle(.white).font(.headline)
                    }
                })
            }.padding()
            Button("Create an Account", action: {
                authPage = .register
            }).foregroundStyle(.black).font(.headline)
            HStack{
                Button(
                    action: {
                        authPage = .forgot
                    },
                    label: {
                        HStack{
                            Image(systemName:"questionmark.app").resizable().frame(width: 24, height: 24)
                            Text("Forgot Password").font(.headline)
                        }.foregroundStyle(.black)
                    }
                )
            }
            
        }
    }
    
    var registerView: some View {
        ZStack(alignment: .topLeading){
            Button(
                action: {
                    authPage = .login
                },
                label: {
                    HStack{
                        Image(systemName: "arrowshape.turn.up.backward")
                        Text("Back").font(.headline)
                    }
                }
            ).padding(.leading, 10)
            
            VStack(spacing: 24) {
                CircleImage(size: 100)
                
                Form{
                    TextField("Username", text: $username)
                }.frame(maxHeight: 110)
                
                HStack{
                    Spacer()
                    Button(action: {
                        print("You are Registered")
                        authPage = .login
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).frame(width: 120, height: 40).foregroundStyle(.black)
                            Text("Next").foregroundStyle(.white).font(.headline)
                        }
                    })
                }.padding()
                
            }.padding(.top, 60)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var loremIpsumText = """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
    """
    
    var forgotView: some View {
        ZStack(alignment: .topLeading){
            Button(
                action: {
                    authPage = .login
                },
                label: {
                    HStack{
                        Image(systemName: "arrowshape.turn.up.backward")
                        Text("Home").font(.headline)
                    }
                }
            ).padding(.leading, 10)
            
            VStack(spacing: 24) {
                Text(loremIpsumText).padding()
                
                Form{
                    TextField("New Password", text: $password)
                }.frame(maxHeight: 110)
                
                HStack{
                    Spacer()
                    Button(action: {
                        print("You are Registered")
                        authPage = .login
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8).frame(width: 120, height: 40).foregroundStyle(.black)
                            Text("Next").foregroundStyle(.white).font(.headline)
                        }
                    })
                }.padding()
                Spacer(minLength: 300)
            
            }.padding(.top, 60)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
    SignInLayout(isAuthenticated: .constant(false))
}
