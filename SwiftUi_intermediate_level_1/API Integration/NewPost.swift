//
//  NewPost.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 15/12/2022.
//

import SwiftUI

struct NewPost: View {
    @EnvironmentObject var vm:APIMODEL
    @Binding var ispresent:Bool
    @Binding var title:String
    @Binding  var bodyField:String
    @State var isAlert:Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Create new Poat")
                        .bold()
                    TextField("Enter Title", text: $title)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    TextField("Enter body", text: $bodyField)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
//                    TextField("Enteruser id", value: $id ,formatter: NumberFormatter())
//                        .padding()
//                        .background(.white)
//                        .cornerRadius(10)
                }.padding()
                    .alert(isPresented: $isAlert) {
                       let title = Text("No data")
                        let message = Text("Plz fill title and body")
                        return Alert(title: title,message: message)
                    }
            }.navigationBarTitle("NewPost")
                .navigationBarItems(leading: trainling, trailing: leading
                )
        }
    }
    var trainling: some View {
        Button {
            ispresent.toggle()
        } label: {
            Text("Cancel")
        }

    }
    var leading: some View {
        Button {
            if title != "" && bodyField != ""   {
                let id = 2
                let parameters:[String:Any]=["title":title,"body":bodyField,"userID":id]
                vm.Postdata(parameters: parameters)
                ispresent.toggle()
                vm.getdata()
            } else {
                isAlert.toggle()
            }
        } label: {
            Text("Post")
        }

    }
}

//struct NewPost_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPost(title: "imran", bodyField: "Eole")
//    }
//}
