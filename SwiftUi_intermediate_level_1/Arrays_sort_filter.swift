//
//  Arrays_sort_filter.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 18/10/2022.
//

import SwiftUI
struct ArrayModel:Identifiable {
    let id = UUID().uuidString
    let name:String
    let points:Int
    let isVerified:Bool
}
class ArrayViewModel:ObservableObject {
    @Published var dataArray:[ArrayModel]=[]
    @Published var filtredArray:[ArrayModel]=[]
    init () {
        getUsers()
        filtereFunction()
    }
    func getUsers(){
        let user1 = ArrayModel(name: "Imran", points: 10, isVerified: true)
        let user2 = ArrayModel(name: "Asim", points: 16, isVerified: false)
        let user3 = ArrayModel(name: "Usama", points: 60, isVerified: true)
        let user4 = ArrayModel(name: "Asif", points: 14, isVerified: false)
        let user5 = ArrayModel(name: "Aslam", points: 50, isVerified: true)
        let user6 = ArrayModel(name: "Furqan", points: 18, isVerified: false)
        let user7 = ArrayModel(name: "Ahamd", points: 120, isVerified: true)
        dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7
                ])
    }
    func filtereFunction(){
      
//        filtredArray = dataArray.sorted(by: { user1, user2 in
//            return user1.points < user2.points
//        })
        
//        The above line cam be used this
//        filtredArray = dataArray.sorted(by: {$0.points < $1.points })
        
//        filtredArray = dataArray.filter({ ArrayModel -> Bool in
//            return ArrayModel.points > 50
//            return !ArrayModel.isVerified
//            return ArrayModel.name.contains("i")
//        })
        
        
//        The above lines must be written like this
        filtredArray=dataArray.filter({
//            $0.isVerified
//            !$0.isVerified
            $0.name.contains("m")
        })
        
    }
    
}


struct Arrays_sort_filter: View {
    @StateObject var VmObject = ArrayViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing:20){
//                    After asigning the the sorted array to filterarray variable  we this variables instead of this "dataArray"
                    ForEach(VmObject.filtredArray){ items in
                        VStack(alignment:.leading){
                            Text(items.name)
                            HStack{
                                Text("\(items.points)")
                                Spacer()
                                if items.isVerified {
                                    Image(systemName: "flame.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                    }
                    Image("Group")
                }
//                .padding()
            }
            .navigationTitle("Filtered Array")
            .navigationBarItems(leading:
                                    Image(systemName: "globe"
                                          
                                         )
                .foregroundColor(.orange)
                                    , trailing:
                                    NavigationLink(destination: Text("Hello"), label: {
                Image(systemName: "sun.dust")
.foregroundColor(.orange)
            })
                                    
            )
        }
    }
}

struct Arrays_sort_filter_Previews: PreviewProvider {
    static var previews: some View {
        Arrays_sort_filter()
    }
}
