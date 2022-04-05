//
//  SettingsViewController.swift
//  Skate App
//
//  Created by Youssef Bhl on 10/03/2022.
//

import UIKit
import SafariServices

struct settingCellModel {
    let tittle: String
    let systemImage: String
    let handler : (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var data = [[settingCellModel]]()
    private let logOutSegueIdentifier = "LoggedOut"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    //------------------- UI ----------------------//
    
    func setupUI() {
        setupBackground()
    }
    
    func setupBackground() {
        backView.layer.cornerRadius = 15
    }
    
    //------------------- Actions ----------------------//
    
    func setupActions() {
        configureModels()
        setupTableView()
    }
    
    func configureModels() {
        data.append([
            settingCellModel(tittle: "Edit Profile",systemImage: "" ,handler: {
                self.didTapEditProfile()
            }),
            settingCellModel(tittle: "Invite Friends",systemImage: "" ,handler: {
                self.didTapInviteFriends()
            }),
            settingCellModel(tittle: "Save Original post",systemImage: "" ,handler: {
                self.didTapSaveOriginalPost()
            })
        ])
        
        data.append([
            settingCellModel(tittle: "Privacy / Policy",systemImage: "" ,handler: {
                self.didTapPrivacyPolicy()
            }),
            settingCellModel(tittle: "Terms of service",systemImage: "" ,handler: {
                self.didTapTermsOfService()
            }),
            settingCellModel(tittle: "Help / Feedback",systemImage: "" ,handler: {
                self.didTapHelp()
            })
        ])
        
        data.append([
            settingCellModel(tittle: "Log Out",systemImage: "" ,handler: {
                self.didTapLogOut()
            })
        ])
    }
    
    private func didTapEditProfile() {
        // edit profile
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends() {
        // invite link
    }
    
    private func didTapSaveOriginalPost() {
        // Saved posts
    }
    
    private func didTapPrivacyPolicy() {
        // show privacy safari
        let url = URL(string: "https://google.com")
        let vc = SFSafariViewController(url: url!)
        self.present(vc, animated: true)
    }
    
    private func didTapTermsOfService() {
        // show terms of service safari
        let url = URL(string: "https://google.com")
        let vc = SFSafariViewController(url: url!)
        self.present(vc, animated: true)
    }
    
    private func didTapHelp() {
        // show help in safari
        let url = URL(string: "https://google.com")
        let vc = SFSafariViewController(url: url!)
        self.present(vc, animated: true)
    }
    
    private func didTapLogOut() {
        // log out user
        AuthManager.shared.logOut { loggedOut in
            if loggedOut {
                performSegue(withIdentifier: logOutSegueIdentifier, sender: self)
            } else {
                //ALERT : failed to logOut
            }
        }
        // return to the LogIn
        // delete from coreData
    }

}
//------------------- Extension ----------------------//
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data[0].count
        } else if section == 1 {
            return data[1].count
        } else if section == 2 {
            return data[2].count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCustomCell.identifier, for: indexPath) as! SettingCustomCell
        let currentSectionData = data[indexPath.section]
        let currentRowData = currentSectionData[indexPath.row]
        cell.configure(currentRowData.tittle, currentRowData.systemImage)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSectionData = data[indexPath.section]
        let currentRowData = currentSectionData[indexPath.row]
        currentRowData.handler()
    }
}
