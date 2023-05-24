//
//  CRUD.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 15/12/2022.
//

import SwiftUI

struct CRUD: View {
    @EnvironmentObject var vm:APIMODEL
    @State var isPresent:Bool=false
    @State var title:String=""
    @State var bodyField:String=""
//    @State var id:Int=0
    var body: some View {
        NavigationView {
            List{
                ForEach(vm.postArray1) { item in
                    NavigationLink {
                        DetailView(items:item)
                    } label: {
                        VStack{
                            Text("\(item.id)")
                                .foregroundColor(.red)
                                .bold()
                            Text(item.title)
                                .foregroundColor(.red)
                                .bold()
                            Text(item.body)
                                .foregroundColor(.green)
                                .bold()
                        }
                    }

                    
                }.onDelete(perform: DeletePost)
            }
                .navigationBarTitle("POST")
                .navigationBarItems(trailing: plusButton)
        }.sheet(isPresented: $isPresent) {
            NewPost(ispresent: $isPresent, title: $title, bodyField: $bodyField)
        }
       
    }
    func DeletePost(indexset:IndexSet){
        let id = indexset.map { vm.postArray1[$0].id }
        DispatchQueue.main.async {
            let parameters:[String:Any]=["id": id[0]]
            self.vm.Deletedata(parameters: parameters)
            self.vm.getdata()
        }
    }
    var plusButton: some View {
        Button {
            isPresent.toggle()
        } label: {
            Image(systemName: "plus")
        }

    }
}

struct CRUD_Previews: PreviewProvider {
    static var previews: some View {
        CRUD()
    }
}
