//
//  FeedCollectionCell.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 28/11/23.
//

import UIKit
/// Description
class FeedCollectionCell: UICollectionViewCell  {
    private var pages: [Pages] = Pages.allCases
    private var currentIndex: Int = 0
    
    static let identifier = "FeedCollectionCell"
    var pageController: UIPageViewController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupPageController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupPageController() {
        
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.frame.width,height: self.frame.height)
        
        self.contentView.addSubview(self.pageController!.view)
        
        let initialVC = PageVC(with: pages[0])
        
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        
        
    }
}


extension FeedCollectionCell: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? PageVC else {
            return nil
        }
        
        var index = currentVC.page.index
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        let vc: PageVC = PageVC(with: pages[index])
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? PageVC else {
            return nil
        }
        
        var index = currentVC.page.index
        
        if index >= self.pages.count - 1 {
            return nil
        }
        
        index += 1
        
        let vc: PageVC = PageVC(with: pages[index])
        
        return vc
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
}

