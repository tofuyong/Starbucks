//
//  RewardsTileViewController.swift
//  Starbucks
//
//  Created by Andrea Yong on 29/12/23.
//

import UIKit

class RewardTileViewController: UIViewController {
    
    let rewardTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardTileView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardTileView)
        
        NSLayoutConstraint.activate([
            rewardTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



