//
//  BaseCollectionViewCell.swift
//  demo003
//
//  Created by lean on 2021/7/13.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    var drinkInfo: DrinkData?
    
    var innerView = UIView()
    var nameZHLabel = UILabel()
    var nameENLabel = UILabel()
    var descriptionLabel = UILabel()
    var imageView = UIImageView()
    var sizeLabel = UILabel()
    var priceLabel = UILabel()
    var selectBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        innerView.frame.size = CGSize(width: self.frame.size.width-36, height: self.frame.size.height)
        innerView.frame.origin = CGPoint(x: (self.frame.size.width-innerView.frame.size.width)/2, y: 0)
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 20
        innerView.layer.borderWidth = 2
        innerView.layer.borderColor = UIColor(named: "DeepBlueColor")?.cgColor
        innerView.clipsToBounds = true
        self.addSubview(innerView)

        nameZHLabel.frame = CGRect(x: 24, y: 24, width: innerView.frame.size.width-40, height: 32)
        nameZHLabel.textColor = UIColor(named: "DeepBlueColor")
        nameZHLabel.font = UIFont.boldSystemFont(ofSize: 28)
        innerView.addSubview(nameZHLabel)
        
        nameENLabel.frame = CGRect(x: 24, y: 58, width: innerView.frame.size.width-48, height: 18)
        nameENLabel.textColor = UIColor(named: "DeepBlueColor")
        nameENLabel.text = "Signature Black Tea"
        nameENLabel.font = UIFont.systemFont(ofSize: 15)
        nameENLabel.alpha = 0.7
        innerView.addSubview(nameENLabel)
        
        descriptionLabel.frame = CGRect(x: 24, y: 90, width: innerView.frame.size.width-76, height: 36)
        descriptionLabel.textColor = UIColor(named: "DeepBlueColor")
        descriptionLabel.text = "解炸物/燒烤肉類油膩，茶味濃郁帶果香"
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.alpha = 0.8
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 2
        innerView.addSubview(descriptionLabel)
        
        imageView.frame = CGRect(x: 24, y: 132, width: innerView.frame.size.width-48, height: innerView.frame.size.width-48)
        // 預設圖片
        imageView.image = UIImage(named: "熟成紅茶")
        innerView.addSubview(imageView)
        
        sizeLabel.frame = CGRect(x: 24, y: 324, width: innerView.frame.size.width-48, height: 14)
        sizeLabel.textColor = UIColor(named: "DeepBlueColor")
        sizeLabel.text = "中杯"
        sizeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        innerView.addSubview(sizeLabel)
        
        priceLabel.frame = CGRect(x: 24, y: 340, width: innerView.frame.size.width-32, height: 33)
        priceLabel.textColor = UIColor(named: "DeepBlueColor")
        priceLabel.text = "$25"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 28)
        innerView.addSubview(priceLabel)
        
        selectBtn.frame = CGRect(x: 156, y: 340, width: 68, height: 30)
        selectBtn.backgroundColor = UIColor(named: "LightYellowColor")
        selectBtn.isEnabled = true
        selectBtn.setTitle("我要這個", for: .normal)
        selectBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        selectBtn.titleLabel?.textColor = .white
        selectBtn.layer.cornerRadius = 12
        selectBtn.addTarget(self, action: #selector(selectDrink), for: .touchUpInside)
        innerView.addSubview(selectBtn)
    }
    
    func setValues() {
        if let drinkInfo = drinkInfo {
            nameZHLabel.text = drinkInfo.name_zh.value
            nameENLabel.text = drinkInfo.name_en.value
            descriptionLabel.text = drinkInfo.description.value
            priceLabel.text = "$\(drinkInfo.priceM.value)"
            
            if let urlStr = URL(string: drinkInfo.imageUrl.value) {
                URLSession.shared.dataTask(with: urlStr) { (data, response, error) in
                    if let data = data {
                        DispatchQueue.main.async {
                            // 得到圖片
                            self.imageView.image = UIImage(data: data)
                            allDrinkImages[drinkInfo.name_zh.value] = UIImage(data: data)
                        }
                    }
                }.resume()
            }
            
        }
    }
    
    // 流水布局，因為控件會实實時變化，需要在這裡計算frame,如果控件大小固定，推薦直接在init方法裡面算
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // 選擇該飲料按鈕
    @objc func selectDrink() {
        if let drinkInfo = drinkInfo {
            selectedDrink = drinkInfo
            order.drinkName = selectedDrink?.name_zh.value
        }
        NotificationCenter.default.post(name: NSNotification.Name("toDrinkDetail"), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
