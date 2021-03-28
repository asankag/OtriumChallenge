//
//  RepoCollectionViewCell.swift
//  OtriumChallenge
//
//  Created by Asanka Gankewala on 3/28/21.
//

import Foundation

import Foundation
import UIKit

class RepoCollectionViewCell: UICollectionViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.borderColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0).cgColor
        return view
    } ()
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "oval")!.circleMask
        return profileImage
    } ()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Sian Taylor"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let titelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "telegraph-android"
        label.font = UIFont(name:"SourceSansPro-SemiBold",size:16)
        return label
    } ()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Telegraph X"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let likeImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "starIcon")!.circleMask
        return profileImage
    } ()
    
    let langImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "ovalIcon")!.circleMask
        return profileImage
    } ()
    
    let likeCountLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "70"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    let langLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Swift"
        label.font = UIFont(name:"SourceSansPro-Light",size:16)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cellView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: cellView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: cellView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: cellView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10).isActive = true
        
        self.contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: profileImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 32).isActive = true
        
        self.contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        self.contentView.addSubview(titelLabel)
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: titelLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: titelLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: titelLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: titelLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -16).isActive = true
        
        self.contentView.addSubview(topicLabel)
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topicLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: topicLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 74).isActive = true
        NSLayoutConstraint(item: topicLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: topicLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -16).isActive = true
        
        self.contentView.addSubview(likeImage)
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: likeImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: likeImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: likeImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: likeImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 12).isActive = true
        
        self.contentView.addSubview(likeCountLable)
        likeCountLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: likeCountLable, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 35).isActive = true
        NSLayoutConstraint(item: likeCountLable, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 95).isActive = true
        NSLayoutConstraint(item: likeCountLable, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: likeCountLable, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60).isActive = true
        
        self.contentView.addSubview(langImage)
        langImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: langImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 66).isActive = true
        NSLayoutConstraint(item: langImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: langImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: langImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 12).isActive = true
        
        self.contentView.addSubview(langLabel)
        langLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: langLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 90).isActive = true
        NSLayoutConstraint(item: langLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 95).isActive = true
        NSLayoutConstraint(item: langLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: langLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 150).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
