//
//  MaskS.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/10/2022.
//

import SwiftUI

struct MaskS: View {
    @Binding var star:Int
    var body: some View {
        ZStack{
            
            starview
                .overlay(
                    overlayView
                    .mask(starview)
                )
        }
    }
    private var overlayView:some  View {
        GeometryReader{ geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(star) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    private var starview:some View {
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(star >= index ? .yellow : .gray)
                    .onTapGesture {
                        withAnimation {
                            star = index
                        }
                        
                    }
                
            }
        }
    }
}

struct MaskS_Previews: PreviewProvider {
    static var previews: some View {
        MaskS(star: .constant(0))
    }
}
