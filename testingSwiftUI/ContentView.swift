//
//  ContentView.swift
//  testingSwiftUI
//
//  Created by Julian Feliciano on 7/17/24.
//

import SwiftUI

//MARK: ContentView
struct ContentView: View {
    
    //Theme arrays
    let halloweenEmojis = ["🎃", "🎃", "👻", "👻", "🕸️", "🕸️", "🕷️", "🕷️", "🧟‍♂️", "🧟‍♂️"]
    let summerEmojis = ["🌞", "🌞", "🏖️", "🏖️", "🌴", "🌴", "🍉", "🍉", "🍦", "🍦"]
    let xmasEmojis = ["🎄", "🎄", "🎅", "🎅", "🤶", "🤶", "🎁", "🎁", "🦌", "🦌"]

    //Default card count
    @State var cardCount: Int = 10
    //Default chosen theme
    @State var chosenTheme = ["🎃", "🎃", "👻", "👻", "🕸️", "🕸️", "🕷️", "🕷️", "🧟‍♂️", "🧟‍♂️"]
    //Default color
    @State var themeColor = Color(.orange)
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
                cards
                Spacer()
                buttons
        }.padding()
    }
    
    //MARK: ContentView Components
    var cards: some View {
        
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 85))], spacing: 10) {
            
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: chosenTheme.shuffled()[index])
            }
        }
        .foregroundColor(themeColor).padding()
    }
    
    var buttons: some View {
        HStack {
            halloweenButton
            Spacer()
            summerButton
            Spacer()
            xmasButton
            
        }.padding()
    }
    
    var halloweenButton: some View {
        Button(action: {
            chosenTheme = halloweenEmojis
            themeColor = Color(.orange)
        }, label: {
            VStack{
//                Text("👻").font(.largeTitle)
                Image(systemName: "wand.and.stars").font(.largeTitle)
                Text("Spooky")
            }
        })
    }
    
    var summerButton: some View {
        Button(action: {
            chosenTheme = summerEmojis
            themeColor = Color(.blue)
        }, label: {
            VStack{
//                Text("☀️").font(.largeTitle)
                Image(systemName: "sun.max").font(.largeTitle)
                Text("Summer")
            }
        })
    }
    
    var xmasButton: some View {
        Button(action: {
            chosenTheme = xmasEmojis
            themeColor = Color(.red)
        }, label: {
            VStack{
//                Text("🎅🏻").font(.largeTitle)
                Image(systemName: "gift").font(.largeTitle)
                Text("Christmas")
            }
        })
    }
    
    //MARK: Functions

}//end of ContentView

//MARK: CardView
struct CardView: View {
    
    let content: String
    @State var isFaceUp = false// views are immutable
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }.aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
    }//end of body
}//end of CardView


#Preview {
    ContentView()
}
