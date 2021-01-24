//
//  SearchBar.swift
//  BeerApp
//
//  Created by Christian Shirichena on 1/23/21.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @State var userEnteredZipCode: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search for a Beer", text: $userEnteredZipCode)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray))
                .cornerRadius(8)
                // Search icon and cross icon
                .overlay(HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity,  alignment: .leading)
                        .padding(.leading, 8)
                    
                    if isEditing {
                        Button(action: {
                            self.userEnteredZipCode = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                })
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.userEnteredZipCode = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing,10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}



struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(userEnteredZipCode: (""))
    }
}
