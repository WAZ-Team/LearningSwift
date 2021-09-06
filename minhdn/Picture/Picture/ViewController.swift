////
////  ViewController.swift
////  Picture
////
////  Created by MinhDev on 8/30/21.
////
//
//import UIKit
//
//import SSZipArchive
//
//class ViewController: UIViewController,
//  URLSessionTaskDelegate,
//  URLSessionDownloadDelegate {
//  
//  static let zipURL = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/125%402.zip"
//  static let imageFile = "25.png"
//  static let zipURL2 = "https://test-assets-mobile.s3-us-west-2.amazonaws.com/127%402.zip"
//  static let imageFile2 = "27.png"
//  @IBOutlet weak var imageView: UIImageView!
//  @IBOutlet weak var button: UIButton!
//  
////  let lock = NSLock()
//  var isDownloading = false
//  
//  
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//  }
//  
//  @objc func buttonAction(_ sender: AnyObject) {
//    download()
//  }
//  
//  func clearImageView() {
//    imageView.image = nil
//  }
//  
//  func updateImageView() {
//    let unzipPath = ViewController.unzipPath() as NSString
//    let imagePath = unzipPath.appendingPathComponent(ViewController.imageFile)
//    let image = UIImage.init(contentsOfFile: imagePath)
//    imageView.image = image
//    
//  }
//  
//  func download() {
////    defer {
////      lock.unlock()
////    }
////
////    lock.lock()
//    
//    guard !isDownloading else {
//      // ダウンロード中
//      return
//    }
//    isDownloading = true  // ダウンロード中にマークする
//    
//    clearImageView()  // イメージビューをクリアする
//    
//    /**
//     * セッション構成を準備する
//     */
//    let config = URLSessionConfiguration.default
//    config.isDiscretionary = true // バッテリー・通信状態により、優先度を下げる
//    config.requestCachePolicy = .reloadIgnoringLocalCacheData // キャッシュを使用しない
//    config.timeoutIntervalForRequest = 10 // 転送開始までのタイムアウト時間(s)
//    config.timeoutIntervalForResource = 60 * 60 // すべての転送が完了するまでのタイムアウト時間(s)
//    
//    
//    /**
//     * セッションを準備する
//     */
//    let session = URLSession.init(configuration: config,
//                                  delegate: self,
//                                  delegateQueue: OperationQueue.main)
//    
//    
//    /**
//     * ダウンロードタスクを準備する
//     */
//    guard let url = URL.init(string: ViewController.zipURL) else {
//      return
//    }
//    
//    let task = session.downloadTask(with: url)
//    
//    // ダウンロードを開始する
//    task.resume()
//  }
//
//
//}
//
//
//// MARK: - Path
//extension ViewController {
//  
//  /**
//   * ファイル/フォルダ削除する
//   */
//  static func removeItem(_ path: String) {
//    guard FileManager.default.fileExists(atPath: path) else {
//      return
//    }
//    
//    do {
//      try FileManager.default.removeItem(atPath: path)
//    }
//    catch _ {
//      print("removeItem error.")
//      
//      return
//    }
//  }
//  
//  
//  /**
//   * Zip ファイルの展開先のパス
//   */
//  static func unzipPath() -> String {
//    let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0];
//    
//    return path
//  }
//  
//}
//
//
//// MARK: - URLSessionTaskDelegate
//extension ViewController {
//  
//  /**
//   * セッションが完了した
//   */
//  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
////    defer {
////      lock.unlock()
////    }
////
////    lock.lock()
//    isDownloading = false // ダウンロード完了にマークする
//    
//    
//    print("URLSession didComplete")
//
//    session.finishTasksAndInvalidate()  // セッションの終了処理
//
//    guard error == nil else {
//      // エラー発生
//      print("Error \(String(describing: error))")
//      return
//    }
//    
//    
//    // 成功
//    print("Success")
//    
//    if Thread.isMainThread {
//      updateImageView()
//    }
//    else {
//      DispatchQueue.main.sync {
//        updateImageView()
//      }
//    }
//    
//  }
//  
//}
//
//
//// MARK: - URLSessionDownloadDelegate
//extension ViewController {
//  
//  /**
//   * ダウンロードタスクの書き込み処理
//   */
//  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//    // 進捗を確認する
//    print("\(totalBytesWritten) / \(totalBytesExpectedToWrite)")
//  }
//  
//  /**
//   * ダウンロードタスクが完了した
//   */
//  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//    let unzipPath = ViewController.unzipPath()
//    
//    // 古い展開先フォルダを削除する
//    ViewController.removeItem(unzipPath)
//    
//    // 展開先フォルダを準備する
//    do {
//      try FileManager.default.createDirectory(atPath: unzipPath, withIntermediateDirectories: true, attributes: nil)
//    }
//    catch _ {
//      print("createDirectory error.")
//      return
//    }
//    
//    // Zip を展開する
//    SSZipArchive.unzipFile(atPath: location.path, toDestination: unzipPath)
//    
//  }
//
//}
