//
//  SignInUI.swift
//  FinalProject
//
//  Created by Field Employee on 1/19/21.
//

import Foundation
import SwiftUI



struct SignIn : View{
    @State var username = ""
    @State var password = ""
    var body: some View{
        VStack{
            Text("Sign in").bold()
            Spacer()
            Image("beer").resizable().scaledToFit()
            HStack{
                VStack{
                    //Text("Enter Username").padding().font(.caption)
                    TextField("Enter Username", text: $username).padding().multilineTextAlignment(.center)
                    TextField("Enter Password", text: $password).padding().multilineTextAlignment(.center)
                    Spacer()
                    HStack{
                        VStack{
                            Button("Sign In"){
                                if username == "Carlos" && password == "h"{
                                    print("Signed in! : navigating to home")
                                }
                            
//                                NavigationLink("Go Home",destination:HomeView())
                            }.padding()
                            Button("Create Account"){
                                print("navigating to create account")
                                //                                NavigationLink("Go Home",destination:CreateAccount())
                            }.padding()
                        }
                        
                    }
                }
            }
        }
        
    }
    
}
