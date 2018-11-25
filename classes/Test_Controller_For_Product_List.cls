@isTest
public class Test_Controller_For_Product_List {
@isTest
    public static void setup() {
        Product_Table__c product = new Product_Table__c(
        	Name = 'testProduct',
            Unit_Price__c = 777,
            Units_Available__c = 7,
            Title__c = 'Так себе продукт',
            Product_Description__c = 'Здесь описание'
        );
        insert product;
        
        String idFromUrl =  ApexPages.currentPage().getParameters().put('Id', product.Id);
        Controller_For_Product_List instanceController = new Controller_For_Product_List();
        instanceController.Search();
        instanceController.moveInDetailPage();
    }
}