<div id="table">
	<label for="">| CANDIDATE DETAIL |</label>
	<div id="info_detail">
		<h2>First Name: {{data.First_Name__c}}</h2>
		<h2>Last Name: {{data.Last_Name__c}}</h2>
		<h2>Phone: {{data.Phone__c}}</h2>
		<h2>Email: {{data.Email__c}}</h2>
	</div>
	<button id="remove_button" class="slds-button slds-button_destructive" ng-click="removeCan(); init();">Xóa</button>
</div>