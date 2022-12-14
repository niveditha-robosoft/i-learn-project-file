//
//  SubjectViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 10/12/22.
//

import Foundation

class SubjectListViewModel{
    
    static var objectOfViewModel = SubjectListViewModel()
    
   var objectOfSubjectNetwork = SubjectListNetwork()
    var subjectListDetail = [SubjectListModel]()
    
    var subName = [String]()
    var subId = [Int]()
    
    var subDic: [Int: String] = [:]
    func subjectDetail(completion: @escaping((Bool) -> Void) ) {
        
        print(" view model")
        objectOfSubjectNetwork.apiCallforSubjectDetails(){ dataIs, errorIs in
            
            DispatchQueue.main.async {
                if errorIs == nil{
                    

                    guard let data1 = dataIs as? [[String:Any]] else {
//                        print("nodata")
                        return
                    }
                    for i in data1 {
                        guard let data2 = i["subjectName"] as? String else {
//                            print("no data")
                            return
                        }
                        
                        
                        self.subName.append(data2)
                        guard let dataId = i["subjectId"] as? Int else {
                            return
                        }
                        self.subDic[dataId] = data2
                        self.subId.append(dataId)
                        let sub = SubjectListModel(subjectName: data2, subjectId: dataId)
                        self.subjectListDetail.append(sub)
                    }
                    
//                    print(self.subName)
//                    print(self.subId)
//                    print("))))))))))))))",self.subDic)
                   completion(true)
                }else{
                    completion(false)
                    print("error received")
                }
            }
            
        }
    }
}
