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
    @State var email : String = ""
    @State var passworrd: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    //register
    var body: some View {
        Text("Register for an Account!")
        
        Spacer()
        VStack{
            HStack{
                TextField("Enter First Name", text: $firstName).padding().multilineTextAlignment(.center)
                
                TextField("Enter Last Name", text: $lastName).padding().multilineTextAlignment(.center)
                
                TextField("Enter Email", text: $email).padding().multilineTextAlignment(.center)
                
                TextField("Enter Password", text: $passworrd).padding().multilineTextAlignment(.center)
                Spacer()
                
                Button("Submit"){
                    submitButton()
                }
            }
        }
    }
    func submitButton(){
        
    }
    
}
