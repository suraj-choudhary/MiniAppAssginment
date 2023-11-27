
//
//  Extension.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//
import UIKit

/// Description
class PageVC: UIViewController {
    var page: Pages
    
    /// Description
    /// - Parameter page: page description
    init(with page: Pages) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Description
    ///
    /// - Parameter coder: coder description
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Description
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedImage)
        feedImage.addSubViews(userImage,
                              usernameLbl,
                              postCreatedDateLbl,
                              discriptionLbl)
        addConstrainst()
    }
    
    private let userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5

        image.image = UIImage(named: "image")
        return image
    }()
    
    private let usernameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "suraj kumar"
        
        return label
    }()
    
    private let postCreatedDateLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20/10/2023"

        return label
    }()
    
    private let discriptionLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.text = "This is my favorite post This is my favorite post"
        return label
    }()
    
    
    /// Description
    private let feedImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        image.layer.masksToBounds = true
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        image.layer.cornerRadius = 50
        return image
    }()
    
    func addConstrainst() {
        NSLayoutConstraint.activate([
            feedImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            feedImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            feedImage.topAnchor.constraint(equalTo: view.topAnchor),
            feedImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            userImage.bottomAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: -30),
            userImage.leftAnchor.constraint(equalTo: feedImage.leftAnchor, constant: 10),
            userImage.heightAnchor.constraint(equalToConstant: 54),
            userImage.widthAnchor.constraint(equalToConstant: 64),
            
            usernameLbl.topAnchor.constraint(equalTo: userImage.topAnchor, constant: 0),
            usernameLbl.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10),
            usernameLbl.widthAnchor.constraint(equalToConstant: 100),
            usernameLbl.heightAnchor.constraint(equalToConstant: 14),
            
            postCreatedDateLbl.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor, constant: 5),
            postCreatedDateLbl.leadingAnchor.constraint(equalTo: usernameLbl.leadingAnchor),
            postCreatedDateLbl.widthAnchor.constraint(equalToConstant: 100),
            postCreatedDateLbl.heightAnchor.constraint(equalToConstant: 12),
            
            
            discriptionLbl.leadingAnchor.constraint(equalTo: postCreatedDateLbl.leadingAnchor),
            
            discriptionLbl.topAnchor.constraint(equalTo: postCreatedDateLbl.bottomAnchor, constant: 5),
            
            discriptionLbl.trailingAnchor.constraint(equalTo: feedImage.trailingAnchor, constant: 10),
            discriptionLbl.bottomAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: 10)
            
            
        ])
    }
}
