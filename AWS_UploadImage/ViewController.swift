//
//  ViewController.swift
//  AWS_UploadImage
//
//  Created by harvey on 16/5/23.
//  Copyright © 2016年 harvey. All rights reserved.
//

import UIKit
import AWSS3
import AWSCore
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let transferManager = AWSS3TransferManager.default()
        if let uploadRequest = AWSS3TransferManagerUploadRequest() {
            uploadRequest.bucket = "microduino-apps"  // 替换为存储桶名
            uploadRequest.key = "test.jpg"
            uploadRequest.acl = AWSS3ObjectCannedACL.publicRead
            uploadRequest.body = URL(string:Bundle.main.resourcePath! + "/test.jpg")
            transferManager?.upload(uploadRequest).continue({ (task) -> Any? in
                if let error = task.error {
                    print("upload() failed: [\(error)]")
                }
                
                if let exception = task.exception {
                    print("upload() failed: [\(exception)]")
                }
                
                if task.result != nil {
                        print("upload successfully")
                }
                return nil
            })
            }}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


