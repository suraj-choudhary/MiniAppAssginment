//
//  HomeView.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 27/11/23.
//

import UIKit

class HomeView: UIView {
   
    var flyHomeViewModel = FlyHomeViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGroupedBackground
        addSubview(collectionView)
        collectionView.delegate = flyHomeViewModel
        collectionView.dataSource = flyHomeViewModel

        setupCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.backgroundColor = .systemGroupedBackground
        
        colletionView.register(FeedCollectionCell.self, forCellWithReuseIdentifier: FeedCollectionCell.identifier)
        
        return colletionView
    }()
    
    
   private func setupCollectionView() {
       NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: self.topAnchor),
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
       
       ])
    }
    
}


