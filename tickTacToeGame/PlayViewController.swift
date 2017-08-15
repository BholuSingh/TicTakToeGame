//
//  PlayViewController.swift
//  tickTacToeGame
//
//  Created by Rahul Sharma on 13/08/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    // MARK: - Outlet -
    // Button
    @IBOutlet weak var playButton: UIButton!
    // Modal Object
    @IBOutlet var playModal: PlayModal!
    
    // MARK: - Default Class Methods -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }
    override func viewWillAppear(_ animated: Bool) {
        playModal.animateButton(playButton: playButton)             // PlayModal.swift
    }
    
    // MARK: - Action Methods -
    @IBAction func playAction(_ sender: Any) {
     
    }


}
