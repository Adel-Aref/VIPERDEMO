//
//  AppUtils.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//

import UIKit

func showProgressIndicator(view:UIView) {
    
    view.isUserInteractionEnabled = false
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

func hideProgressIndicator(view:UIView) {
    view.isUserInteractionEnabled = true
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
}
let PROGRESS_INDICATOR_VIEW_TAG:Int = 10
