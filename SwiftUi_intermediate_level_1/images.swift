//
//  images.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 18/10/2022.
//

import SwiftUI

struct images: View {
    var body: some View {
        HStack{
            ForEach(1..<4) { index in
                Circle()
                .frame(width: 80,height: 80)
            }
            .overlay {
                GeometryReader{ geo in
                        Rectangle()
                            .fill(.red)
                                .mask(
                                    Circle()
                                )
                    
                }
            }
   
    
                
        }
        
    }
}

struct images_Previews: PreviewProvider {
    static var previews: some View {
        images()
    }
}
