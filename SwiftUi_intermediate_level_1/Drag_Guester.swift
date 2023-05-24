//
//  Drag_Guester.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 16/10/2022.
//

import SwiftUI

struct Drag_Guester: View {
    @State var offset : CGSize = .zero
    var body: some View {
        VStack{
            Text("\(offset.width)")
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300,height: 200)
                .scaleEffect(1.0)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation (.spring()){
                                offset = .zero
                            }
                        })
                )
        }
    }
}

struct Drag_Guester_Previews: PreviewProvider {
    static var previews: some View {
        Drag_Guester()
    }
}
