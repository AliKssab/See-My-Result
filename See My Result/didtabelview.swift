//
//  didtabelview.swift
//  See My Result
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
//class DataModelnewgood {
//    var body: String
//
//
//
//    init(body: String) {
//        self.body = body
//
//    }
//
//}
class didtabelview: UIViewController {
    
    @IBOutlet weak var Labeltexte: UITextView!
    @IBOutlet weak var dat: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var didimag: UIImageView!
    
    @IBOutlet weak var ViewScroll: UIView!
    @IBOutlet weak var Scroll: UIScrollView!

//    var array = [DataModelnewgood]()
//      var arrayOfStringsali = [String]()
    var labels:String = ""
    var labeltexst:String = ""
    var data:String = ""
    var didimags:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       didimag.downloaded(from: didimags )
        dat.text = data
        label2.text = labels
        Labeltexte.text = labeltexst
        adjustUITextViewHeight(arg: Labeltexte)
//        let height = Labeltexte.contentSize.height
//        let heightview = ViewScroll.constraints[0]
//
//        heightview.constant = height + 400
//        Scroll.contentSize = CGSize(width: view.bounds.width, height: height + 400)
        
        print("height == \(Labeltexte.contentSize.height)")

     //   Labeltexte.
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
        
        let height = arg.contentSize.height
        let heightview = ViewScroll.constraints[0]
        
        heightview.constant = height + 400
        Scroll.contentSize = CGSize(width: view.bounds.width, height: height + 400)
    }
    
//    private func didFetchData() {
//        array = arrayOfStringsali.map({
//            DataModelnewgood(body: $0)
//        })
//
////        mytabelview.reloadData()
//    }

    @IBAction func BACK(_ sender: UIButton) {
         self.dismiss(animated: false, completion: nil)
    }
}



extension didtabelview : UITextViewDelegate  {
    func textViewDidEndEditing(_ textView: UITextView) {
        print("height 22 == \(textView.contentSize.height)")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing")
    }
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldEndEditing")
        return true
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditing")
        return true
    }
}
