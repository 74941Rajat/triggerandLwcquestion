import { LightningElement, wire, track, api } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

// ✅ Define columns properly here
const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Stage', fieldName: 'StageName', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
    { label: 'Account', fieldName: 'AccountName', type: 'text' }
];

export default class OpportunityWrapper extends LightningElement {
    @track opportunities;
    @track error;
    columns = COLUMNS;
    showModal = true; // controlled from button click

    @wire(getOpportunities)
    wiredOpportunities({ data, error }) {
        if (data) {
            this.opportunities = data.map(opp => ({
                ...opp,
                AccountName: opp.Account ? opp.Account.Name : ''
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.opportunities = undefined;
        }
    }

    closeModal() {
        this.showModal = false;
    }
}