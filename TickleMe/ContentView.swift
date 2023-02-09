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
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading) {

                    List {
                        ForEach(jokes) { joke in
                            
                            Text(joke.joke)
                                .font(.title)
                                .padding(.bottom)
                            .minimumScaleFactor(0.01)
                            Spacer()
                                .minimumScaleFactor(0.01)
                                .font(.system(size: 18.0))
                            .listRowBackground(Color.clear)
                            .foregroundColor(.black)
                            .padding()
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
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        .font(.title2)
                        .foregroundColor(Color.white)
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
