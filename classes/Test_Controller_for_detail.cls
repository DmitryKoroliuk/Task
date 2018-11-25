@isTest
public class Test_Controller_for_detail {
	@isTest 
    public static void setup() {
        Product_Table__c instance = new Product_Table__c(
        	Name = 'testProduct',
            Unit_Price__c = 777,
            Units_Available__c = 7,
            Title__c = 'Так себе продукт',
            Product_Description__c = 'Здесь описание'
        );
        insert instance;

       	String idFromUrl =  ApexPages.currentPage().getParameters().put('Id', instance.Id);

       	Controller_for_detail instanceController = new Controller_for_detail();
        System.assertEquals(instanceController.products.Id, instance.Id);
    }
}