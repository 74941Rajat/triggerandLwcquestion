import { LightningElement, wire } from 'lwc';
import getAccountlist from '@salesforce/apex/Q3_lwcAccountRelatedList.accountList';
import getRelatedRecords from '@salesforce/apex/Q3_lwcAccountRelatedList.relatedList';

export default class Q3_AccountRelatedList extends LightningElement {

    options = [];
    accId;

    cases = [];
    contacts = [];

    casesColumns = [
        { label: 'Case Number', fieldName: 'CaseNumber' },
        { label: 'Subject', fieldName: 'Subject' },
        { label: 'Status', fieldName: 'Status' }
    ];

    contactColumns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' }
    ];

    @wire(getAccountlist)
    allAccountList({ data, error }) {
        if (data) {
            this.options = data.map(acc => ({
                label: acc.Name,
                value: acc.Id
            }));
        } else if (error) {
            console.error(error);
        }
    }

    async handleChange(event) {
        this.accId = event.detail.value;

        try {
            const result = await getRelatedRecords({ accountId: this.accId });
            this.cases = result.cases || [];
            this.contacts = result.contacts || [];
        } catch (error) {
            console.error(error);
        }
    }
}
