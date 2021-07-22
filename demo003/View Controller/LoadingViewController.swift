//
//  LoadingViewController.swift
//  demo003
//
//  Created by lean on 2021/7/14.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        let loadingLabel = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2+36, width: UIScreen.main.bounds.width, height: 30))
        loadingLabel.font = UIFont.boldSystemFont(ofSize: 15)
        loadingLabel.textColor = .white
        loadingLabel.textAlignment = .center
        loadingLabel.text = "LOADING"
        view.addSubview(loadingLabel)
        
        let imageView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width-80)/2, y: (UIScreen.main.bounds.height-80)/2, width: 80, height: 80))
        view.addSubview(imageView)
        guard let data = NSDataAsset(name: "loading")?.data else {
            return
        }
        let cfData = data as CFData
        CGAnimateImageDataWithBlock(cfData, nil) { (_, cgImage, _) in
            imageView.image = UIImage(cgImage: cgImage)
        }
    }

}
