//
//  ContentView.swift
//  EnglishWordApp
//
//  Created by Juri Ohto on 2021/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var cards = ["かばん": "bag",
                 "自動車": "car",
                 "誕生日": "birthday"
                ]
    
    @State var japanese = "かばん"
    @State var isJapanese = true
    
    
    var body: some View {
        
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.56).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                ZStack {
                    Image("card")
                        .resizable()
                        .frame(width: 300, height: 133)
                        .shadow(radius: 3)
                        //アニメーション
                        .rotation3DEffect(
                            .degrees(isJapanese ? 0 : 180),
                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                        .animation(.spring())
                        //単語シートタップで裏返す
                        .onTapGesture {
                            self.isJapanese.toggle()
                        }
                    Text(isJapanese ? japanese : cards[japanese]!)
                        
                        .font(.largeTitle)
                    
                }.padding()

                
                HStack {
                    Group {
                        Button(action: {
                            self.isJapanese.toggle()
                        }) {
                            Image(systemName: "arrow.2.circlepath")
                            Text("裏返す")
                        }
                        Button(action: {
                            self.isJapanese = true
                            self.japanese = self.cards.randomElement()!.key
                        }) {
                            Image(systemName: "forward.fill")
                            Text("次へ")
                        }
                    }.padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.86, green: 0.45, blue: 0.03))
                    .cornerRadius(10)

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
