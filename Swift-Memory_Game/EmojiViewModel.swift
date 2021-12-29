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
            emojis: ["🍎", "🍑", "🍒", "🍇", "🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🫐", "🍈", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🫑", "🥒"],
            numberOfPairOfCards: 10,
            color: "purple"),
        Theme(
            name: "Faces",
            emojis: ["😀", "🥶", "🥵", "😱", "🤢", "🤡", "😮‍💨", "🥸", "🤩", "🤥", "😎", "🥳", "🤪", "🥱"],
            numberOfPairOfCards: 10,
            color: "yellow"),
        Theme(
            name: "Animals",
            emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🦄", "🐝"],
            numberOfPairOfCards: 10,
            color: "cyan"),
        Theme(
            name: "Plants",
            emojis: ["🪴", "🌵", "🌴", "🌱", "🌿", "🍁", "🍂", "🍀"],
            numberOfPairOfCards: 8,
            color: "green"),
        Theme(
            name: "Vehicles",
            emojis: ["🚗", "🚀", "🚁", "🚢", "⛵️", "🚒", "🛴"],
            numberOfPairOfCards: 7,
            color: "red"),
        Theme(
            name: "Food",
            emojis: ["🍔", "🍟", "🍗", "🧀", "🥐", "🥖", "🍫", "🍪", "🍕", "🍿", "🍩", "🌮", "🌭"],
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
