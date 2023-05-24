//
//  WeakSelf.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 05/12/2022.
//

import SwiftUI

struct WeakSelf: View {
    @AppStorage("count") var count:Int?
    init() {
        count = 0
    }
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink {
                    WeakSelfSecond()
                } label: {
                    Text("Navigate")
                        .font(.largeTitle)
                }

            }
            .navigationTitle("First Screen")
        }
        .overlay {
            Text("\(count ?? 0)")
                .frame(width: 50,height: 50)
                 .background(.green)
                 .cornerRadius(20)
        }
    }
}
struct WeakSelfSecond: View {
    @StateObject var vm=WeakSElfSecondScreen()
    var body: some View{
        VStack{
            Text("Second Screen")
                .font(.largeTitle)
            if let data = vm.data {
                Text("\(data)")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
        }
    }
}
class WeakSElfSecondScreen:ObservableObject{
    @Published var data:String?=nil
    init(){
        print("Initialize Now")
        let currentcount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentcount + 1, forKey: "count")
        getdata()
    }
    deinit {
        print("DeInitialize Now")
        let currentcount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentcount - 1, forKey: "count")
    }
    func getdata(){
//        data = "Hello Imranullah"
//        DispatchQueue.global().async {
//            self.data = "Hello"
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 50){ [weak self] in
            self?.data = "Hello"
        }
    }
}

struct WeakSelf_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelf()
    }
}
