//
//  AnimationModalView.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 15/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import Foundation
import UIKit

extension GameModalView {       // Extended the Modal view for animating Buttons
    
    /// Initiall Animation
    ///
    /// - Parameters:
    ///   - pikachuB: picka image Indicator
    ///   - psyduckB: psy image Indicator
    ///   - clearButton: to clear Data
    ///   - gameButton: game Buttons
    ///   - gameView: Bottom View
    func initialAnimate(pikachuB: UIButton , psyduckB: UIButton , clearButton: UIButton , gameButton: [UIButton]! , gameView: UIView) {
        gameModal.cellsDonePika.removeAll()
        gameModal.cellsDonePsy.removeAll()
        pikachuB.transform = CGAffineTransform(translationX: -500, y: 0)
        psyduckB.transform = CGAffineTransform(translationX: +1000, y: 0)
        clearButton.transform = CGAffineTransform(translationX: 0, y: +400)
        
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
            self.initailGameAnimate(gameView: gameView)
        })
        
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
            pikachuB.transform = .identity
            psyduckB.transform = .identity
            
        }) { (true) in
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                
                self.animateButton(tag: 0, gameView: gameView)
                
            }) { (true) in
                UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                    
                    self.animateButton(tag: 1, gameView: gameView)
                    
                }) { (true) in
                    UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                        
                        self.animateButton(tag: 2, gameView: gameView)
                        
                    }) { (true) in
                        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                            
                            self.animateButton(tag: 3, gameView: gameView)
                            
                        }) { (true) in
                            UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                
                                self.animateButton(tag: 4, gameView: gameView)
                                
                            }) { (true) in
                                UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                    
                                    self.animateButton(tag: 5, gameView: gameView)
                                    
                                }) { (true) in
                                    UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                        
                                        self.animateButton(tag: 6, gameView: gameView)
                                        
                                    }) { (true) in
                                        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                            
                                            self.animateButton(tag: 7, gameView: gameView)
                                            
                                        }) { (true) in
                                            
                                            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                                
                                                self.animateButton(tag: 8, gameView: gameView)
                                                
                                                
                                            }){ (true) in
                                                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                                                    clearButton.transform = .identity
                                                })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    /// Animation on game chance botton clicked
    ///
    /// - Parameters:
    ///   - tag: tag of the button to animate
    ///   - gameView: bottom view of the game
    func animateButton(tag: Int , gameView: UIView) {
        for view in gameView.subviews as [UIView] {
            if let button = view.viewWithTag(tag) as? UIButton {
                button.transform = .identity
            }
        }
    }
    
    
    /// Initiall Animation for game Buttons
    ///
    /// - Parameter gameView: Bottom game View
    func initailGameAnimate(gameView: UIView) {
        let array = ["Cross","Circle"]
        for view in gameView.subviews as [UIView] {
            if let button = view as? UIButton {
                button.transform = CGAffineTransform(scaleX: 0, y: 0)
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                button.setImage(UIImage(named: array[randomIndex]), for: .normal)
                button.alpha = 0.1
            }
        }
    }
    
    
    /// Animating clicked button
    ///
    /// - Parameters:
    ///   - tag: tag of the button
    ///   - gameView: gameView bottom view
    ///   - bool: bool for player
    /// - Returns: returns winner status
    func animateClickedbutton(tag: Int, gameView: UIView , bool: Bool) -> Int{
        
        for view in gameView.subviews as [UIView] {
            if let button = view.viewWithTag(tag) as? UIButton {
                
                UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                    button.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                    if bool {
                        self.gameModal.cellsDonePika.append(tag)
                        self.check(cellDone: self.gameModal.cellsDonePika)
                    }else {
                        self.gameModal.cellsDonePsy.append(tag)
                        self.check(cellDone: self.gameModal.cellsDonePsy)
                    }
                    button.alpha = 1
                })
                UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                    button.transform = .identity
                })
            }
        }
        if winner {
            return 1
        }else {
            if (gameModal.cellsDonePsy.count + gameModal.cellsDonePika.count) == 9 {
                gameModal.cellsDonePika.removeAll()
                gameModal.cellsDonePsy.removeAll()
                return 2
            }else {
                return 0
            }
        }
        
    }
    

    
}
