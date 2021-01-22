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
    var setZip = [String: String]()
    var zipCode: String = "92128"
    func getUser(){
        session.listen()
    }
    private let database = Database.database().reference()
    var body: some View {
        Text("Welcome Home")
        Label{
            Text("zipCode: ",tableName: zipCode)
        }icon:{
        }
        NavigationView{
            VStack{
                HStack{
                    if session != nil{
                    Button(action: session.signOut){
                        Text("Sign Out")
                    }
                    }else{
                        AuthView()
                    }
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

