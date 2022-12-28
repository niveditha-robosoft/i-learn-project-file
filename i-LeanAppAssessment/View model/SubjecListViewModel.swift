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

    func subjectDetail(completion: @escaping((Bool) -> Void) ) {
        
        print(" view model")
        objectOfSubjectNetwork.apiCallforSubjectDetails(){ dataIs, errorIs in
            
            DispatchQueue.main.async {
                if errorIs == nil{
                    

                    guard let data1 = dataIs else { completion(false)
                        return
                    }
                    for i in data1 {
                        guard let data2 = i["subjectName"] as? String else { completion(false)
                            return
                        }
                        
                        
                        guard let dataId = i["subjectId"] as? Int else { completion(false)
                            return
                        }
                        
                        guard let subImage = i["subjectImage"] as? String else{ completion(false)
                            return}
                        
                        
                        let sub = SubjectListModel(subjectName: data2, subjectId: dataId, subjectImage: subImage)
                        self.subjectListDetail.append(sub)
                    }
                    
                   completion(true)
                }else{
                    completion(false)
                }
            }
            
        }
    }
}
