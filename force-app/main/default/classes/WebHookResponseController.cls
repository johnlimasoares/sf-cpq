/**********
 * Author:John Lima
 * Description:Class to handle webhook from anything
 * Date:20/08/2021
 *********/
@RestResource(UrlMapping='/PushWebhook/*')
global without sharing class WebHookResponseController {
    
    @HttpPost  
    global static void handleNotification() {
        try {       
         
            Case a = new Case();
            a.Status = 'New';
            a.Origin = 'Phone';
            a.Description = 'Request Bodys:' + RestContext.request.requestBody.toString() + ' - ' +  RestContext.request.params;
            insert a;
        }catch(Exception e) {
            Case a = new Case();
            a.Status = 'New';
            a.Origin = 'Phone';
            a.Description = e.getMessage();
            insert a;
        }
    }

}