public class Controller_for_buy {
    
    public Product_Table__c productInfo {get; set;}
    public Id productId {get; set;}
    public Decimal totalPrice {get; set;}
    public Contact contact {get; set;}
    public Boolean showform { get; set; }
    public Integer unitCount { get;
                              set {
                                  unitCount = value;
                                  totalPrice = unitCount * productInfo.Unit_Price__c;
                              } 
                             }    
    
    public Controller_for_buy() {
        productId = apexpages.currentpage().getparameters().get('id');
        productInfo = [SELECT Id, Name, Unit_Price__c, Units_Available__c 
                       FROM Product_Table__c
                       WHERE Id =:  productId];
        unitCount = 1;
        contact = new Contact(); 
    }
    
    public PageReference createOrder() {
        Savepoint sp = Database.setSavepoint();
        try
        {    
            
            
            if ((productInfo.Units_Available__c - unitCount) < 0)
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'На складе нет доступного количества товара'));  
                showform = false;
            } 
            else
            {
                List<Contact> listContacts = [SELECT Id
                                          FROM Contact
                                          WHERE Email =: contact.Email];
            if(listContacts.size() > 0) {
                listContacts[0].FirstName = contact.FirstName;
                listContacts[0].LastName = contact.LastName; 
            } else {
                listContacts.add(contact);
            }
            upsert listContacts;
            System.debug('listContacts : ' + listContacts);
            
            
            Order_Table__c order = new Order_Table__c(
                Product__c = productId,
                Units__c = unitCount,
                Order_Amount__c = totalPrice,
                Contact__c = listContacts[0].Id
            );
            insert order;
            System.debug('order : ' + order);
                productInfo.Units_Available__c = productInfo.Units_Available__c - unitCount;
                update productInfo;
                System.debug('productInfo : ' + productInfo);
                
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Заказ оформлен'));  
                showform = false;  
                
                
            }
        } catch(Exception all) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Что то пошло не так '));
            Database.rollback(sp);
        }
        return null;
    }
}