//
//  EmojiViewModel.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 20/12/21.
//

import SwiftUI

class EmojiViewModel: ObservableObject {
    
    init(){
        theme = EmojiViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiViewModel.createMemoryGame(theme: theme)
    }
    
    static let themes = [
        Theme(
            name: "Fruits",
            emojis: ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðŦ", "ð", "ðĨ­", "ð", "ðĨĨ", "ðĨ", "ð", "ð", "ðĨ", "ðŦ", "ðĨ"],
            numberOfPairOfCards: 10,
            color: "purple"),
        Theme(
            name: "Faces",
            emojis: ["ð", "ðĨķ", "ðĨĩ", "ðą", "ðĪĒ", "ðĪĄ", "ðŪâðĻ", "ðĨļ", "ðĪĐ", "ðĪĨ", "ð", "ðĨģ", "ðĪŠ", "ðĨą"],
            numberOfPairOfCards: 10,
            color: "yellow"),
        Theme(
            name: "Animals",
            emojis: ["ðķ", "ðą", "ð­", "ðđ", "ð°", "ðĶ", "ðŧ", "ðž", "ðŧââïļ", "ðĻ", "ðŊ", "ðĶ", "ðŪ", "ð·", "ðļ", "ðĶ", "ð"],
            numberOfPairOfCards: 10,
            color: "cyan"),
        Theme(
            name: "Plants",
            emojis: ["ðŠī", "ðĩ", "ðī", "ðą", "ðŋ", "ð", "ð", "ð"],
            numberOfPairOfCards: 8,
            color: "green"),
        Theme(
            name: "Vehicles",
            emojis: ["ð", "ð", "ð", "ðĒ", "âĩïļ", "ð", "ðī"],
            numberOfPairOfCards: 7,
            color: "red"),
        Theme(
            name: "Food",
            emojis: ["ð", "ð", "ð", "ð§", "ðĨ", "ðĨ", "ðŦ", "ðŠ", "ð", "ðŋ", "ðĐ", "ðŪ", "ð­"],
            numberOfPairOfCards: 10,
            color: "orange"),
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGameModel<String>{
        MemoryGameModel<String>(pairsOfCards: theme.numberOfPairOfCards){ pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGameModel<String>
    
    private var theme: Theme
    
    var themeName: String {
        theme.name
    }
    
    var themeColor: Color {
        switch theme.color {
        case "purple" : return .purple
        case "red" : return .red
        case "orange" : return .orange
        case "cyan" : return .cyan
        case "green" : return .green
        case "yellow" : return .yellow
        default:
            return .black
        }
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
         model.cards
    }
    
//    MARK: - Intent(s)
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        model.choose(card)
    }
    
    func newGame(){
        theme = EmojiViewModel.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiViewModel.createMemoryGame(theme: theme)
    }
}
