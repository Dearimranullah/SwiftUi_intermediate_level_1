//
//  Paractices.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 09/02/2023.
//

import SwiftUI
struct Fruite:Identifiable {
    let id = UUID().uuidString
    let name:String
    let count:Int
}
class FruiteViewModel:ObservableObject {
    @Published var fruiteArray:[Fruite] = []
    init() {
        friute()
    }
    func friute(){
      let friute = Fruite(name: "Apple", count: 5)
        let friute2 = Fruite(name: "Mango", count: 4)
        let friute3 = Fruite(name: "Grapes", count: 3)
        fruiteArray.append(contentsOf: [friute,friute2,friute3])
    }
}
struct Paractices: View {
    let url = URL(string: "https://picsum.photos/200")
    @StateObject var friutes:FruiteViewModel=FruiteViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    AsyncImage(url:url)
                    List{
                        ForEach(friutes.fruiteArray){ items in
                            NavigationLink {
                                Second(selecteditems: items)
                            } label: {
                                HStack{
                                    Text("\(items.count)")
                                    Text("\(items.name)")
                                }
                            }
                            
                          
                            
                        }.onDelete { index in
                            friutes.fruiteArray.remove(atOffsets: index)
                        }
                    }.listStyle(GroupedListStyle())
                    
                }
            }
        }
        .environmentObject(friutes)
    }
}

struct Paractices_Previews: PreviewProvider {
    static var previews: some View {
        Paractices()
    }
}


struct Second : View {
    var selecteditems:Fruite
//    @ObservedObject var fruitess:FruiteViewModel=FruiteViewModel()
    var body: some View {
        ZStack{
            NavigationLink {
                Final()
            } label: {
                HStack{
                    Text("\(selecteditems.count)")
                    Text("\(selecteditems.name)")
                        
                    }
            }
          
            }
        }
    }
struct Final : View {
    @EnvironmentObject var fruitess:FruiteViewModel
    var body: some View {
        ZStack{
            HStack{
                ForEach(fruitess.fruiteArray){ items in
                    Text("\(items.name)")
                }
            }
        }
    }
}
