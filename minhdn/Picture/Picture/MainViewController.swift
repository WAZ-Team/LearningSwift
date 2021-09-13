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
        saveLink()
        download()
        unzip()
        updateImageView()
    }
    //    Clear image
    func clearImageView() {
        imageChange.image = nil
    }
    //  UpdateView
    func updateImageView() {
        if UserDefaults.standard.object(forKey: "zipURL") as? String  == MainViewController.zipURL1{
            let unzipPath = self.unzipPath() as NSString
            let imagePath = unzipPath.appendingPathComponent(MainViewController.imageFile)
            let image = UIImage.init(contentsOfFile: imagePath)
            imageChange.image = image
        }else{
            let unzipPath = self.unzipPath() as NSString
            let imagePath = unzipPath.appendingPathComponent(MainViewController.imageFile2)
            let image = UIImage.init(contentsOfFile: imagePath)
            imageChange.image = image
        }
       
        
    }
    
    func saveLink() {
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

            // Prepare the download task
            guard let url = URL(string: UserDefaults.standard.object(forKey: "zipURL") as? String ?? "") else {
                return
            }
            let task = URLSession.shared.downloadTask(with: url)
            // Start downloading
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
         func unzipPath() -> String {
            let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0];
            return path
        }
        

    
    
    // MARK: - URLSessionTaskDelegate

        
//        //   Session completed
//        func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//            print("URLSession didComplete")
//            session.finishTasksAndInvalidate()  // Session termination processing
//            guard error == nil else {
//                // error
//                print("Error \(String(describing: error))")
//                return
//            }
//            // success
//                DispatchQueue.main.sync {
//                    self.updateImageView()
//                }
//            }
    
    // MARK: - URLSessionDownloadDelegate
    
        // Download task completed
//        func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    func unzip(){
            let unzipPath = self.unzipPath()
            
            // Delete the old destination folder
            self.removeItem(unzipPath)
            
            // Prepare the extraction folder
            do {
                try FileManager.default.createDirectory(atPath: unzipPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch _ {
                print("createDirectory error.")
                return
            }
            guard let url = URL(string: UserDefaults.standard.object(forKey: "zipURL") as? String ?? "") else {
                return
            }
            // Unzip
            SSZipArchive.unzipFile(atPath: url.path, toDestination: unzipPath)
        }
    }

