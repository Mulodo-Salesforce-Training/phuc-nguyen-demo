<div id="table">
	<label for="">| CANDIDATE LIST |</label>
	<table id="candidate_data" class="slds-text-align_center slds-table slds-table_bordered slds-table_cell-buffer slds-no-row-hover">
		<thead>
			<tr class="slds-text-title_caps">
				<th scope="col">
			    	<div class="slds-truncate" title="Candidate Name">Candidate Name</div>
			    </th>
			    <th scope="col">
			    	<div class="slds-truncate" title="Candidate Phone">Candidate Phone</div>
			    </th>
			    <th scope="col">
			    	<div class="slds-truncate" title="Candidate Email">Candidate Email</div>
			    </th>
			</tr>
			</thead>
			<tbody ng-init="init();">
				<tr ng-repeat="candidate in data">
					<td data-label="Name">
                    <div class="slds-truncate" title="Name">
                    	<a href="#!/candidate/{{candidate.Id}}">
                    		{{candidate.First_Name__c + ' ' + candidate.Last_Name__c}}
                    	</a>
                    </div>
                </td>
                <td data-label="Phone">
                    <div class="slds-truncate" title="Phone">{{candidate.Phone__c}}</div>
                </td>
                <td data-label="Email">
                    <div class="slds-truncate" title="Email">{{candidate.Email__c}}</div>
                </td>
				</tr>
			</tbody>
	</table>
</div>