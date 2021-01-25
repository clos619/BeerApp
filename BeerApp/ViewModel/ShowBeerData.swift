//
//  ShowBeerData.swift
//  BeerApp
//
//  Created by Field Employee on 1/25/21.
//

/*//
 //  ShowLocation.swift
 //  BeerApp
 //
 //  Created by Field Employee on 1/24/21.
 //

 import SwiftUI

 
 

 struct ShowLocation: View {
     var body: some View {
         ForEach(0 ..< data.count) { value in
                     Text(data[value].name)
                 }
     }
 }

**/




import SwiftUI

struct testData: Identifiable{
    var id: Int
    var name: String
    var attunement: String
}

struct ShowBeerData: View {
    var data: [testData]
    var body: some View {
        List(data){
        data in ListRow()
            
        }
    }
}
let testing = [testData(id: 1,name: "Luke",attunement: "light"),
            testData(id: 2,name: "Obi-wan", attunement: "light"),
            testData(id: 3,name: "Dark Maul", attunement: "Sith")
]
struct ListRow: View{
    var body: some View{
    HStack{
        Text(testing[0].name)
        }
    }
}





struct ShowBeerData_Previews: PreviewProvider {
    static var previews: some View {
        ShowBeerData(data:testing)
    }
}
