//
//  HomeView.swift
//  BeerApp
//
//  Created by Field Employee on 1/20/21.
//

import SwiftUI
import FirebaseDatabase

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    func getUser(){
        session.listen()
    }
    private let database = Database.database().reference()
    var body: some View {
        NavigationView{
        Text("Welcome Home")
        Label{
            Text("User: \(00)")
        }icon:{
        }
            VStack{
                HStack{
                    Button(action: session.signOut){
                        Text("Sign Out")
                }.onAppear(perform: {
                    getUser()
                    
                })
            }
        }
        
    }
//    func getUserData(){
//        database.child("User").observeSingleEvent(of: .value, with: {snapshot in
//            guard let value = snapshot.value as? [String:Any] else{
//                return
//            }
//            print("value: \(value)")
//        })
//    }
    
    }
}
