// List<Account> accounts = [SELECT Name FROM Account];

// for (Account account : accounts) {
//     System.debug(account.Name);
//     System.debug(account.Description);
// }

// // bind query

// Set<String> caseSet = new Set<String>{'00001005', '00001020'};


// List<String> caseList = new List<String>();
// caseList.add('00001005');
// caseList.add('00001020');

// List<Case> result = [SELECT Subject, CaseNumber FROM Case WHERE CaseNumber IN :caseList];

// for (Case aCase : result) {
//     System.debug('CASE=' + aCase);
// }

// SELECT ID, Name, Account.ID, Account.Name FROM Contact

// SELECT ID, Instructor__r.Name, Name, Course__r.Name FROM Course_Delivery__c


// //データベースからデータを取得 
// List<Contact> contactsToModel = [SELECT id, AccountId, Account.Name
//                                  FROM contact WHERE AccountId != null]; 
// Contact contactToModel = contactsToModel[0];
// //ID AccountId 項目を使用して、新規取引先責任者を contactToModel と
// //同じ取引先に関連付ける
// Contact ContactToAdd = new Contact(AccountID=contactToModel.AccountId, Lastname = 'Wayne');

// insert ContactToAdd;

// //取引先の名前の項目を使用して、新規取引先責任者に追加した取引先の名前を出力する
// System.debug('新規取引先責任者の取引先: ' + contactToModel.Account.Name);


// SELECT Name, Account.Name FROM Contact WHERE Lastname = 'Wayne'

// SELECT id, AccountId, Account.Name FROM contact WHERE AccountId != null


// SELECT id, name, Status__c, certification_element__c, 
//             certification_element__r.name, certification_candidate__r.name, certification_candidate__r.Account.name
//             FROM Certification_Attempt__c
//             WHERE status__c = 'Scheduled'

// SELECT Name, Certification__r.Name FROM Course__c WHERE Certification__c <> NULL


// SELECT Name, (SELECT Name FROM Contacts) FROM Account


// SELECT Name, (SELECT Name FROM Course_Deliveries__r) FROM Course__c

// Certification_Element__c ce = new Certification_Element__c();


Certification_Element__c element = new Certification_Element__c();

Contact aaa = new Contact(Name='Test');
insert aaa;


Contact withName = new Contact(LastName = 'Hines');
Contact noName = new Contact();
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
contacts.add(noName);
insert contacts; 


Contact withName = new Contact(LastName = 'Hines');
Contact noName = new Contact();
List<Contact> contacts = new List<Contact>();
contacts.add(withName);
contacts.add(noName);
Database.insert(contacts, false);

SELECT LastName FROM Contact WHERE LastName = 'Hines'



List<Contact> contacts = new List<Contact>();
Contact noName = new Contact();
Contact anotherNoName = new Contact();

Contacts.add(noName);
Contacts.add(anotherNoName);

try {
    insert contacts;
} catch (DMLException e){
    System.debug('DML 例外の発生: ' + e); 
} catch (Exception e) {
    System.debug('一般例外の発生: ' + e);
} finally {
    System.debug('例外の発生有無によらず実行');
}
