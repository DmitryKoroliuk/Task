public class Controller_For_Product_List {
    
    public List<Product_Table__c> listProducts {get; set;}
    public String site {get; set;}
   
    
    
    public Controller_For_Product_List() {
        
        Search();
        
    }

    public void Search() {
        listProducts = [SELECT Id, Name, Title__c,  Product_Description__c, Image_Url__c, Unit_Price__c
                        FROM Product_Table__c LIMIT 100];
    }
    
    public String moveInDetailPage() {
        return site = '/apex/page_for_buy?';
    }
	
}