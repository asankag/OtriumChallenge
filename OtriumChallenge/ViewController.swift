//
//  ViewController.swift
//  OtriumChallenge
//
//  Created by Asanka Gankewala on 3/28/21.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate {
    
    lazy var presenter = Presenter(with: self)
    var refreshControl = UIRefreshControl()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:20)
        return label
    } ()
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "oval")!.circleMask
        return profileImage
    } ()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Sian Taylor"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:32)
        return label
    } ()
    
    let userLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "setaylor"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "s.e.taylor@gmail.com"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:16)
        return label
    } ()
    
    let followersLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "48 followers"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let followingLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "72 following"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let pinnedLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Pinned"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:24)
        return label
    } ()
    
    let pinnedViewAllLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "View all"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:16)
        return label
    } ()
    
    private var pinnedTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    } ()
    
    let topRepositoriesLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Top repositories"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:24)
        return label
    } ()
    
    let topRepositoriesViewAllLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "View all"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:16)
        return label
    } ()
    
    let starredRepositoriesLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Starred repositories"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:24)
        return label
    } ()
    
    let starredRepositoriesViewAllLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "View all"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:16)
        return label
    } ()
    
    var topRepositoriesCollectionView:UICollectionView?
    
    var starredRepositoriesCollectionView:UICollectionView?
    
    private var pinnedItems: NSArray = []
    var userModel : UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let topRepositoriesLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        topRepositoriesLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        topRepositoriesLayout.itemSize = CGSize(width: 200, height: 140)
        
        let starredRepositoriesLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        starredRepositoriesLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        starredRepositoriesLayout.itemSize = CGSize(width: 200, height: 140)
        
        topRepositoriesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: topRepositoriesLayout)
        
        topRepositoriesCollectionView?.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        topRepositoriesCollectionView?.backgroundColor = UIColor.white
        
        topRepositoriesCollectionView?.dataSource = self
        topRepositoriesCollectionView?.delegate = self
        
        if let flowLayout = topRepositoriesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        starredRepositoriesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: starredRepositoriesLayout)
        
        starredRepositoriesCollectionView?.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        starredRepositoriesCollectionView?.backgroundColor = UIColor.white
        
        starredRepositoriesCollectionView?.dataSource = self
        starredRepositoriesCollectionView?.delegate = self
        
        if let flowLayout = starredRepositoriesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        initUI ()
        pinnedTableView.register(PinnedTableViewCell.self, forCellReuseIdentifier: "cell")         // register cell name
        
        pinnedTableView.dataSource = self
        pinnedTableView.delegate = self
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        pinnedTableView.addSubview(refreshControl) // not required when using UITableViewController
        presenter.updateData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter.updateData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userModel?.pinnedItems?.edges.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PinnedTableViewCell
        
        cell.separator(hide: true)
        
        if indexPath.section == 0 {
            cell.userNameLabel.text = self.userModel?.pinnedItems?.edges[indexPath.row].node.name
            cell.topicLabel.text = self.userModel?.pinnedItems?.edges[indexPath.row].node.description
            cell.titelLabel.text = self.userModel?.pinnedItems?.edges[indexPath.row].node.description
            cell.langLabel.text = self.userModel?.pinnedItems?.edges[indexPath.row].node.primaryLanguage?.name
            cell.likeCountLable.text = String(self.userModel?.pinnedItems?.edges[indexPath.row].node.forkCount ?? 0)
            let url = URL(string: (self.userModel?.pinnedItems?.edges[indexPath.row].node.openGraphImageUrl)!)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                let image = UIImage(data: imageData)!.circleMask
                cell.profileImage.image = image
            }else {
                profileImage.image = UIImage(named: "oval")!.circleMask
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0;//Choose your custom row height
    }
    
    func initUI () {
        // set title label
        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: titleLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        // Set profile image
        self.view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 88).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 88).isActive = true
        
        // set user name label
        self.view.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 112).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 45).isActive = true
        
        // set user id label
        self.view.addSubview(userLabel)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: userLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 112).isActive = true
        NSLayoutConstraint(item: userLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: userLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 95).isActive = true
        NSLayoutConstraint(item: userLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        // set email label
        self.view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: emailLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: emailLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: emailLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 160).isActive = true
        NSLayoutConstraint(item: emailLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        // set followers label
        self.view.addSubview(followersLabel)
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: followersLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: followersLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: followersLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: followersLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 156).isActive = true
        
        // set following label
        self.view.addSubview(followingLabel)
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: followingLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 172).isActive = true
        NSLayoutConstraint(item: followingLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: followingLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: followingLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 106).isActive = true
        
        // set pinned Label
        self.view.addSubview(pinnedLabel)
        pinnedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: pinnedLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: pinnedLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 250).isActive = true
        NSLayoutConstraint(item: pinnedLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: pinnedLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 106).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(pinnedViewAllLabel)
        pinnedViewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: pinnedViewAllLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: pinnedViewAllLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 255).isActive = true
        NSLayoutConstraint(item: pinnedViewAllLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: pinnedViewAllLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 106).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(pinnedTableView)
        pinnedTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: pinnedTableView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: pinnedTableView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: pinnedTableView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 360).isActive = true
        NSLayoutConstraint(item: pinnedTableView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 160).isActive = true
        
        // set top repositories Label
        self.view.addSubview(topRepositoriesLabel)
        topRepositoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: topRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 460).isActive = true
        NSLayoutConstraint(item: topRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: topRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 206).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(topRepositoriesViewAllLabel)
        topRepositoriesViewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: topRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 465).isActive = true
        NSLayoutConstraint(item: topRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: topRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 106).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(topRepositoriesCollectionView ?? UICollectionView())
        topRepositoriesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: topRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: topRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 550).isActive = true
        NSLayoutConstraint(item: topRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150).isActive = true
        
        self.view.addSubview(starredRepositoriesLabel)
        starredRepositoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: starredRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: starredRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 640).isActive = true
        NSLayoutConstraint(item: starredRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: starredRepositoriesLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 206).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(starredRepositoriesViewAllLabel)
        starredRepositoriesViewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: starredRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: starredRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 645).isActive = true
        NSLayoutConstraint(item: starredRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: starredRepositoriesViewAllLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 106).isActive = true
        
        // set pinned View All Label
        self.view.addSubview(starredRepositoriesCollectionView ?? UICollectionView())
        starredRepositoriesCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: starredRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: starredRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: starredRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 730).isActive = true
        NSLayoutConstraint(item: starredRepositoriesCollectionView ?? UICollectionView(), attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150).isActive = true
        
        let date = UserDefaults.standard.object(forKey: "lastsavedate") as! Date
        if Calendar.current.isDateInToday(date) {
            print("Same day no need to update")
        } else {
            presenter.updateData()
        }
    }
}

extension ViewController: PresenterView {
    
    func updateProfile(data: UserModel) {
        userNameLabel.text = data.login
        userLabel.text = data.name
        emailLabel.text = data.email
        followersLabel.text = String((data.followers?.totalCount)!) + " followers"
        followingLabel.text = String((data.following?.totalCount)!) + " following"
//        pinnedItems = data.pinnedItems as! PinnedItems
        refreshControl.endRefreshing()
        userModel = data
        
        let url = URL(string: data.avatarUrl!)
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)!.circleMask
            profileImage.image = image
        }else {
            profileImage.image = UIImage(named: "oval")!.circleMask
        }
        pinnedTableView.reloadData()
        topRepositoriesCollectionView?.reloadData()
        starredRepositoriesCollectionView?.reloadData()
    }
    
    func showAlertMessage(_ message: String) {
        let alert = UIAlertController(title: "Otrium", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        refreshControl.endRefreshing()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == topRepositoriesCollectionView) {
            return self.userModel?.topRepositories?.nodes?.count ?? 0 // How many cells to display
        } else {
            return self.userModel?.starredRepositories?.nodes?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == topRepositoriesCollectionView) {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! RepoCollectionViewCell
            myCell.userNameLabel.text = self.userModel?.topRepositories?.nodes?[indexPath.row].name
            myCell.topicLabel.text = self.userModel?.topRepositories?.nodes?[indexPath.row].description
            myCell.titelLabel.text = self.userModel?.topRepositories?.nodes?[indexPath.row].description
            myCell.langLabel.text = self.userModel?.topRepositories?.nodes?[indexPath.row].primaryLanguage?.name
            myCell.likeCountLable.text = String(self.userModel?.topRepositories?.nodes?[indexPath.row].forkCount ?? 0)
            let url = URL(string: (self.userModel?.topRepositories?.nodes?[indexPath.row].openGraphImageUrl)!)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                let image = UIImage(data: imageData)!.circleMask
                myCell.profileImage.image = image
            }else {
                profileImage.image = UIImage(named: "oval")!.circleMask
            }
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! RepoCollectionViewCell
            myCell.userNameLabel.text = self.userModel?.starredRepositories?.nodes?[indexPath.row].name
            myCell.topicLabel.text = self.userModel?.starredRepositories?.nodes?[indexPath.row].description
            myCell.titelLabel.text = self.userModel?.starredRepositories?.nodes?[indexPath.row].description
            myCell.langLabel.text = self.userModel?.starredRepositories?.nodes?[indexPath.row].primaryLanguage?.name
            myCell.likeCountLable.text = String(self.userModel?.starredRepositories?.nodes?[indexPath.row].forkCount ?? 0)
            let url = URL(string: (self.userModel?.starredRepositories?.nodes?[indexPath.row].openGraphImageUrl)!)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                let image = UIImage(data: imageData)!.circleMask
                myCell.profileImage.image = image
            }else {
                profileImage.image = UIImage(named: "oval")!.circleMask
            }
            return myCell
        }
    }
}

extension UIImage {
    var circleMask: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: .init(origin: .init(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UITableViewCell {
    func separator(hide: Bool) {
        separatorInset.left = hide ? bounds.size.width : 0
    }
}

