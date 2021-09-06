//
//  MainViewController.swift
//  Picture
//
//  Created by MinhDev on 8/31/21.
//

import UIKit
import SSZipArchive
class MainViewController: UIViewController, URLSessionTaskDelegate,
                          URLSessionDownloadDelegate{
    //    MARK:-    Iboutlet
    @IBOutlet private weak var imageChange: UIImageView!
    //    Source
    static let zipURL = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/125%402.zip"
    static let imageFile = "25.png"
    static let zipURL2 = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/127%402.zip"
    static let imageFile2 = "27.png"
    override func viewDidLoad() {
        super.viewDidLoad()
        clearImageView()
        download()
        updateImageView()
    }
    //    Clear image
    func clearImageView() {
        imageChange.image = nil
    }
    //  UpdateView
    func updateImageView() {
        let unzipPath = MainViewController.unzipPath() as NSString
        let imagePath = unzipPath.appendingPathComponent(MainViewController.imageFile)
        let image = UIImage.init(contentsOfFile: imagePath)
        imageChange.image = image
        
    }
    func download() {
        
        /**
         * Prepare the session configuration
         */
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData // reload cache
        config.timeoutIntervalForRequest = 10 // Timeout time to start request transfer(s)
        config.timeoutIntervalForResource = 60 * 60 // Timeout time until all transfers are completed(s)
        
        /**
         * Prepare a session
         */
        let session = URLSession.init(configuration: config,
                                      delegate: self,
                                      delegateQueue: OperationQueue.main)
        
        /**
         * Prepare the download task
         */
        guard let url = URL.init(string: MainViewController.zipURL) else {
            return
        }
        
        let task = session.downloadTask(with: url)
        
        // Start downloading
        task.resume()
    }
}
// MARK: - Path
extension MainViewController {
    
    /**
     * Delete files / folders: thêm /xoá file
     */
    static func removeItem(_ path: String) {
        guard FileManager.default.fileExists(atPath: path) else {
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path)
        }
        catch _ {
            print("removeItem error.")
            return
        }
    }
    
    
    /**
     * The path to which the Zip file is extracted: Đường dẫn đến file zip
     */
    static func unzipPath() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0];
        
        return path
    }
    
}


// MARK: - URLSessionTaskDelegate
extension MainViewController {
    
    /**
     * Session completed
     */
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
            DispatchQueue.main.sync {
                updateImageView()
            }
        }
    }
}

// MARK: - URLSessionDownloadDelegate
extension MainViewController {
    
    /**
     * Download task process
     */
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        // Check progress
        print("\(totalBytesWritten) / \(totalBytesExpectedToWrite)")
    }
    
    /**
     * Download task completed
     */
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let unzipPath = MainViewController.unzipPath()
        
        // Delete the old destination folder
        MainViewController.removeItem(unzipPath)
        
        // Prepare the extraction folder
        do {
            try FileManager.default.createDirectory(atPath: unzipPath, withIntermediateDirectories: true, attributes: nil)
        }
        catch _ {
            print("createDirectory error.")
            return
        }
        
        // Unzip
        SSZipArchive.unzipFile(atPath: location.path, toDestination: unzipPath)
    }
}

