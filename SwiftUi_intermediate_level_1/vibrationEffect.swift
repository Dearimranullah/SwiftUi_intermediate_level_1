//
//  vibrationEffect.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/10/2022.
//

import SwiftUI
class Hapticmanager {
    
    static let instance=Hapticmanager()
    func notification (type:UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact (style:UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct vibrationEffect: View {
    var body: some View {
        VStack{
            Button("Success"){Hapticmanager.instance.notification(type: .success)}
            Button("Warning"){Hapticmanager.instance.notification(type: .warning)}
                Button("Error"){Hapticmanager.instance.notification(type: .error)}
                Divider()
                Button("Heavy"){Hapticmanager.instance.impact(style: .heavy)}
            Button("Light"){Hapticmanager.instance.impact(style: .light)}
            Button("Medium"){Hapticmanager.instance.impact(style: .medium)}
            Button("Ragid"){Hapticmanager.instance.impact(style: .rigid)}
            Button("Soft"){Hapticmanager.instance.impact(style: .soft)}
        
            }
    }
}

struct vibrationEffect_Previews: PreviewProvider {
    static var previews: some View {
        vibrationEffect()
    }
}
