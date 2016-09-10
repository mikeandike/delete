//
//  ViewController.swift
//  DELETE2
//
//  Created by Michael Sacks on 9/10/16.
//  Copyright © 2016 Michael Sacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    @IBAction func playButtonTapped(sender: AnyObject) {
        NetworkController.dataAtURL("http://deckofcardsapi.com/api/deck/new/draw/?count=2") { (data) in
            guard let data = data else { return }
            print(NetworkController.jsonFromData(data))
        }
    }

}

