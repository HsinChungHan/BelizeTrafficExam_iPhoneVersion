//
//  Example1ViewController.swift
//  LottieAnimationStartedProject
//
//  Created by 辛忠翰 on 13/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import Lottie
enum CellID: String{
    case example1CellID = "Example1CellID"
    case instructionCellID = "InstructionCellID"
    case userCellID = "UserCellID"
    case projectInstroductionCellID = "ProjectInstroductionCellID"
}



class Example1ViewController: UIViewController {
    var currentIndexPath: IndexPath? = IndexPath(item: 0, section: 0)
    let trafficSigns = TrafficSignal.getTrafficSigns()
    let user = BelizeUser.init()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = false
        return cv
    }()
    fileprivate func registerCell(){
        collectionView.register(Example1Cell.self, forCellWithReuseIdentifier: CellID.example1CellID.rawValue)
        collectionView.register(InstructionCell.self, forCellWithReuseIdentifier: CellID.instructionCellID.rawValue)
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: CellID.userCellID.rawValue)
        collectionView.register(ProjectIntroductionCell.self, forCellWithReuseIdentifier: CellID.projectInstroductionCellID.rawValue)
    }
    
    fileprivate func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
    
    fileprivate func setupNavigationItem(){
        let rightBarButtonItem1 = UIBarButtonItem(image: #imageLiteral(resourceName: "ICDF").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerCell()
        setupCollectionView()
    }
}






