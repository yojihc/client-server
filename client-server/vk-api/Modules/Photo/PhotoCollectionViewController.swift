//
//  PhotoCollectionViewController.swift
//  client-server
//
//  Created by yoji on 23.12.2021.
//

import UIKit
import SDWebImage

//private let reuseIdentifier = "Cell"

final class PhotoCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var imagePhoto: UIImageView!
    
    
    
    
    private var photoAPI = PhotoAPI()
    private var photo: [Photo] = []
    private var size: [Size] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
       //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        photoAPI.getPhoto { [weak self] photo in
            guard let self = self else { return }
            self.photo = photo
            
            self.collectionView.reloadData()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        
        //let photo = photo[indexPath.item].sizes[indexPath.row]
        let photoContainer = photo[indexPath.item]
        let size = photoContainer.sizes.first
        let url = size!.url
        
        //let photoURL = photo.url
        if let url = URL(string: url){

            cell.imagePhoto.sd_setImage(with: url)

        }
    
        return cell
    }
/*
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
