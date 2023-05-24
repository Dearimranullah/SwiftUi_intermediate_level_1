//
//  BackgroundThread.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 05/12/2022.
//

import SwiftUI
class Threads:ObservableObject{
    @Published var dataArray:[String]=[]
//    init(){
//        fetchdata()
//    }
    func fetchdata(){
        DispatchQueue.global(qos: .background).async {
            let newdata = self.Download()
            print("CHECK:1 \(Thread.isMainThread)")
            print("CHECK:1 \(Thread.current)")
            DispatchQueue.main.async {
                self.dataArray=newdata
                print("CHECK:2 \(Thread.isMainThread)")
                print("CHECK:2 \(Thread.current)")
            }
              
        }
        
    }
    func Download()->[String] {
        var data:[String] = []
        for x in 1...100 {
            data.append(String(x))
        }
        return data
    }
}
struct BackgroundThread: View {
    @StateObject var vm = Threads()
    var body: some View {
        ScrollView{
            VStack{
                Button {
                    vm.fetchdata()
                } label: {
                    Text("Load Data ...")
                        .frame(width: 350,height: 55)
                        .bold()
                        .foregroundColor(.white)
                        .background(.pink)
                        .cornerRadius(10)
                }

            }
            ForEach(vm.dataArray,id: \.self){ item in
                Text("\(item)")
                    .bold()
                
            }
            
        }
    }
}

struct BackgroundThread_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThread()
    }
}
