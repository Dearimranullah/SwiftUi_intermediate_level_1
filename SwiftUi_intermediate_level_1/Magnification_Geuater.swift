//
//  Magnification_Geuater.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 16/10/2022.
//

import SwiftUI

struct Magnification_Geuater: View {
    @State var currentvalue : CGFloat = 0
    @State var lastvalue : CGFloat = 0
    var body: some View {
        ZStack{
            VStack{
                
                HStack{
                    Circle()
                        .frame(width: 35 , height: 35)
                    Text("Esole Software")
                    Spacer()
                    Image(systemName: "ellipsis")
                }.padding(.horizontal,30)
                
                Rectangle()
                    .frame(height: 300)
                    .cornerRadius(20)
                    .scaleEffect(1 + currentvalue)
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                currentvalue = value - 1
                            })
                            .onEnded({ value in
                                withAnimation(.spring()){
                                    currentvalue = 0
                                }
                            })
                        
                    )
                HStack{
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                .padding(.horizontal)
                .font(.headline)
                
                Text("This is the captio of my photos")
            }
            ZStack{
                Text("\(currentvalue)")
                    .foregroundColor(.red)
            }
        }
       
       
        
        
        
        
        
//        Text("Hello, World!")
//            .font(.title2)
//            .padding(40)
//            .background(.red)
//            .cornerRadius(10)
//           .scaleEffect(1 + currentvalue + lastvalue)
//           .gesture(
//           MagnificationGesture()
//            .onChanged({ value in
//                currentvalue = value - 1
//            })
//            .onEnded({ value in
//                lastvalue += currentvalue
//                currentvalue = 0
//            })
//
//           )
        
    }
}

struct Magnification_Geuater_Previews: PreviewProvider {
    static var previews: some View {
        Magnification_Geuater()
    }
}
