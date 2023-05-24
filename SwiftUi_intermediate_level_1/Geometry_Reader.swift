//
//  Geometry_Reader.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/10/2022.
//

import SwiftUI

struct Geometry_Reader: View {
    func getPercntage (geo:GeometryProxy) -> Double {
        let maxdistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double (1 - (currentX / maxdistance))
        
    }
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
//                            .fill(.orange)
//                            .shadow(color:.green,radius: 10)
                            .padding()
                            .rotation3DEffect(
                                Angle(degrees:getPercntage(geo: geometry) * 40 )
                            , axis:(x:0.0,y:1.0,z:0.0)
                            )
                        
                    }.frame(width: 300,height: 250)
                    
                }
            }
        }
//        GeometryReader { geometry in
//            HStack(spacing:0){
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: geometry.size.width * 0.666)
//    //            when use the below code gives not actual size of the width  in portation for this reason we use geometryreader in the above
//    //                .frame(width: UIScreen.main.bounds.width * 0.666)
//                Rectangle()
//                    .fill(.orange)
//            }
//            .ignoresSafeArea()
//        }
      
    }
}

struct Geometry_Reader_Previews: PreviewProvider {
    static var previews: some View {
        Geometry_Reader()
    }
}
