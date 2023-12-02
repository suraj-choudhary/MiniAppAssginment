//
//  FlyHomeViewModel.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 27/11/23.
//

import Foundation
import UIKit

class FlyHomeViewModel: NSObject {
    
    let model = PostModel(imageUrls: "suraj", postCreationDate: "kumar", userId: 2, postDescription: "afjsbfjbsjdb")
    func createPost(token: String) {
        FireBaseDataBaseManager.shared.createReference(token: token, model: model)
    }
    
    
}
extension FlyHomeViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionCell.identifier, for: indexPath) as? FeedCollectionCell else {
            fatalError("")
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: height)
    }
}
