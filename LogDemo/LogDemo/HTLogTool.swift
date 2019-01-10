//
//  HTLogTool.swift
//  LogDemo
//
//  Created by Haitao on 2019/1/9.
//  Copyright © 2019 Haitao. All rights reserved.
//

import UIKit
//是否打开日志追踪
let logMode = true

class HTLogTool: NSObject {
    class func logWithTag(_ tag:String){
        if logMode {
            print(tag)
            //将数据写入log中，
            let dataLogPath = NSHomeDirectory() + "/Documents/logData.txt"
            let fileM = FileManager()
            if !fileM.fileExists(atPath: dataLogPath) {
                try! ("" as NSString).write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
            }
            let dataLog = try! NSMutableString(contentsOfFile: dataLogPath, encoding: String.Encoding.utf8.rawValue)
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateStr = formatter.string(from: Date())
            let line = dateStr + " :" + tag + "   \n"
            dataLog.append(line)
            try! dataLog.write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
            
        }
    }
}
