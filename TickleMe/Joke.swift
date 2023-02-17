//
//  Joke.swift
//  TickleMe
//
//  Created by James Penny on 06/02/2023.
//

import Foundation

struct Joke: Codable, Identifiable {
    let id = UUID()
    var joke: String
}

class Api : ObservableObject{
    @Published var jokes = [Joke]()

    func loadData(limit: Int, completion:@escaping ([Joke]) -> ()) {
        let url = URL(string: "https://api.api-ninjas.com/v1/dadjokes?limit="+String(limit))!
        var request = URLRequest(url: url)
        request.setValue("0Rzx34mN+oPvjXnJFFuB3Q==AnmYCust1NLLgnAU", forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let jokes = try! JSONDecoder().decode([Joke].self, from: data!)
            DispatchQueue.main.async {
                completion(jokes)
            }
        }.resume()
    }
}

