//
//  ContentView.swift
//  Slot Machine
//
//  Created by Zdenko Čepan on 06.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 5) {
                // HEADER
                LogoView()
                
                Spacer()
                
                // SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    } // HSTACK
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                    } // HSTACK
                    .modifier(ScoreContainerModifier())
                } // HSTACK
                
                // SLOTMACHINE
                VStack(alignment: .center, spacing: 0) {
                    ZStack {
                        RealView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        ZStack {
                            RealView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        ZStack {
                            RealView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    } // HSTACK
                    .frame(maxWidth: 500)
                    
                    Button(action: {
                        print("Spin the reels")
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                } // VSTACK
                .layoutPriority(2)
                
                // FOOTER
                HStack {
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            print("Bet 20 coins")
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                    } // HSTACK
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            print("Bet 10 coins")
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundStyle(.yellow)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    } // HSTACK
                } // HSTACK
                
                Spacer()
            } // VSTACK
            .overlay(
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                Button(action: {
                    print("Info View")
                }) {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
        } // ZSTACK
    }
}

#Preview {
    ContentView()
}
