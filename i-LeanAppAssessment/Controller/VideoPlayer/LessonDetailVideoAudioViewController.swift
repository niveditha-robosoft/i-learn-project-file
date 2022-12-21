//
//  LessonDetailVideoAudioViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 13/12/22.
//

import UIKit
import AVKit


class LessonDetailVideoAudioViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    var titleLbl = ["basic of nutriants","reason - malnutrition","fsffgerg","basic of nutriants"]
    var descriptionLbl = ["Malnutrition occurs when the body doesn't get enough nutrients.", "Malnutrition occurs when the body doesn't get enough nutrients." , "Malnutrition occurs when the body doesn't get enough nutrients.","Malnutrition occurs when the body doesn't get enough nutrients."]
    var selectindex = -1
    var isCollapse = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 230
        tableView.rowHeight = UITableView.automaticDimension
        startVideo()
        
    }
   
func startVideo(){
    let url = URL(string: "https://player.vimeo.com/external/342571552.hd.mp4?s=6aa6f164de3812abadff3dde86d19f7a074a8a66&profile_id=175&oauth2_token_id=57447761")
    player = AVPlayer(url:url!)
    avpController.player = player
    self.addChild(avpController)
    avpController.view.frame = self.videoView.bounds
    self.videoView.addSubview(avpController.view)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLbl.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AudioTableViewCell
        cell.titleLabel.text = titleLbl[indexPath.row]
        cell.descriptionLabel.text = descriptionLbl[indexPath.row]
        cell.customisecardview()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectindex == indexPath.row && isCollapse == true {
            return 230
        }
        else {
            return 115
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectindex == indexPath.row{
//            if self.isCollapse == true {
//                isCollapse = false
//            }
//            else{
//                isCollapse = true
//            }
            isCollapse.toggle()
        }
        selectindex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
