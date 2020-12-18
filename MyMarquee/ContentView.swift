//
//  ContentView.swift
//  MyMarquee
//
//  Created by 謝宛軒 on 2020/12/17.
//  Copyright © 2020 謝宛軒. All rights reserved.
//

import Foundation
import UIKit

struct ContentViewAttribute {
    var textColor: UIColor = UIColor.black
    var numberOfLines: Int = 2
    var font: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    var textAlignment: NSTextAlignment = .left
    var lineBreakMode: NSLineBreakMode = .byTruncatingTail
    var leftSpacing:Double = 10
    var rightSpacing:Double  = 16
    var topSpacing:Double  = 0
    var bottomSpacing:Double  = 0
}

class ContentView: UIView{
    
    //var attributes: ContentViewAttribute = ContentViewAttribute()
    var textColor: UIColor = UIColor.black
    var numberOfLines: Int = 2
    var font: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    var textAlignment: NSTextAlignment = .left
    var lineBreakMode: NSLineBreakMode = .byTruncatingTail
    var leftSpacing:Double = 10
    var rightSpacing:Double  = 16
    var topSpacing:Double  = 0
    var bottomSpacing:Double  = 0
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: leftSpacing, y: topSpacing, width: Double(self.bounds.width)-leftSpacing-rightSpacing, height: Double(self.bounds.height)-topSpacing-bottomSpacing)
        return label
    }()
    
    init (frame: CGRect, contentViewAttribute: ContentViewAttribute){
        super.init(frame: frame)
        setupAttribute(contentViewAttribute: contentViewAttribute)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAttribute(contentViewAttribute: ContentViewAttribute){
        self.textColor = contentViewAttribute.textColor
        self.numberOfLines = contentViewAttribute.numberOfLines
        self.font = contentViewAttribute.font
        self.textAlignment = contentViewAttribute.textAlignment
        self.lineBreakMode = contentViewAttribute.lineBreakMode
        self.leftSpacing = contentViewAttribute.leftSpacing
        self.rightSpacing = contentViewAttribute.rightSpacing
        self.topSpacing = contentViewAttribute.topSpacing
        self.bottomSpacing = contentViewAttribute.bottomSpacing
    }
    
    
    func setupUI(){
        self.layer.masksToBounds = true
        self.addSubview(contentLabel)
    }
    
    func setup(text:String){
        self.contentLabel.text = text
        self.contentLabel.textColor = textColor
        self.contentLabel.font = font
        self.contentLabel.numberOfLines = numberOfLines
        self.contentLabel.textAlignment = textAlignment
        self.contentLabel.lineBreakMode = lineBreakMode
    }
    
    
    
}

