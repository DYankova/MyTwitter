//
//  TweetCell.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/25/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    //datasource will set it in the view
    override var datasourceItem: Any?{
        didSet {
            guard let tweet = datasourceItem as? Tweet else {return}
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)])

     let usernameString = "  \(tweet.user.name)\n"
            attributedText.append(NSMutableAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            //TODO add line spacing
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = 10
//            let range = NSMakeRange(0, attributedText.string.characters.count)
//            attributedText.addAttribute(NSMutableParagraphStyle, value: paragraphStyle, range:range)
            messageTextView.attributedText = attributedText
            }
    }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "blabla"
        tv.backgroundColor = .clear
        return tv
    }()

    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()

    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let reTweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let directMsgButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
       addSubview(profileImageView)
       addSubview(messageTextView)
       addSubview(replyButton)
       addSubview(reTweetButton)
        
        profileImageView.anchor(self.topAnchor , left: self.leftAnchor, bottom: nil , right: nil ,topConstant: 12 , leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor , left: profileImageView.rightAnchor, bottom: bottomAnchor , right: rightAnchor ,topConstant: 4 , leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        replyButton.anchor(nil , left: messageTextView.leftAnchor, bottom: self.bottomAnchor , right: nil ,topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
       setupButtomButtons()
    }
    
    func setupButtomButtons() {
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        let likeButtonContainerView = UIView()
        let directMessagesButtonView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessagesButtonView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually // to fill the 4 icons properly
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil , left: messageTextView.leftAnchor, bottom: self.bottomAnchor , right: self.rightAnchor ,topConstant: 0 , leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
       
        addSubview(replyButton)
        addSubview(reTweetButton)
        addSubview(likeButton)
        addSubview(directMsgButton)
        
         replyButton.anchor(replyButtonContainerView.topAnchor , left: replyButtonContainerView.leftAnchor, bottom: nil , right: nil ,topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        reTweetButton.anchor(retweetButtonContainerView.topAnchor , left: retweetButtonContainerView.leftAnchor, bottom: nil , right: nil ,topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor , left: likeButtonContainerView.leftAnchor, bottom: nil , right: nil ,topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        directMsgButton.anchor(directMessagesButtonView.topAnchor , left: directMessagesButtonView.leftAnchor, bottom: nil , right: nil ,topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
   
}
