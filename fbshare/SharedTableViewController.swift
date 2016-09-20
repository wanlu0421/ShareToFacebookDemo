//
//  SharedTableViewController.swift
//  fbshare
//
//  Created by wanlu wei on 2016-09-18.
//  Copyright © 2016 wanlu wei. All rights reserved.
//

import UIKit

class SharedTableViewController: UITableViewController ,FBSDKSharingDelegate {
    
//    var shareditems : NSMutableArray! = NSMutableArray()
    
    var shareditems = [SharedItem]()
    
    var prototypeCell: SharedTableViewCell!

    let contentURL = "https://ca.linkedin.com/in/wanlu-wei-2a0bab105"
    let contentURLImage = "http://blog.investis.com/en/wp-content/uploads/2016/02/Linkedin-logo.png"
    let contentDescription = "The link will take you to my linkedin page"

    func loadSampleItems(){
        shareditems += [SharedItem(name:"to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout to be shared item1 autolayout "),SharedItem(name:"to be shared item2 to be shared item2 autolayout to be shared item2 autolayout"),SharedItem(name:"to be shared item3 to be shared item3 autolayout ")]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleItems()
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func alertShow(typeStr: String) {
        let alertController = UIAlertController(title: "", message: typeStr, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
/*
    func showLinkButton(sender:FBSDKShareButton)
    {

        let contentstring = shareditems[sender.tag].name
        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: self.contentURL)
        content.contentTitle = contentstring
        content.contentDescription = self.contentDescription
        content.imageURL = NSURL(string: self.contentURLImage)
        
        sender.shareContent = content
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return shareditems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SharedTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)as!SharedTableViewCell
        
        let shareditem = shareditems[indexPath.row]
        
        cell.LableTitle.text = shareditem.name
        cell.ButtonShare.tag = indexPath.row
        cell.ButtonShare.addTarget(self, action: "sharedbuttonclicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //showLinkButton(cell.ButtonShare)

        // Configure the cell...

        return cell
    }
    

    func sharedbuttonclicked(sender:UIButton!){
        
        let contentstring = shareditems[sender.tag].name
        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: self.contentURL)
        content.contentTitle = contentstring
        content.contentDescription = self.contentDescription
        content.imageURL = NSURL(string: self.contentURLImage)
        
        let shareFB : FBSDKShareDialog = FBSDKShareDialog()
        
        shareFB.shareContent = content
        shareFB.delegate = self
        shareFB.show()
        
    }
    
    func sharer(sharer: FBSDKSharing!, didCompleteWithResults results: [NSObject : AnyObject]!) {
        print("didCompleteWithResults")
        alertShow("Sucessful Shared!")
    }
    
    func sharer(sharer: FBSDKSharing!, didFailWithError error: NSError!) {
        print("didFailWithError")
        alertShow("Failed with error!")
    }
    
    func sharerDidCancel(sharer: FBSDKSharing!) {
        print("sharerDidCancel")
        alertShow("Canceled!")
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
 
}
