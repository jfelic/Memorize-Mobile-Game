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
    let halloweenEmojis = ["🎃", "👻", "🕸️", "🕷️", "🧙‍♀️", "🧟‍♂️", "🧛‍♂️", "💀", "⚰️", "🪦", "🌕", "🧛‍♀️", "🧙‍♂️", "🧟‍♀️", "🍬"]
    let summerEmojis = ["🌞", "🏖️", "🌴", "🍉", "🍦", "🌊", "🏄‍♂️", "👙", "🌺", "🍹", "🏊‍♀️", "🕶️", "🐚", "🏝️", "🩴"]
    let xmasEmojis = ["🎄", "🎅", "🤶", "🎁", "🦌", "⛄", "❄️", "🔔", "🕯️", "🍪", "🥛", "🌟", "🧦", "🎀", "🛷"]

    //Default card count
    @State var cardCount: Int = 4
    //Default chosen theme
    @State var chosenTheme: [String] = ["🎃", "👻", "🕸️", "🕷️"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                cards
                buttons
            }
            Spacer()
        }.padding()
    }
    
    //MARK: ContentView Components
    var cards: some View {
        
        return LazyVGrid(columns: [GridItem(), GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: chosenTheme[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var buttons: some View {
        HStack {
            halloweenButton
            Spacer()
            summerButton
            Spacer()
            xmasButton
            
        }.padding().imageScale(.large).font(.largeTitle)
    }
    
    var halloweenButton: some View {
        Button(action: {
            chosenTheme = halloweenEmojis
        }, label: {
            Text("👻")
        })
    }
    
    var summerButton: some View {
        Button(action: {
            chosenTheme = summerEmojis
        }, label: {
            Text("☀️")
        })
    }
    
    var xmasButton: some View {
        Button(action: {
            chosenTheme = xmasEmojis
            print("Chosen theme: \(chosenTheme)")
        }, label: {
            Text("🎅🏻")
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
        }
    }//end of body
}//end of CardView


#Preview {
    ContentView()
}
