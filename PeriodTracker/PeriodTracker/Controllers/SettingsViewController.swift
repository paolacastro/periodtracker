//
//  SettingsViewController.swift
//  PeriodTracker
//
//  Created by Paola Castro on 6/2/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        view.backgroundColor = .white
        
        [avatarBackgroundView, avatar].forEach { (v) in
            self.view.addSubview(v)
        }
        
        avatarBackgroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, right: view.safeAreaLayoutGuide.trailingAnchor, size: CGSize(width: 0, height: 250))
        avatar.centerYAnchor.constraint(equalTo: avatarBackgroundView.centerYAnchor).isActive = true
        avatar.centerXAnchor.constraint(equalTo: avatarBackgroundView.centerXAnchor).isActive = true
    }
    
    let avatarBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    let avatar: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.fill")
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.layer.cornerRadius = 100
        return view
    }()
}


