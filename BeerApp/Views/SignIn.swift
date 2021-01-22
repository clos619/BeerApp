//
//  SignInUI.swift
//  FinalProject
//
//  Created by Field Employee on 1/19/21.
//

import Foundation
import SwiftUI
import Firebase
import Combine

struct User{
    var uid: String
    var email: String
    
    init(uid: String, email: String?){
        self.uid = uid
        self.email = email!
    }
}
class SessionStore: ObservableObject{
    var didChange = PassthroughSubject<SessionStore,Never>()
    @Published var session: User?{didSet{self.didChange.send(self)}}
    var handler: AuthStateDidChangeListenerHandle?
    
    func listen(){
        handler = Auth.auth().addStateDidChangeListener({ (auth,user)in
            if let user = user{
                self.session = User(uid: user.uid,email: user.email)
            }else{
                self.session = nil
            }
        })
    }
    func signIn(email: String,password: String,handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        
            
            
//            (result,error) in if let error = error{
//                print(error.localizedDescription)
//
//            }
        
    }
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.session = nil
        }catch{
            print("error signing out")
        }
        
    }
    func unbind(){
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }

    }
    deinit {
        unbind()
    }
}


struct SignIn : View{
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @State private var isActive = false
    @EnvironmentObject var session: SessionStore
    
    func signIn(){
        session.signIn(email: email, password: password){(result,error) in if let error = error{
            self.error = error.localizedDescription
        }else{
            self.email = ""
            self.password = ""
        }
        }
    }
    
    var body: some View{
        NavigationView{
        VStack{
            Text("The Ultimate Beer App").bold().italic().underline()
            Spacer()
            Image("beer").resizable().scaledToFit()
            HStack{
                VStack{
                    //Text("Enter Username").padding().font(.caption)
                    TextField("Enter Email", text: $email).padding().multilineTextAlignment(.center)
                    TextField("Enter Password", text: $password).padding().multilineTextAlignment(.center)
                    Spacer()
                    HStack{
                        
                        VStack{
                            Button(action: signIn){
                                Text("Sign In")
                            }
                            NavigationLink(destination: HomeView(), isActive: $isActive) { }
                            
                            if error != ""{
                                Text(error)
                            }
//                            NavigationLink(destination: HomeView()) {
//                                Text("Sign In").onAppear(){
//                                    verify()
//                                }
//                            }
                            }.padding()
                        VStack{
                            NavigationLink("Create Account", destination: RegisterView())
                        }
                            
                        
                            }.padding()
                        }
                        
                    }
                }
            }
        }
    func verify(){
            if self.email != "" && self.password != ""{
                Auth.auth().signIn(withEmail: self.email, password: self.password){
                    (result,error) in if let error = error{
                        print(error.localizedDescription)
                        
                    }
                }
                
            }
        }
    }

struct AuthView: View{
    var body: some View{
        NavigationView{
            HomeView()
        }
    }
}

struct AuthView_Preview: PreviewProvider{
    static var previews: some View{
        AuthView().environmentObject(SessionStore())
    }
}
