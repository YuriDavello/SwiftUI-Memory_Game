//
//  ContentView.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 07/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiViewModel
    
    var body: some View {
    VStack {
        Text(viewModel.themeName).font(.largeTitle)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
        
        .foregroundColor(viewModel.themeColor)
        .padding(.horizontal)
        .font(.largeTitle)
        
        Button {
            viewModel.newGame()
        } label: {
            Text("New Game")
            .font(.largeTitle)
            }
    }
.padding(.horizontal)
        }
    }

struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
            shape.foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
            shape
            }
        }
    }
}







































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game =  EmojiViewModel()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

