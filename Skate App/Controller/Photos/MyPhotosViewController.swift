//
//  MyPhotosViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 10/03/2022.
//

import UIKit

class MyPhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myPhotos : [UserPost] = Datas.shared.testPosts
    private let goToLoginIdentifier = "goToLoginFromPhotos"
    private let detailedPhotoSeg = "showDetailedPhoto"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        
    }
    //------------------- UI ----------------------//
    private func setupUI() {
        setupCollectionViewFlow()
    }
    
    //collection view setup
    func setupCollectionViewFlow() {
        let flow = UICollectionViewFlowLayout()
        let height  = collectionView.frame.height/3
        let width = (collectionView.frame.width/3) - 8
        collectionView?.layoutMargins = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        flow.itemSize = CGSize(width: width, height: height-50)
        collectionView.collectionViewLayout = flow
    }
    
    //------------------- Actions ----------------------//
    private func setupActions() {
        setupCollection()
        //verification()
    }
    
    // verify is there is a user
    private func verification() {
        AuthManager.shared.verifyIfLoggedIn { exist in
            if !exist {
                self.performSegue(withIdentifier: self.goToLoginIdentifier, sender: self)
            }
        }
    }
    
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailedPhotoSeg {
            if let next = segue.destination as? DetailedPhotoViewController {
                let post = sender as! UserPost
                next.post = post
            }
        }
    }
    

}

//------------------- Extension ----------------------//
extension MyPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myPhotos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < myPhotos.count {
            let photosItem = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
            photosItem.configure(myPhotos[indexPath.row].postImgName)
            return photosItem
        } else {
            let addItem = collectionView.dequeueReusableCell(withReuseIdentifier: AddPhotoCollectionViewCell.identifier, for: indexPath) as! AddPhotoCollectionViewCell
            return addItem
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == myPhotos.count {
            //did selected the add button
        } else {
            //did tap a photo
            let currentPost = myPhotos[indexPath.row]
            print(currentPost)
            performSegue(withIdentifier: detailedPhotoSeg, sender: currentPost)
        }
    }
    
}
