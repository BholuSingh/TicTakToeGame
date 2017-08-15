//
//  GameModal.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 14/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class GameModal: NSObject {
    
    /// Cases To win the Game
    var gameMatchDict = [
        "matchOne":     [0,1,2],
        "matchTwo":     [0,3,6],
        "matchThree":   [0,4,8],
        "matchFour":    [1,4,7],
        "matchFive":    [2,5,8],
        "matchSix":     [2,4,6],
        "matchSeven":   [3,4,5],
        "matchEight":   [6,7,8]
    ]
    
    
    // MARK: - Variable Decleration -
    var cellsDonePika = [Int]()                     // cells filled by pick
    var cellsDonePsy = [Int]()                      // cells filled by Psy
    
}
