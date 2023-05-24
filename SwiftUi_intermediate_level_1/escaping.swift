//
//  escaping.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 06/12/2022.
//

import SwiftUI
class EscapingClass:ObservableObject{
    @Published var text:String="I am Imranullah"
    func getdata(){
//        let  newdata = download()
//        text = newdata
//        ****** Second Step
//         download2 { data in
//            text=data
//        }
        
//        ***** Third Step
//        download3 { [weak self] data in
//            self?.text = data
//        }
        //        ***** Fourt Step
//        download4 { [weak self] downloadREsult in
//                self?.text = downloadREsult.data
//        }
        
//        ********* Five
        
        download5 { [weak self] downloadREsult in
               self?.text = downloadREsult.data
        }
    }
    func download() ->String {
        return "I am Imranullah From Esole"
    }
    func download2(completionhendler:(_ data:String)->Void) {
       return completionhendler("I am Imranullah From Esole")
    }
    func download3(completionhendler:@escaping(_ data:String)->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
         completionhendler("I am Imranullah From Esole")
        }
    }
    func download4(completionhendler:@escaping(downloadREsult)->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            completionhendler(downloadREsult.init(data: "New Data"))
        }
    }
    
    func download5(completionhendler:@escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            completionhendler(downloadREsult.init(data: "New Data"))
        }
    }
}
struct downloadREsult {
    let data:String
}
typealias DownloadCompletion = (downloadREsult)->Void
struct escaping: View {
    @StateObject  var vm = EscapingClass()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.green)
            .onTapGesture {
                vm.getdata()
            }
    }
}

struct escaping_Previews: PreviewProvider {
    static var previews: some View {
        escaping()
    }
}
