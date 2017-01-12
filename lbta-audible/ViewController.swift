//
//  ViewController.swift
//  lbta-audible
//
//  Created by Vina Melody on 7/1/17.
//  Copyright © 2017 Vina Rianti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.purple
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true // for the snapping effect
        return cv
    }()
    
    let cellId = "cellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book.\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        
        // need to use autolayout
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        cell.page = pages[indexPath.item]
        cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

