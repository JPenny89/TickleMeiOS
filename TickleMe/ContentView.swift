//
//  ContentView.swift
//  TickleMe
//
//  Created by James Penny on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var jokes = [Joke]()
    @State var limit = 1
    
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
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading) {
                    List {
                        ForEach(jokes) { joke in
//                           Spacer()
                            Text(joke.joke)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            .minimumScaleFactor(0.01)
                            .listRowBackground(Color.blue)
                        }
                    }
                    .padding(10.0)
                    HStack {
                        Spacer()
                        Button(action: getJoke) {
                            Text("Tickle Me")
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.blue, lineWidth: 5)
                                )
                        }
                        .font(.title2)
                        .foregroundColor(Color.blue)
                        Spacer()
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
