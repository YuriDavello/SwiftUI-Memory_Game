//
//  EmojiViewModel.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 20/12/21.
//

import SwiftUI

class EmojiViewModel: ObservableObject {
    static let emojis = ["🍎", "🍑", "🍒", "🍇", "🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🫐", "🍈", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🫑", "🥒"]
    
    static func createMemoryGame() -> MemoryGameModel<String>{
        MemoryGameModel<String>(pairsOfCards: 12){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
         model.cards
    }
    
//    MARK: - Intent(s)
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
}
