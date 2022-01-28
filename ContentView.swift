//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio Marroquin on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var theme = 1
    @State var themes =
        [["✈️", "🚗", "🚀", "🛻", "🚃", "🚜", "🚔", "🚲", "🚡", "🚁", "🚘", "🚆", "🛥", "🏍", "🛺", "⛵️", "🛩"],
         ["😀", "😃", "😄", "🤣", "😇", "😍", "🤪", "🤓", "😎", "🤩", "🥳", "🥺", "🤬", "🤯", "🥶", "🤢"],
         ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "⛳️", "🥊",]];
//    var num = themes[theme].count;
    var num = 16
    @State var emojiCount = Int.random(in: 8..<16);
    
    
    var body: some View {
        VStack {
            Text("Memorize").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), ]){
                    ForEach(themes[theme][0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer();
            HStack {
                Spacer()
                Button(action: {
                    theme = 0
                    emojiCount = Int.random(in: 4..<16);
                }, label: {
                    VStack{
                        Text("🚗").font(.largeTitle)
                        Text("Vehicles").font(.title3)
                    }
                })
                Spacer()
                Button(action: {
                    emojiCount = Int.random(in: 4..<16);
                    theme = 1
                }, label: {
                    VStack{
                        Text("😃").font(.largeTitle)
                        Text("Faces").font(.title3)
                    }
                })
                Spacer()
                Button(action: {
                    emojiCount = Int.random(in: 4..<16);
                    theme = 2
                }, label: {
                    VStack{
                        Text("⚽️").font(.largeTitle)
                        Text("Sports").font(.title3)
                    }
                })
                Spacer()
            }
//            HStack{
//                Button(action: {
//                    if emojiCount > 1
//                    {
//                        emojiCount -= 1;
//                    }
//                }, label: {
//                    Image(systemName: "minus.circle")
//                })
//                Spacer();
//                Button(action: {
//                    if emojiCount < themes[theme].count
//                    {
//                        emojiCount += 1;
//                    }
//
//                }, label: {
//                    Image(systemName: "plus.circle")
//                })
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
            
            
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
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
    }
}
