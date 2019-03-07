//
//  HomeViewController.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 2/4/19.
//  Copyright © 2019 Jair Pinedo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// TODO: Implement rx in this section
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Lifetime"
        case 1:
            return "Seasson 7"
        case 2:
            return "Season 6"
        default:
            return ""
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: Find an other way to implement this, maybe with a factory of nibs
        let nib = UINib(nibName: LifetimeCell.idetifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LifetimeCell.idetifier)
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: LifetimeCell.idetifier) as?  LifetimeCell else {
            fatalError("The dequeued cell is not an instance of LifeTimeCell")
        }
        
        return cell
        
    }
    
}
