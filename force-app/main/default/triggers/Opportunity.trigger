trigger Opportunity on Opportunity (before insert) {
    if(TriggerSupport.opportunityDisabled())
        return;
    
    Trigger.New[0].Name = 'Executou trigger';
}