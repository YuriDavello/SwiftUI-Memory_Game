//
//  Swift_Memory_GameApp.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 07/12/21.
//

import SwiftUI

@main
struct Swift_Memory_GameApp: App {
    let game = EmojiViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
