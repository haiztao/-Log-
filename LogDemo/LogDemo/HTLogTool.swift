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
    //将数据写入log中
    class func logWithTag(_ tag:String){
        if logMode {
            let dataLogPath = NSHomeDirectory() + "/Documents/logData.txt"
            let fileM = FileManager()
            if !fileM.fileExists(atPath: dataLogPath) {
                try! ("" as NSString).write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
            }
            let dataLog = try! NSMutableString(contentsOfFile: dataLogPath, encoding: String.Encoding.utf8.rawValue)
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateStr = formatter.string(from: Date())
            let line = dateStr + " : " + tag + "   \n"
            dataLog.append(line)
            print(dataLog)
            try! dataLog.write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)  
        }
    }
    
    //将读取log中数据
    class func readLogInfo()->String{
        let dataLogPath = NSHomeDirectory() + "/Documents/logData.txt"
        let fileM = FileManager()
        if !fileM.fileExists(atPath: dataLogPath) {
            try! ("" as NSString).write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
        }
        let dataLog = try! NSMutableString(contentsOfFile: dataLogPath, encoding: String.Encoding.utf8.rawValue)
        return dataLog as String
    }
    //清除Log数据
    class func clearLogInfo(){
        let dataLogPath = NSHomeDirectory() + "/Documents/logData.txt"
        try! ("" as NSString).write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
    }
    
}
