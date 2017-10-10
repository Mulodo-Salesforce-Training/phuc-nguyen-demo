<div id="table" ng-controller="candidateList as vm" class="slds-text-align_center">
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
		<tbody>
			<tr ng-repeat="candidate in vm.data">
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
	<!-- pager -->
    <ul ng-if="vm.pager.pages.length" id="pagination">
        <li ng-class="{disabled:vm.pager.currentPage === 1}">
            <a ng-click="vm.setPage(1)">
            	<button class="slds-button slds-button_neutral">
            		First
        		</button>
            </a>
        </li>
        <li ng-class="{disabled:vm.pager.currentPage === 1}">
            <a ng-click="vm.setPage(vm.pager.currentPage - 1)">
            	<button class="slds-button slds-button_neutral">
            		Previous
        		</button>
        	</a>
        </li>
        <li ng-repeat="page in vm.pager.pages" ng-class="{active:vm.pager.currentPage === page}">
            <a ng-click="vm.setPage(page)">
            	<button class="slds-button slds-button_neutral">
            		{{page}}
        		</button>
            </a>
        </li>
        <li ng-class="{disabled:vm.pager.currentPage === vm.pager.totalPages}">
            <a ng-click="vm.setPage(vm.pager.currentPage + 1)">
            	<button class="slds-button slds-button_neutral">
            		Next
            	</button>
            </a>
        </li>
        <li ng-class="{disabled:vm.pager.currentPage === vm.pager.totalPages}">
            <a ng-click="vm.setPage(vm.pager.totalPages)">
	            <button class="slds-button slds-button_neutral">
	            	Last
	            </button>
	        </a>
        </li>
    </ul>
</div>