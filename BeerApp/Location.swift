//
//  Location.swift
//  BeerApp
//
//  Created by Christian Shirichena on 1/23/21.
//

import Foundation
import UIKit

var userEnteredZipCode = ""

struct Location: Decodable {
    let data: [Data]
}

struct Images: Decodable {
    let icon: URL
    let medium: URL
}

struct Brewery: Decodable {
    let id: String
    let name: String
    let nameShortDisplay: String
    let images: Images?
}

struct Data: Decodable {
    let id: String
    let name: String
    let streetAddress: String
    let region: String
    let postalCode: String
    let brewery: Brewery?
}

func setUpADay() {

URLSession.shared.dataTask(with: URL(string: "https://sandbox-api.brewerydb.com/v2/locations/?key=152f435217d5cb3e67e614c1a576aa01&postalCode=\(userEnteredZipCode)")!)
{ (data, response, error) in
  guard let data = data else {
    print("no data found")
    return
  }
  do {
    let results = try JSONDecoder().decode(Location.self, from: data)
    print(results.data)
  } catch {
    print("There was an error")
  }
}.resume()
}
