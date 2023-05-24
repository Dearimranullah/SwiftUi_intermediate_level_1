//
//  ScrolView_Reader.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 16/10/2022.
//

import SwiftUI

struct ScrolView_Reader: View {
    @State var scrollIndex:Int = 0
    @State var textfield:String = ""
    var body: some View {
        VStack {
            TextField("Enter the number here ....", text: $textfield)
                .foregroundColor(.black)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.orange)
                .cornerRadius(10)
                .padding()
                .keyboardType(.numberPad)
            Button(scrollIndex > 50 ? "Not Found" : "Click me to find \(textfield)"){
                if let index = Int(textfield) {
                    scrollIndex = index
                }
//                proxy.scrollTo(49,anchor: .cen
            }
            ScrollView{
                ScrollViewReader { proxy in
                                ForEach (0..<50){ index in
                                    Text("This is item  \(index)")
                                        .frame(maxWidth:.infinity)
                                        .frame(height:200)
                                        .background(.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding()
                                        .id(index)
                    
                                }
//                                .onChange(of: scrollIndex) { newValue in
//                                    proxy.scrollTo(newValue,anchor: .top)
//                                }
                                .onChange(of: scrollIndex) { Value in
                                    withAnimation (.spring()){
                                        proxy.scrollTo(Value , anchor: .top)
                                    }

                                }
                }
                
            }
        }
    }
}

struct ScrolView_Reader_Previews: PreviewProvider {
    static var previews: some View {
        ScrolView_Reader()
    } 
}
