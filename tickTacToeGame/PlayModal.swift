//
//  PlayModal.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 13/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class PlayModal: NSObject {
    
    /// Animation for Button
    ///
    /// - Parameter playButton: button to be animated
    func animateButton(playButton: UIButton) {
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
            playButton.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        })
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
            playButton.transform = .identity
        })
    }
}
