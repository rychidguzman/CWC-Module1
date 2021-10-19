//
//  ContentView.swift
//  war-card-game
//
//  Created by Ryan Christian De Guzman on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var cpuCard:String = "back"
    @State var playerCard = "back"
    
    @State var cpuScore:Int = 0
    @State var playerScore:Int = 0
   
    var body: some View {

        ZStack{
            
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                Image("logo")

                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    //Generate Random Number
                    let playerRand:Int = Int.random(in: 3...14)
                    let cpuRand:Int = Int.random(in: 3...14)
                    
                    //update cards
                    cpuCard = "card" + String(cpuRand)
                    playerCard = "card" + String(playerRand)
                    
                    //Add Score to Player and CPU
                    //cpuScore += 1
                    //playerScore += 1
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if playerRand == cpuRand {
                        playerScore += 0
                        cpuScore += 0
                    } else {
                        cpuScore += 1
                    }
                } label: {
                    Image("dealbutton")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(Color.white)

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
