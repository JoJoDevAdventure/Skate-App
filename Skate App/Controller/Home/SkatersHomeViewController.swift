//
//  SkatersHomeViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 09/03/2022.
//

import UIKit

class SkatersHomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let posts = Datas.shared.testPosts
    private let goToLoginIdentifier = "goToLoginFromHome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    
    }
    
    //------------------- UI ----------------------//
    private func setupUI() {
        
    }
    
    //------------------- Actions ----------------------//
    private func setupActions() {
        setupTableView()
        //verification()
    }
    
    private func verification() {
        AuthManager.shared.verifyIfLoggedIn { exist in
            if !exist {
                self.performSegue(withIdentifier: self.goToLoginIdentifier, sender: self)
            }
        }
    }

}

//------------------- Extentions ----------------------//

extension SkatersHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as! PostsTableViewCell
        cell.configure(post)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }

}


