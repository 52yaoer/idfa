//
//  UZModuleDemoSwift.swift
//  UZModule
//
//  Created by kenny on 15/1/14.
//  Copyright (c) 2015年 APICloud. All rights reserved.
//

import UIKit
import Foundation

@objc(UZModuleDemoSwift)
class UZModuleDemoSwift: UZModule, UIAlertViewDelegate {
    var _cbId : Int = 0;
    
    override init!(uzWebView webView: Any!) {
        super.init(uzWebView: webView);
        
    }
    
    override func dispose() {
        //do clean
    }
    
    func showAlert(_ param:NSDictionary) {
        _cbId = param.integerValue(forKey: "cbId", defaultValue: 0);
        let message = param.stringValue(forKey: "msg", defaultValue: nil);
        let alert = UIAlertView(title: "", message: message!, delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定");
        alert.show();
    }
    
    func systemVersion(_ param:NSDictionary) -> String {
        return UIDevice.current.systemVersion;
    }
    
    func alertView(_ alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        let ret: Dictionary<String, Int> = ["index":buttonIndex+1];
        self.sendResultEvent(withCallbackId: _cbId, dataDict: ret, errDict: nil, doDelete: false);
    }
}
