//
//  File.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/23/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourseController: DatasourceController{
    
    let errorMsgLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please, try again later"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.isHidden = true
        return lbl
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout() //to look ok horizontally;  it layouts it again
        
        view.addSubview(errorMsgLabel)
        errorMsgLabel.fillSuperview()//LBTA method -anchor to whole screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()

        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            if let err = err {
                if let apiError = err as? APIError<Service.JSError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMsgLabel.text = "Status code is not 200" //network error
                    }
                }
                self.errorMsgLabel.isHidden = false
               return
            } else {
            self.datasource = homeDataSource
        }
      }
    }
    //if error
    
    //no extra spacing!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //first section of users
        if indexPath.section == 0 {
            //get bio of user to have the height of cell
            if let user = self.datasource?.item(indexPath) as? User {
                 let estimatedFrameHeight = estimatedHeightForText(user.bioText)
                return CGSize(width: view.frame.width, height: estimatedFrameHeight + 66) // 66 paddings from User elements
            }
        } else if indexPath.section == 1 {
            guard let tweet = datasource?.item(indexPath)as? Tweet else {return .zero} //zero means 0 heigth and width
            //tweets size
            
            let estimatedFrameHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedFrameHeight + 74) // 66 paddings from User elements
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func estimatedHeightForText(_ text:String)->CGFloat {
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 // from constraints
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)//large value
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 { //for the second secion we do not need footer and header
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 { //for the second secion we do not need footer and header
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
