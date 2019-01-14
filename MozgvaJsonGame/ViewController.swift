//
//  ViewController.swift
//  MozgvaJsonGame
//
//  Created by Sergey Ryabushko on 14/01/2019.
//  Copyright © 2019 Sergey Ryabushko. All rights reserved.
//

import UIKit

struct Games : Decodable {
    let id : Int
    let GAME_NAME : String
    let DATE : String
    let TIME : String
    let FREE : Bool
    let PRICE : Int
    let PLACE : String
    let ADDRESS : String
    let free_places_team : Int
    let free_places_person : Int
    let game_type : String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://mozgva.com/api/v1/games/schedule?id=1"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in

            guard let data = data else { return }
            
            do {
                let games = try
                    JSONDecoder().decode([Games].self, from: data) //sozdaiom massiv iz igr
                print(games.count) //vivodim massiv
                let gameCount = games.count
                var firstGame = 0

                while firstGame <= gameCount - 1 {
                    let GameName = games[firstGame]
                    print(GameName.GAME_NAME)
                    firstGame = firstGame + 1
                }
                
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
        


    }


}

