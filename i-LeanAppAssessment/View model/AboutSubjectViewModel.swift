//
//  AboutSubjectViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import Foundation


class AboutSUbjectViewModel {

    var subjectDetailsArray = [SubjectDetailsModel]()
    var lessonDetails = [lessonModel]()
    
    static var objectOfViewmodel = AboutSUbjectViewModel()
    var objectOfAboutSubjectNetwork = AboutSubjectNetwork()
    func callApiForSubjectdetails(subjectIdToSend: Int, completion: @escaping((Bool) -> ())) {
        
        objectOfAboutSubjectNetwork.callApiForDetailsOfTheSubject(subbjectId: subjectIdToSend){ completionDatais, completionStatus , completionErrorIS in
            
            self.subjectDetailsArray.removeAll()
            
            print("subjectDetailsArray is is : \(self.subjectDetailsArray.count)")
            DispatchQueue.main.async {
                if completionErrorIS == nil{
                    
                    if completionStatus == true{
                        
                        if let data1 = completionDatais as? [[String: Any]] {
                            
                            for i in data1{
                                
                                guard let data2 = i["chapterId"] as? Int else{  print("chapter error 1 is is : ");return}
                                guard let data3 = i["chapterName"] as? String else{  print("chapter error 2 is is : ");return}
                                guard let dataImage = i["imageURL"] as? String else {  print("chapter error 3 is is : ");return}
                                print("chapterName :",data3)
                                print("chapterId :",data2)
                                
                                let sub = SubjectDetailsModel(chapterName: data3, chapterId: data2, chapterImage: dataImage)
                                
                                
                                self.subjectDetailsArray.append(sub)
                            }
                            
                        }
                        
                        completion(true)
                        
                        
                    }else{
                        
                        completion(false)
                    }

                    
                }else{
                    
                    completion(false)
                }
            }
            
           
            
        }
        
    }
    
    
    
    func callApiForLessonDetails(tokenToSenf: String,lessonIdToSend: Int, completion: @escaping((Bool) -> ())) {
        
        objectOfAboutSubjectNetwork.callApiForDetailsOfTheLesson(tokenIs: tokenToSenf,lessonId: lessonIdToSend){ responceData, responceError in
            
            self.lessonDetails.removeAll()
            
            DispatchQueue.main.async {
                if responceError == nil{
                    
                    if let data1 = responceData as? [[String: Any]]{
                        
                        print("1")
                        for i in data1 {
                            
                            guard let data2 = i["lessonId"] as? Int else{ return}
                            guard let data3 = i["lessonNumber"] as? String else{ return}
                            guard let data4 = i["lessonName"] as? String else{ return}
                            guard let data5 = i["noOfUnits"] as? Int else{ return}
                            guard let data6 = i["level"] as? String else{ return}
                            guard let data7 = i["percentage"] as? Int else{ return}
                            let lesson = lessonModel(lessonId: data2, lessonNumber: data3, lessonName: data4, noOfUnits: data5, level: data6, percentage: data7)
                            
                            self.lessonDetails.append(lesson)
                            lesson.unitDetails.removeAll()
                            print("2")
                            if let data7 = i["unitList"] as? [[String: Any]]{
                                
                                print("3", data7)

                                for j in data7{
                                   
                                    print("for loop")
                                    
                                    guard let data11 = j["unitId"] as? Int else{ print("001")
                                        return}
                                    guard let data12 = j["unitName"] as? String else{print("002")
                                        return}
                                    guard let data13 = j["unitOverview"] as? String else{ print("003")
                                        return}
                                    guard let data14 = j["level"] as? String else{ print("004")
                                        return}
                                    guard let data15 = j["totalPages"] as? Int else{ print("005")
                                        return}
                                    guard let data16 = j["completeStatus"] as? Bool else{print("006")
                                        return}
                                    let unit = UnitModel(unitId: data11, unitName: data12, unitOverview: data13, level: data14, totalPages: data15, completeStatus: data16)
                                    lesson.unitDetails.append(unit)
                                    
                                }
    
                            }
                            
                        }
      
                        completion(true)
                    }
                    
                    
                    
                    
                }else{
                    print("false is here")
                    completion(false)
                }
            }
            
           
            
        }
        
    }
}
