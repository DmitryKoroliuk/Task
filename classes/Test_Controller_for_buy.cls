@isTest
public class Test_Controller_for_buy {
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
        System.debug('instance' + product);
        
        Contact con = new Contact(
        	FirstName = 'fName',
            LastName = 'lName',
            Email = 'qq@gmail.com'
        );
        insert con;
             
        String idFromUrl =  ApexPages.currentPage().getParameters().put('Id', product.Id);
        Controller_for_buy instanceController = new Controller_for_buy();
        Integer countContactsBefore = [SELECT COUNT() FROM Contact];
        
        instanceController.contact.Email = 'ee@gmail.com';
        instanceController.contact.LastName = 'aga';
        instanceController.createOrder();
        Integer countContactsAfter = [SELECT COUNT() FROM Contact];
        System.assertNotEquals(countContactsBefore, countContactsAfter);
        
        instanceController.contact.Email = 'qq@gmail.com';
        instanceController.createOrder();
        
        instanceController.unitCount = 10;
        instanceController.createOrder();
        System.assertEquals(false, instanceController.showform);
        
        instanceController.contact.LastName = '';
        instanceController.createOrder();
    }
}