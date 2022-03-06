//
//  ViewController.swift
//  FileDemo
//
//  Created by 猪猪贝 on 2022/2/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkExist()
        saveDate()
        checkExist()
        readDate()
//        deleteDate()
        checkExist()
    }
    
    var dataUrl: URL {
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url.appendPathComponent("my_folder")
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: false, attributes: nil) // 如果有很多层文件则为true
        url.appendPathComponent("hello.txt")
        print(url)
        return url
    }
    func saveDate() {
        do {
            try "Hello, world".write(to: dataUrl, atomically: false, encoding: .utf8)
            print("Write succeeded")
        }
        catch {
            print("Write Error: \(error)")
        }
    }
    
    func readDate() {
        do {
            let s = try String(contentsOf: dataUrl, encoding: .utf8)
            print("Read succeeded: \(s)")
        }
        catch {
            print("Read error: \(error)")
        }
    }
    
    func deleteDate() {
        do {
            try FileManager.default.removeItem(at: dataUrl)
            print("Delete succeeded")
        } catch {
            print("Delete error: \(error)")
        }
    }
    
    func checkExist() {
        if FileManager.default.fileExists(atPath: dataUrl.path){
            print("Exist")
        } else {
            print("NO Exist")
        }
    }
    // 四个路径
    func dataContainerDirectory() {
        let document = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(document)
        print()

        let support = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask)[0]
        print(support)
        print()
         
        let cache = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        print(cache)
        print()
        
        let temp = FileManager.default.temporaryDirectory
        print(temp)
        print()
        
    }
}

