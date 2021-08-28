public class TriggerSupport {
    private static Boolean disabledTriggerToDMLOperation = false;

    public static Boolean opportunityDisabled() {return getInstance().Opportunity_Disabled__c || disabledTriggerToDMLOperation;}
    private static TriggerSupport__c getInstance() {return TriggerSupport__c.getInstance(UserInfo.getProfileId());}
    
    public static void upsertTriggerDisabled(List<SObject> sObjects) {
        disabledTriggerToDMLOperation = true;
        upsert sObjects;
        disabledTriggerToDMLOperation = false;
    }
}