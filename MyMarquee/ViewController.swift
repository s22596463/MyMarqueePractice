//
//  ViewController.swift
//  MyMarquee
//
//  Created by 謝宛軒 on 2020/12/17.
//  Copyright © 2020 謝宛軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var content = ["車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕","恭喜發財！我成功ㄌ！","哈！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let orangeColor = UIColor(red: 255/255, green: 158/255, blue: 72/255, alpha: 1)
        let frame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.size.width, height: 68)
        let marqueeAttribute = MarqueeAttribute(scrollDirection: .up, marqueeStyle: .normal, timeInterval: 1, imageViewWidth: 40, imageViewHeight: 70, contentWidth: Double(UIScreen.main.bounds.width-40), contentHeight: 70)
        let contentAttribute = ContentViewAttribute(textColor: orangeColor, numberOfLines: 2, font: UIFont.systemFont(ofSize: 14, weight: .medium), textAlignment: .left, lineBreakMode: .byTruncatingTail, leftSpacing: 10, rightSpacing: 16, topSpacing: 0, bottomSpacing: 0)
        let mar = MyMarquee(frame: frame, content: content, marqueeAttribute: marqueeAttribute, contentAttribute: contentAttribute)
        self.view.addSubview(mar)
        mar.backgroundColor = orangeColor.withAlphaComponent(0.1)
        mar.loudspeakerImage.image = UIImage.reSizeImage(named: "iconAnnouncement", targetSize:CGSize(width: 24, height: 24))
        mar.loudspeakerImage.tintColor = orangeColor
    }
    
}

extension UIImage {
    class func reSizeImage(named: String, targetSize:CGSize) -> UIImage? {
        if let image = UIImage.init(named: named) {
            let size = image.size
            let widthRatio  = targetSize.width  / size.width
            let heightRatio = targetSize.height / size.height

            var newSize: CGSize
            if(widthRatio > heightRatio) {
                newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
            } else {
                newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
            }
            let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            image.draw(in: rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage
        }else{
            return nil
        }
    }

}

