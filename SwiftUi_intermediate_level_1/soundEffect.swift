//
//  soundEffect.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 17/10/2022.
//

import SwiftUI
import AVKit
class  soundManager {
    static var soundmanager = soundManager()
    var player :AVAudioPlayer?
    enum Soundoption : String {
        case audio1,audio2,audio4
    }
    func playsound(sound:Soundoption) {
        guard let  url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
//            player = try AVAudioPlayer (contentsOf: url)
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error play sound \(error.localizedDescription)")
        }
    }
    
}

struct soundEffect: View {
    var body: some View {
        VStack(spacing:20){
            
            Button("Sound 1"){
                soundManager.soundmanager.playsound(sound: .audio1)
            }
            Button("pause"){
                soundManager.soundmanager.player?.pause()
            }
            Button("play"){
                soundManager.soundmanager.player?.play()
            }
            Button(" Sound 2 "){
                soundManager.soundmanager.playsound(sound: .audio2)
            }
            Button(" Sound 3 "){
                soundManager.soundmanager.playsound(sound: .audio4)
            }
        }
    }
}

struct soundEffect_Previews: PreviewProvider {
    static var previews: some View {
        soundEffect()
    }
}
