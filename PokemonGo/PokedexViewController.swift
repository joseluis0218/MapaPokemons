//
//  PokedexViewController.swift
//  PokemonGo
//
//  Created by Jose Luis Cristobal on 17/05/19.
//  Copyright © 2019 Jose Luis Cristobal. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pokemonsAtrapados:[Pokemon] = []
    var pokemonsNoAtrapadas:[Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func mapTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
