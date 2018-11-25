public class TriggerHandler {
    
    public static void searchWarehouse(List<Product_Table__c> products) {
        
        List<Warehouse__c> listWarehouse = [SELECT Id, Name, Period_Start__c, Period_End__c 
                                            FROM Warehouse__c];
        
        List<Warehouse__c> listForCreateNewWarehouse = new List<Warehouse__c>();
        
        /*
        for(Product_Table__c itemProduct : products) {
            if(itemProduct.Added_Date__c == null) {
                itemProduct.Added_Date__c = Date.today();
            }     
            for(Warehouse__c itemWarehouse : listWarehouse) {
                if(itemWarehouse.Period_Start__c <= itemProduct.Added_Date__c && itemWarehouse.Period_End__c >= itemProduct.Added_Date__c) {
                    itemProduct.Warehouse__c = listWarehouse[0].Id;
                } else {
                    Warehouse__c instanceWarehouse = new Warehouse__c(
                    	Name = 'Warehouse' + itemProduct.Added_Date__c + ' ' + itemProduct.Added_Date__c, //  + org configuration
                        Period_Start__c = itemProduct.Added_Date__c,
                        Period_End__c = itemProduct.Added_Date__c //  + org configuration
                    );
                    itemProduct.Warehouse__c = instanceWarehouse.Id;
                    listForCreateNewWarehouse.add(instanceWarehouse);
                }
            }
        }
        insert listForCreateNewWarehouse;
		*/
        
    }
}