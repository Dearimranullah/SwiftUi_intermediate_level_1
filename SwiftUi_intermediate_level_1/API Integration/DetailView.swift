//
//  DetailView.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 15/12/2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var vm:APIMODEL
    let items:PostModelpp
    @Environment(\.presentationMode) var presentationMode
    @State var title:String=""
    @State var bodyField:String=""
    @State var id:String=""
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Create new Post")
                    .bold()
                TextField("Enter Title", text: $title)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                TextField("Enter body", text: $bodyField)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            }.padding()
                .onAppear(perform: {
                    self.title = items.title
                    self.bodyField = items.body
                }
                   
                )
               
        }
        .navigationBarTitle("EditPost")
            .navigationBarItems(trailing: leading
            )
    }
    var leading: some View {
        Button {
            if title != "" && bodyField != "" {
                let parameters:[String:Any]=["title":title, "body":bodyField]
                vm.Putdata(parameters: parameters)
                vm.getdata()
                presentationMode.wrappedValue.dismiss()
            }
            
        } label: {
            Text("save")
        }

    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
