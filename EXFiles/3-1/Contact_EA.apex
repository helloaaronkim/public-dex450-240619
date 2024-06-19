Contact contactToAdd = new Contact(FirstName='Aaaa', LastName='BBBB');
// contactToAdd.firstName = 'June';
// contactToAdd.lastName = 'Morgan';
insert contactToAdd;
System.debug('contactToAdd recordID is: ' + contactToAdd.Id);
