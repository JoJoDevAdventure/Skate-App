//
//  MySkateSpaceController.swift
//  Skate App
//
//  Created by Youssef Bhl on 08/03/2022.
//

import UIKit

class MySkateSpaceController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let goToLoginIdentifier = "goToLoginFromMySpace"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actions()
        setupUI()
    }
    
    //------------------- UI ----------------------//
    
    func setupUI() {
        
    }
    
    //------------------- Actions ----------------------//
    
    func actions() {
        viewSwipping()
        //verification()
    }
    
    private func verification() {
        AuthManager.shared.verifyIfLoggedIn { exist in
            if !exist {
                self.performSegue(withIdentifier: self.goToLoginIdentifier, sender: self)
            }
        }
    }
    
    private func viewSwipping() {
        let toRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        toRightGesture.direction = .right
        
        let toLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        toLeftGesture.direction = .left
        
        firstView.addGestureRecognizer(toLeftGesture)
        
        secondView.addGestureRecognizer(toRightGesture)
    }
    
    @objc func swipeToRight() {
        firstView.isHidden = false
        secondView.isHidden = true
        pageControl.currentPage = 0
    }
    
    @objc func swipeToLeft() {
        firstView.isHidden = true
        secondView.isHidden = false
        pageControl.currentPage = 1
    }
    
    @IBAction func switchViewBtns(_ sender: UIPageControl) {
        sender.currentPage == 0 ?  swipeToRight() : swipeToLeft()
    }
    
}

//------------------- Extension ----------------------//
