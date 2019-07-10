# -Log- 打印日志存档与读取


1、存档

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

2、读取

        let dataLogPath = NSHomeDirectory() + "/Documents/logData.txt"
        let fileM = FileManager()
        if !fileM.fileExists(atPath: dataLogPath) {
            try! ("" as NSString).write(toFile: dataLogPath, atomically: true, encoding: String.Encoding.utf8.rawValue)
        }
        let dataLog = try! NSMutableString(contentsOfFile: dataLogPath, encoding: String.Encoding.utf8.rawValue)
        self.logTV.text = dataLog as String

--------------------- 
作者：HartZ 
来源：CSDN 
原文：https://blog.csdn.net/qq_32117417/article/details/86243847 
版权声明：本文为博主原创文章，转载请附上博文链接！
