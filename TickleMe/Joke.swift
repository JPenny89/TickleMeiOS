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
//        let limit = limit.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/dadjokes?limit="+String(limit))!
        var request = URLRequest(url: url)
        request.setValue("0Rzx34mN+oPvjXnJFFuB3Q==AnmYCust1NLLgnAU", forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let jokes = try! JSONDecoder().decode([Joke].self, from: data!)
           
            print("Limit = \(limit)")
            print(jokes)
            
            DispatchQueue.main.async {
                completion(jokes)
            }
        }.resume()
        
//        let url = URL(string: "https://api.api-ninjas.com/v1/dadjokes?limit=1")!
//        var request = URLRequest(url: url)
//        request.setValue("0Rzx34mN+oPvjXnJFFuB3Q==AnmYCust1NLLgnAU", forHTTPHeaderField: "X-Api-Key")
//        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
//            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
//            print("jokes = \()")
//        }
//        task.resume()
        
    }
}

