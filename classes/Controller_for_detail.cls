public class Controller_for_detail {
    
    public Id productId {get; set;}
    public Product_Table__c products {get; set;}
    
    public Controller_for_detail() {
        productId = apexpages.currentpage().getparameters().get('id');
        products = [SELECT Id, Name, Title__c, Units_Available__c, Product_Description__c, Image_Url__c, Unit_Price__c
                    FROM Product_Table__c
                    WHERE Id =: productId];
    }
}