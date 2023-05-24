//
//  HASHABLE_Protocol.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 03/12/2022.
//

import SwiftUI
struct DataModel:Hashable {
    let title:String
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HASHABLE_Protocol: View {
    let dataarray:[DataModel]=[
    DataModel(title: "Imran"),
    DataModel(title: "Asim"),
    DataModel(title: "Usama"),
    DataModel(title: "Irfan"),
    DataModel(title: "Hussain")
    ]
    var body: some View {  
        ScrollView{
            VStack{
                ForEach(dataarray,id: \.self) { item in
                    Text("\(item.title)")
                    
                }
            }
        }
    }
}

struct HASHABLE_Protocol_Previews: PreviewProvider {
    static var previews: some View {
        HASHABLE_Protocol()
    }
}
