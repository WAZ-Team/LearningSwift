//
//  Main.swift
//  Picture
//
//  Created by MinhDev on 8/31/21.
//

import Foundation
import SSZipArchive
extension MainViewController {
  
  /**
   * ファイル/フォルダ削除する
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
   * Zip ファイルの展開先のパス
   */
  static func unzipPath() -> String {
    let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0];
    
    return path
  }
    
  
}
