//
//  HomeControllerExtension.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/24/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import UIKit

extension HomeDataSourseController { //with the same name as the Controller
    
    func setupNavigationBarItems() {
        setupRemainigNavItems()
        setupLeftNavItem()
        setupRightNavITems()
    }
    
    func setupRemainigNavItems(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "twitter"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //not having line above navigation bar
        //view to make the nav bar prettier
        let navBarSepView = UIView()
        navBarSepView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSepView)
        navBarSepView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0,widthConstant: 0, heightConstant: 0.5)
    }
    
    func setupLeftNavItem(){
        let followeBtn = UIButton(type: .system)
        followeBtn.setImage(#imageLiteral(resourceName: "follow1").withRenderingMode(.alwaysOriginal), for: .normal)
        followeBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followeBtn)
    }
    
    func setupRightNavITems() {
        let searchBtn = UIButton(type: .system)
        searchBtn.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeBtn = UIButton(type: .system)
        composeBtn.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeBtn.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //to be clear color
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchBtn), UIBarButtonItem(customView: composeBtn)]
    }
}
