//
//  (old)ViewController.swift
//  MyMarquee
//
//  Created by 謝宛軒 on 2020/12/18.
//  Copyright © 2020 謝宛軒. All rights reserved.
//

import Foundation

//class ViewController: UIViewController, UIScrollViewDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupScrollView()
//        setupContentView()
//        setupUI()
//        startTimer()
//    }
//
//    lazy var width = UIScreen.main.bounds.size.width-loudspeakerImage.bounds.width-30
//    lazy var height = 70
//    var timer: Timer?
//    var index = 0
//
//    var content = ["車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕車咕嚕咕嚕","恭喜發財！我成功ㄌ！"]
//
//    var loudspeakerImage: UIImageView = {
//        let imgView = UIImageView()
//        imgView.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
//        imgView.image = UIImage(named: "iconAnnouncement")
//        imgView.tintColor = UIColor(red: 255/255, green: 158/255, blue: 72/255, alpha: 1)
//        return imgView
//    }()
//
//    lazy var myScrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.delegate = self
//        view.showsVerticalScrollIndicator = false
//        view.showsHorizontalScrollIndicator = false
//        view.isScrollEnabled = false
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    lazy var backgroundView: UIView = {
//        let view = UIView()
//        view.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: CGFloat(height))
//        view.backgroundColor = UIColor(red: 255/255, green: 158/255, blue: 72/255, alpha: 0.1)
//        return view
//    }()
//
//
//    func setupUI(){
//        //        self.view.addSubview(backgroundView)
//        //        self.backgroundView.addSubview(myScrollView)
//        //        self.backgroundView.addSubview(loudspeakerImage)
//
//    }
//
//    func setupScrollView(){
//        myScrollView.frame = CGRect(x: loudspeakerImage.bounds.width+20, y: 0, width: width, height: CGFloat(height))
//        myScrollView.contentSize = CGSize(width: width, height: CGFloat(height)*CGFloat(content.count+2))
//        //看整張scrollView
//        //myScrollView.frame = CGRect(x: loudspeakerImage.bounds.width+20, y: 0, width: width, height: CGFloat(height)*CGFloat(content.count+2))
//        myScrollView.contentOffset = CGPoint(
//            x: 0, y: 0)
//    }
//
//    func setupContentView(){
//        for i in 0...content.count+1{
//            let frame = CGRect(x: 0, y: CGFloat(height)*CGFloat(i), width: width, height: CGFloat(height))
//            let contentView = ContentView(frame: frame)
//            switch i {
//            case 0:
//                contentView.setup(text: content.last!)
//            case content.count+1:
//                contentView.setup(text: content[0])
//            default:
//                contentView.setup(text: content[i-1])
//            }
//            self.myScrollView.addSubview(contentView)
//        }
//    }
//
//    func startTimer(){
//        if timer != nil{
//            timer?.invalidate()
//        }
//        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
//    }
//
//    @objc func autoScroll(){
//        index += 1
//        myScrollView.setContentOffset(CGPoint(x: 0, y: index*height), animated: true)
//    }
//
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        if index == content.count+1{
//            index = 1
//            myScrollView.contentOffset = CGPoint(x: 0, y: index*height)
//        }
//    }
//
//
//
//}
//
