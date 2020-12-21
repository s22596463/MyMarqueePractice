//
//  MyMarquee.swift
//  MyMarquee
//
//  Created by 謝宛軒 on 2020/12/17.
//  Copyright © 2020 謝宛軒. All rights reserved.
//

import Foundation
import UIKit

struct MarqueeAttribute{
    var scrollDirection: MyMarquee.ScrollDirection = .up
    var marqueeStyle: MyMarquee.MarqueeStyle = .normal
    var timeInterval:Double = 3
    var imageViewWidth:Double = 40
    var imageViewHeight:Double = 70
    var contentWidth:Double = 10
    var contentHeight:Double = 70
}

class MyMarquee: UIView, UIScrollViewDelegate{
    
    enum ScrollDirection{
        case up
        case down
        //case left
        //case right
    }
    
    enum MarqueeStyle{
        case normal
        case noImage
        //case custom
    }
    
    var scrollDirection: ScrollDirection = .up
    var marqueeStyle: MarqueeStyle = .normal
    //var marqueeAttribute: MarqueeAttribute = MarqueeAttribute()
    var contentAttribute: ContentViewAttribute = ContentViewAttribute()
    
    var timer: Timer?
    var timeInterval:Double = 3 {
        didSet{
            if timeInterval <= 1 { timeInterval = 1 }
        }
    }
    var content: [String] = []
    var index = 1
    var imageViewWidth:Double = 40
    var imageViewHeight: Double = 70
    lazy var contentHeight:Double = 70
    lazy var contentWidth:Double = 50
    
    lazy var loudspeakerImage: UIImageView = {
        let imgView = UIImageView()
        imgView.frame = CGRect(x: 0, y: 0, width: imageViewWidth, height: imageViewHeight)
        imgView.contentMode = .right
        return imgView
    }()
    
    lazy var myScrollView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    deinit {
        if timer != nil {
            timer?.invalidate()
        }
        timer = nil
    }
    
    public init(frame: CGRect,content: [String], marqueeAttribute: MarqueeAttribute, contentAttribute: ContentViewAttribute) {
        super.init(frame: frame)
        self.content = content
        self.contentAttribute = contentAttribute
        setupAttribute(marqueeAttribute:marqueeAttribute)
        setupUI()
        startTimer()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAttribute(marqueeAttribute: MarqueeAttribute){
        self.scrollDirection = marqueeAttribute.scrollDirection
        self.marqueeStyle = marqueeAttribute.marqueeStyle
        self.timeInterval = marqueeAttribute.timeInterval
        self.imageViewWidth = marqueeAttribute.imageViewWidth
        self.imageViewHeight = marqueeAttribute.imageViewHeight
        self.contentWidth = marqueeAttribute.contentWidth
        self.contentHeight = marqueeAttribute.contentHeight
    }
    
    func setupUI(){
        self.addSubview(myScrollView)
        setupScrollView()
        setupContentView()
        switch marqueeStyle {
        case .normal:
            self.addSubview(loudspeakerImage)
        case .noImage:
            imageViewWidth = 0
            break
            
        }
    }
    
    func setupScrollView(){
        myScrollView.frame = CGRect(x: loudspeakerImage.bounds.width, y: 0, width: CGFloat(contentWidth), height: CGFloat(contentHeight))
        myScrollView.contentSize = CGSize(width: CGFloat(contentWidth), height: CGFloat(contentHeight)*CGFloat(content.count+2))
        myScrollView.contentOffset = CGPoint(
            x: 0, y: CGFloat(contentHeight))
    }
    
    func setupContentView(){
        for i in 0...content.count+1{
            let frame = CGRect(x: 0, y: CGFloat(contentHeight)*CGFloat(i), width: CGFloat(contentWidth), height: CGFloat(contentHeight))
            let contentView = ContentView(frame: frame, contentViewAttribute: contentAttribute)
            switch i {
            case 0:
                contentView.setup(text: content.last!)
            case content.count+1:
                contentView.setup(text: content[0])
            default:
                contentView.setup(text: content[i-1])
            }
            self.myScrollView.addSubview(contentView)
        }
    }
    
    func startTimer(){
        if timer != nil{
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        if self.timer != nil {
             self.timer?.invalidate()
        }
    }
    
    @objc func autoScroll(){
        print(index)
        switch self.scrollDirection {
        case .up:
            index += 1
            myScrollView.setContentOffset(CGPoint(x: 0, y: Double(index)*contentHeight), animated: true)
        case .down:
            index -= 1
            myScrollView.setContentOffset(CGPoint(x: 0, y: Double(index)*contentHeight), animated: true)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        switch self.scrollDirection {
        case .up:
            if index == content.count+1{
                index = 1
                myScrollView.contentOffset = CGPoint(x: 0, y: Double(index)*contentHeight)
            }
        case .down:
            if index == 0{
                index = content.count
                myScrollView.contentOffset = CGPoint(x: 0, y: Double(index)*contentHeight)
            }
        }
        
    }
    
    
    
}

