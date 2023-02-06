//
//  ContentView.swift
//  TickleMe
//
//  Created by James Penny on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var jokes = [Joke]()
    @State var limit: String = ""
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    func getJoke() {
        Api().loadData(limit: self.limit) { (jokes) in
            self.jokes = jokes
        }
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading) {
                    VStack {
                        TextField(
                            "Insert limit",
                            text: $limit
                        )
                        .multilineTextAlignment(.center)
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .padding()

                        HStack {
                            Spacer()
                            Button(action: getJoke) {
                                Text("Tickle Me")
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .font(.title2)
                            .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding(30.0)
                    List {
                        ForEach(jokes) { joke in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Joke 1 = \(joke.joke)")
                                        .font(.title)
                                        .padding(.bottom)
                                                                        Text("Joke 2 = \(joke.id) ")
                                                                            .font(.title2)
                                }
                                .minimumScaleFactor(0.01)
                                Spacer()
                                                                VStack(alignment: .trailing) {
                                                                    Text("Joke 3 = \(joke.joke)")
                                                                }
                                    .minimumScaleFactor(0.01)
                                    .font(.system(size: 18.0))
                            }
                            .listRowBackground(Color.clear)
                            .foregroundColor(.black)
                            .padding()
                        }
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
