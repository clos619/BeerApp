//
//  Register.swift
//  BeerApp
//
//  Created by Field Employee on 1/21/21.
//

import Foundation
import SwiftUI
import Firebase

struct RegisterView : View{
    private let database = Database.database().reference()
    @State var email : String = ""
    @State var passworrd: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var street: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    let uuid = UUID().uuidString
    
    var body: some View {
        Text("Come see whats Inside!")
        Spacer()
        Image("registerbeer").resizable().scaledToFit()
        
        HStack{
            VStack{
                TextField("Enter First Name", text: $firstName).padding().multilineTextAlignment(.center)
                
                TextField("Enter Last Name", text: $lastName).padding().multilineTextAlignment(.center)
                
                TextField("Enter City", text: $city).padding().multilineTextAlignment(.center)
                
                TextField("Enter State", text: $state).padding().multilineTextAlignment(.center)
                
                TextField("Enter Zipcode", text: $zipCode).padding().multilineTextAlignment(.center)
                
                TextField("Enter Email", text: $email).padding().multilineTextAlignment(.center)
                
                TextField("Enter Password", text: $passworrd).padding().multilineTextAlignment(.center)
                
                Button("Submit"){
                    submitButton()
                   
                }
            }
        }
    }
    func submitButton(){
        Auth.auth().createUser(withEmail: email, password: passworrd)
        print(email,passworrd)
        let object : [String: Any] = [
            "Id":uuid as NSObject,
            "first name": firstName,
            "last name": lastName,
            "city": city,
            "state": state,
            "zipCode": zipCode,
            "email": email
        ]
        database.child("User_\(Int.random(in: 0...1000))").setValue(object)
    }
    
}
