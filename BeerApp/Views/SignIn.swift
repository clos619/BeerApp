//
//  SignInUI.swift
//  FinalProject
//
//  Created by Field Employee on 1/19/21.
//

import Foundation
import SwiftUI
import Firebase


struct SignIn : View{
    @State var username = ""
    @State var password = ""
    var body: some View{
        NavigationView{
        VStack{
            Text("The Ultimate Beer App").bold().italic().underline()
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
                            NavigationLink(destination: HomeView()) {
                                Text("Sign In").onAppear(){
                                    verify()
                                }
                            }
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
    func verify(){
            if self.username != "" && self.password != ""{
                Auth.auth().signIn(withEmail: self.username, password: self.password){
                    (result,error) in if let error = error{
                        print(error.localizedDescription)
                        
                    }
                }
                
            }
        }
    
    
}
