trigger Trigger_for_Product_Table on Product_Table__c (before insert) {
    
    if(trigger.isBefore && trigger.isInsert) {
    	TriggerHandler.searchWarehouse(trigger.new); 
    }
}