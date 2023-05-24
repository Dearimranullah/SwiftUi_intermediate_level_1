//
//  MultipleSheetss.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/10/2022.
//

import SwiftUI

struct RandomModel:Identifiable{
    let id = UUID().uuidString
    let title:String
}

struct MultipleSheetss: View {
    @State var star:Int = 0
    @State var star2:Int = 0
    @State var star3:Int = 0
    @State var star4:Int = 0
    @State var star5:Int = 0
    @State var selectedmodel:RandomModel
    @State var showSheet:Bool = false
    var body: some View {
        VStack(spacing: 20){
            Button("Button 1"){
                selectedmodel = RandomModel(title: "One")
                showSheet.toggle()
            }
            
            Button("Button 2"){
                selectedmodel = RandomModel(title: "Two")
                showSheet.toggle()
            }
            MaskS(star: $star)
            MaskS(star: $star2)
            MaskS(star: $star3)
            MaskS(star: $star4)
            MaskS(star: $star5)
        }
        .sheet(isPresented: $showSheet) {
            Nextscreen(selectedmodel: $selectedmodel)
        }
    }
}
    struct Nextscreen :View {
        @Environment(\.presentationMode) var presentationMode
        @Binding  var selectedmodel:RandomModel
        var body: some View {
                
                VStack{
                    HStack{
                        VStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .padding(20)
                                    .background(
                                        Circle()
                                            .foregroundColor(.red)
                                        
                                    )
                            })
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    VStack{
                        Text(selectedmodel.title)
                            .font(.largeTitle)
                    }
                    Spacer()
                   
                   
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }

struct MultipleSheetss_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetss(selectedmodel: RandomModel(title: "Hi"))
    }
}
