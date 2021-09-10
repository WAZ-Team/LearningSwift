//
//  ViewController.swift
//  ChangeImage
//
//  Created by Nguyen Huy Dong on 9/7/21.
//

import UIKit
import SSZipArchive

class ViewController: UIViewController, SSZipArchiveDelegate,  URLSessionTaskDelegate,
                      URLSessionDownloadDelegate {
    
    @IBOutlet weak var img: UIImageView!
    
     let zipURL = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/125%402.zip"
     let imageFile = "25.png"
     let zipURL2 = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/127%402.zip"
     let imageFile2 = "27.png"
    
    var zipPath: String?
    
    func unzipPath() -> String? {
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        return path
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        download()
        updateImageView()
    }
    
    func clearImageView() {
        img.image = nil
    }
    //  UpdateView
    func updateImageView() {
        let unzipPath = self.unzipPath()! as NSString
        let imagePath = unzipPath.appendingPathComponent(imageFile)
        let image = UIImage.init(contentsOfFile: imagePath)
        img.image = image
    }
    
    private func download() {
        //create session configuration
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData // reload cache
        
        //create session
        let session = URLSession.init(configuration: config,
                                      delegate: self,
                                      delegateQueue: OperationQueue.main)
        
        //download task
        guard let url = URL.init(string: zipURL) else {
            return
        }
        
        let task = session.downloadTask(with: url)
        
        // Start downloading
        task.resume()
    }
}


// MARK: - URLSessionTaskDelegate
extension ViewController {
    
    //session complete
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("URLSession didComplete")
        session.finishTasksAndInvalidate()  // Session termination processing
        guard error == nil else {
            
            // error
            print("Error \(String(describing: error))")
            return
        }
        
        // success
        print("Success")
        if Thread.isMainThread {
            updateImageView()
        }
        else {
            DispatchQueue.main.sync { [weak self] in
                updateImageView()
            }
        }
    }
}
// MARK: - URLSessionDownloadDelegate
extension ViewController {
    
    //download task process
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        // Check progress
        print("\(totalBytesWritten) / \(totalBytesExpectedToWrite)")
    }
    
    
     // Download task completed
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let unzipPath = self.unzipPath()
        
        // Prepare the extraction folder
        do {
            try FileManager.default.createDirectory(atPath: unzipPath!, withIntermediateDirectories: true, attributes: nil)
        }
        catch _ {
            print("createDirectory error.")
            return
        }
        
        // Unzip
        SSZipArchive.unzipFile(atPath: location.path, toDestination: unzipPath!)
    }
}
