//
//  ViewController.swift
//  AppleDevicesImages
//
//  Created by azinavi on 12/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var titleCollectionView = UILabel()
    
    var collectionView: UICollectionView!
    
    let appleDevicesArray: [AppleDevices] = {
        let macbook = AppleDevices(appleDevicesName: "macbook")
        let airpods = AppleDevices(appleDevicesName: "airpods")
        let iphone = AppleDevices(appleDevicesName: "iphone")
        let appleWatch = AppleDevices(appleDevicesName: "applewatch")
        let desktopComputer = AppleDevices(appleDevicesName: "desktopcomputer")
        let homepod = AppleDevices(appleDevicesName: "homepod.2.fill")
        
        return [macbook, airpods, iphone, appleWatch, desktopComputer, homepod]
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupCollectionView()
        
    }
    
    func setupTitle() {
        self.view.addSubview(titleCollectionView)
        titleCollectionView.frame = CGRect(x: view.center.x - 100, y: 40, width: 200, height: 40)
        titleCollectionView.font = UIFont.systemFont(ofSize: 30)
        titleCollectionView.text = "Apple devices"
        titleCollectionView.textColor = .systemBlue
        view.backgroundColor = .black
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.frame = CGRect(x: 0, y: 100, width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: 200)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AppleDevicesCollectionViewCell.self, forCellWithReuseIdentifier: "AppleDevicesCollectionViewCell")
        collectionView.backgroundColor = .gray
        collectionView.reloadData()
        
        self.view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appleDevicesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleDevicesCollectionViewCell", for: indexPath) as! AppleDevicesCollectionViewCell
        let device = appleDevicesArray[indexPath.row]
        cell.backgroundColor = .systemGray3
        cell.layer.cornerRadius = 20
        cell.configure(appleDevice: device)
        
        return cell
    }
}

