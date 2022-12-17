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
        
        objectOfAboutSubjectNetwork.callApiForDetailsOfTheSubject(subbjectId: subjectIdToSend){ completionDatais, completionErrorIS in
            
            DispatchQueue.main.async {
                if completionErrorIS == nil{
                    
                    
                    if let data1 = completionDatais as? [[String: Any]] {
                        
                        for i in data1{
                            
                            guard let data2 = i["chapterId"] as? Int else{return}
                            guard let data3 = i["chapterName"] as? String else{return}
                            
                            print("chapterName :",data3)
                            print("chapterId :",data2)
                            
                            var sub = SubjectDetailsModel(chapterName: data3, chapterId: data2)
                            
                            
                            self.subjectDetailsArray.append(sub)
                        }
                        
                    }
                    
                    completion(true)
                    
                }else{
                    
                    completion(false)
                }
            }
            
           
            
        }
        
    }
    
    
    
    func callApiForLessonDetails(lessonIdToSend: Int, completion: @escaping((Bool) -> ())) {
        
        objectOfAboutSubjectNetwork.callApiForDetailsOfTheLesson(lessonId: lessonIdToSend){ responceData, responceError in
            
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
                            
                            let lesson = lessonModel(lessonId: data2, lessonNumber: data3, lessonName: data4, noOfUnits: data5, level: data6)
                            
                            self.lessonDetails.append(lesson)
                            
                            print("2")
                            if let data7 = i["unitList"] as? [[String: Any]]{
                                
                                print("3", data7)

                                for j in data7{
                                   
                                    print("for loop")
                                    
                                    guard let data11 = j["unitId"] as? Int else{ return}
                                    guard let data12 = j["unitName"] as? String else{ return}
                                    guard let data13 = j["unitOverview"] as? String else{ return}
                                    guard let data14 = j["level"] as? String else{ return}
                                    guard let data15 = j["totalPages"] as? Int else{ return}
//
                                    let unit = UnitModel(unitId: data11, unitName: data12, unitOverview: data13, level: data14, totalPages: data15)
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
