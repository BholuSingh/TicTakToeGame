//
//  GameUIViewController.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 13/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class GameUIViewController: UIViewController {
    
    // MARK: - Outlets -
    // Buttons
    @IBOutlet weak var pikachuButton: UIButton!
    @IBOutlet weak var psyduckButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    // Buttons Collection For Game
    @IBOutlet var gameButton: [UIButton]!
    // Modal Object Outlet
    @IBOutlet var gameModalView: GameModalView!
    // View
    @IBOutlet weak var gameView: UIView!
    
    // MARK: - Default Class Method -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameModalView.initialAnimate(pikachuB: pikachuButton, psyduckB: psyduckButton, clearButton: clearButton, gameButton: gameButton, gameView: gameView)       // GameModalView.swift
        pikachuButton.isEnabled = true
        psyduckButton.isEnabled = false
    }
    
    // MARK: - Action Methods Method -
    
    @IBAction func clearAction(_ sender: Any) {
        gameModalView.initialAnimate(pikachuB: pikachuButton, psyduckB: psyduckButton, clearButton: clearButton, gameButton: gameButton, gameView: gameView)         // GameModalView.swift
    }
    
    @IBAction func gameAction(_ sender: Any) {
        gameButtonClicked(sender)
    }
    
    // MARK: - Coustom Methods -
    
    /// Allert For the winner
    ///
    /// - Parameter winnerName: passing winner name
    func alert(tittle: String , winnerName: String) {
        let alert = UIAlertController(title: tittle, message: "\(winnerName)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// gameAction UI Update
    ///
    /// - Parameter sender: button Action
    func gameButtonClicked(_ sender: Any)  {
        let check = gameModalView.checkButtonClicked(tag: (sender as AnyObject).tag)      // GameModalView.swift
        if check {
            if pikachuButton.isEnabled {
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "Cross"), for: .normal)
            }else {
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "Circle"), for: .normal)
            }
            let winner = gameModalView.animateClickedbutton(tag: (sender as AnyObject).tag, gameView: gameView, bool: pikachuButton.isEnabled )              //GameModalView.swift
            if winner == 1 {
                if pikachuButton.isEnabled {
                    alert(tittle: "Winner" ,winnerName: "Winner is Pika Pika")
                }else {
                    alert(tittle: "Winner" ,winnerName: "Winner is Quack Quack")
                }
                gameModalView.initialAnimate(pikachuB: pikachuButton, psyduckB: psyduckButton, clearButton: clearButton, gameButton: gameButton, gameView: gameView)   // GameModalView.swift
            }else {
                if winner == 2 {
                    alert(tittle: "Draw" ,winnerName: "No One Winns!")
                    gameModalView.initialAnimate(pikachuB: pikachuButton, psyduckB: psyduckButton, clearButton: clearButton, gameButton: gameButton, gameView: gameView)   // GameModalView.swift
                }
                if pikachuButton.isEnabled {
                    pikachuButton.isEnabled = false
                    psyduckButton.isEnabled = true
                }else {
                    pikachuButton.isEnabled = true
                    psyduckButton.isEnabled = false
                }
            }
        }else
        {
            alert(tittle: "Alert" ,winnerName: "Already clicked Sellect Some Different")
        }
    }
    
    
}
