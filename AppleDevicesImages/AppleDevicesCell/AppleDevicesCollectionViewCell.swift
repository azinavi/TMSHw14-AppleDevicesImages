//
//  AppleDevicesCollectionViewCell.swift
//  AppleDevicesImages
//
//  Created by azinavi on 12/1/24.
//

import UIKit

class AppleDevicesCollectionViewCell: UICollectionViewCell {
    
    var backView = UIView()
    var deviceImage = UIImageView()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
      }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(appleDevice: AppleDevices) {
        backView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        deviceImage.frame = CGRect(x: 10, y: 10, width: 120, height: 120)
        deviceImage.contentMode = .scaleAspectFit
        
        let imageName = appleDevice.appleDevicesName
        deviceImage.image = UIImage(systemName: imageName)
        
        addSubview(backView)
        backView.addSubview(deviceImage)
    }
}
