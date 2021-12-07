//
//  ContentView.swift
//  Swift-Memory_Game
//
//  Created by Yuri Davello on 07/12/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🍎", "🍑", "🍒", "🍇", "🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍓", "🫐", "🍈", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🫑", "🥒"]
    @State var EmojiCount = 6
    
    var body: some View {
    VStack {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<EmojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        
        .foregroundColor(.purple)
        Spacer()
        
        HStack {
            remove
         Spacer()
            add
        }
        .padding(.horizontal)
        .font(.largeTitle)
    }
    .padding(.horizontal)
        }
    
    var remove: some View{
        Button {if EmojiCount > 1 { EmojiCount -= 1}} label: {Image(systemName: "minus.circle")}
    }
    
    var add: some View{
        Button {if EmojiCount < emojis.count { EmojiCount += 1}} label: {Image(systemName: "plus.circle")}
    }
    }

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
            shape.foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            
            Text(content).font(.largeTitle)
        } else {
            shape
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}







































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portraitUpsideDown)
        ContentView()
            .preferredColorScheme(.light)
    }
}

