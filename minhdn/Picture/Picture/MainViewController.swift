//
//  MainViewController.swift
//  Picture
//
//  Created by MinhDev on 8/31/21.
//

import UIKit
import SSZipArchive
class MainViewController: UIViewController{
    //    MARK:-    Iboutlet
    @IBOutlet private weak var imageChange: UIImageView!
    //    Source
    static let zipURL1 = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/125%402.zip"
    static let imageFile = "25.png"
    static let zipURL2 = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/127%402.zip"
    static let imageFile2 = "27.png"
    override func viewDidLoad() {
        super.viewDidLoad()
        clearImageView()
        radomLink()
        download()
        
    }
    //    Clear image
    func clearImageView() {
        imageChange.image = nil
    }
    //  UpdateView
    func updateImageView() {
        guard let unzipPath = unZipPath() else {
            return
        }
        if UserDefaults.standard.object(forKey: "zipURL") as? String  == MainViewController.zipURL1{
            let unzipPath1 = unzipPath as NSString?
            let imagePath = unzipPath1?.appendingPathComponent(MainViewController.imageFile) ?? ""
            let image = UIImage.init(contentsOfFile: imagePath)
            imageChange.image = image
        }else{
            let unzipPath1 = unzipPath as NSString?
            let imagePath = unzipPath1?.appendingPathComponent(MainViewController.imageFile2) ?? ""
            let image = UIImage.init(contentsOfFile: imagePath)
            imageChange.image = image
        }
    }
    //    Radomlink
    func radomLink() {
        if UserDefaults.standard.object(forKey: "zipURL") as? String  == nil {
            UserDefaults.standard.setValue(MainViewController.zipURL1, forKey: "zipURL")
        }else{
            if UserDefaults.standard.object(forKey: "zipURL") as? String == MainViewController.zipURL1{
                UserDefaults.standard.removeObject(forKey: "zipURL")
                UserDefaults.standard.setValue(MainViewController.zipURL2, forKey: "zipURL")
            }else{
                UserDefaults.standard.removeObject(forKey: "zipURL")
                UserDefaults.standard.setValue(MainViewController.zipURL1, forKey: "zipURL")
            }
        }
    }
    
    private func download() {
        // Prepare the session configuration
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData // reload cache
        config.timeoutIntervalForRequest = 50 // Timeout time to start request transfer(s)
        config.timeoutIntervalForResource = 60 * 60 // Timeout time until all transfers are completed(s)
        
        // URL
        guard let url = URL(string: UserDefaults.standard.object(forKey: "zipURL") as? String ?? "") else {
            return
        }
        print(url)
        let session = URLSession.init(configuration: config,
                                      delegate: self,
                                      delegateQueue: OperationQueue.main)
        // Start downloading
        let task = session.downloadTask(with: url)
        task.resume()
        
    }
    
    // MARK: - Path
    
    //  Delete files / folders: thêm /xoá file
    func removeItem(_ path: String) {
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
    
    //    The path to which the Zip file is extracted: Đường dẫn đến file zip
    func unZipPath() -> String?{
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        return path
    }
    
}


// MARK: - URLSessionDownloadDelegate
extension MainViewController: URLSessionDownloadDelegate {
    //   download process
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("\(totalBytesWritten) / \(totalBytesExpectedToWrite)")
    }
    
    //         Download task completed
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let unzipPath = self.unZipPath()
        
        // Delete the old destination folder
        self.removeItem(unzipPath ?? "")
        
        // Prepare the extraction folder
        do {
            try FileManager.default.createDirectory(atPath: unzipPath ?? "", withIntermediateDirectories: true, attributes: nil)
        }
        catch _ {
            print("createDirectory error.")
            return
        }
        
        // Unzip
        let success: Bool = SSZipArchive.unzipFile(atPath: location.path, toDestination: unzipPath ?? "")
        if success != false {
            print("Success unzip")
            self.updateImageView()
        } else {
            print("No success unzip")
            return
        }
    }
}

