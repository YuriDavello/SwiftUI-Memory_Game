//
//  EmojiViewModel.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 20/12/21.
//

import SwiftUI

class EmojiViewModel {
    static let emojis = ["🍎", "🍑", "🍒", "🍇", "🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🫐", "🍈", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🫑", "🥒"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(pairsOfCards: 8){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
