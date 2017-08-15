//
//  GameModalView.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 13/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class GameModalView: NSObject {
    
    @IBOutlet weak var gameModal: GameModal!

    var winner: Bool!                               // Winner status
    
       
    /// Game Logic
    ///
    /// - Parameter cellDone: cells completed by current playing user
    func check(cellDone:[Int]) {
        if cellDone.count >= 3 {
            for (kind , numbers) in gameModal.gameMatchDict{
                print(kind , numbers)
                var k = 0
                for number in numbers {
                    for i in cellDone {
                        let compare = i
                        if compare == number{
                            k += 1
                            break
                        }
                    }
                }
                if k == 3 {
                    winner = true
                    gameModal.cellsDonePika.removeAll()
                    gameModal.cellsDonePsy.removeAll()
                    break
                }else {
                    winner = false
                }
            }
        }else {
            winner = false
        }
    }
    
    /// Check If Button Already Clicked
    ///
    /// - Parameter tag: button clicked tag
    /// - Returns: return if already clicked
    func checkButtonClicked(tag: Int) -> Bool {
        for i in  gameModal.cellsDonePika{
            if i == tag{
                return false
            }
        }
        for i in  gameModal.cellsDonePsy{
            if i == tag{
                return false
            }
        }
        return true
    }
    
    
}






