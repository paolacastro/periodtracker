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
        
        [avatarBackgroundView, avatar, cell, periodLengthTitle, periodLengthValue].forEach { (v) in
            self.view.addSubview(v)
        }
        
        avatarBackgroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, right: view.safeAreaLayoutGuide.trailingAnchor, size: CGSize(width: 0, height: 250))
        avatar.centerYAnchor.constraint(equalTo: avatarBackgroundView.centerYAnchor).isActive = true
        avatar.centerXAnchor.constraint(equalTo: avatarBackgroundView.centerXAnchor).isActive = true
        
        cell.anchor(top: avatarBackgroundView.bottomAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, right: view.safeAreaLayoutGuide.trailingAnchor, size: CGSize(width: 0, height: 60), padding: .init(top: 60.0, left: 0.0, bottom: 0.0, right: 0.0) )
       
        periodLengthTitle.anchor(top: nil, left: cell.leadingAnchor, bottom: nil, right: nil, size: .zero, padding: .init(top: 0.0, left: 15.0, bottom: 0.0, right: 0.0))
        periodLengthTitle.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        periodLengthValue.anchor(top: nil, left: nil, bottom: nil, right: cell.trailingAnchor, size: CGSize(width: 60, height: 60), padding: .init(top: 0.0, left: 0.0, bottom: 0.0, right: -15))
        periodLengthValue.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
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
    
    let cell: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    let periodLengthTitle: UILabel = {
        let view = UILabel()
        view.text = "Period Length"
        return view
    }()
    
    let periodLengthValue: UILabel = {
        let view = UILabel()
        view.text = "5"
        view.textAlignment = .right
        return view
    }()
}


