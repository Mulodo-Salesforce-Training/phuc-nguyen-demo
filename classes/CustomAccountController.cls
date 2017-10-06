public class CustomAccountController {
	@RemoteAction
	public static List<Account> GetAllAccountsByFilter( String searchText ) {
		String searchString       = '%' + searchText + '%';
		List<Account> accountList = [SELECT Name, AccountNumber FROM Account WHERE Name LIKE :searchString];
		return accountList;
	}

	public CustomAccountController() {

	}
}