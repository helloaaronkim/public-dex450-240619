List<Account> accounts = [SELECT Name FROM Account];

for (Account account : accounts) {
    System.debug(account.Name);
    System.debug(account.Description);
}