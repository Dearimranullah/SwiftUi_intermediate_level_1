//
//  Rotation_Guester.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 16/10/2022.
//

import SwiftUI

struct Rotation_Guester: View {
    @State var angle:Angle = Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(40)
            .foregroundColor(.white)
            .background(Color.green.cornerRadius(20))
            .rotationEffect(angle)
            .gesture(
            RotationGesture()
                .onChanged({ value in
                    angle = value
                })
                .onEnded({ value in
                    angle = Angle(degrees: 0)
                })
            )
        
    }
}

struct Rotation_Guester_Previews: PreviewProvider {
    static var previews: some View {
        Rotation_Guester()
    }
}
