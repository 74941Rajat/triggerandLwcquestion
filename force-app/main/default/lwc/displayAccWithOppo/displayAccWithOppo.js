import { LightningElement, wire } from 'lwc';
import accountData from '@salesforce/apex/FetchAccwithOpportunity.fetchData';

export default class DisplayAccWithOppo extends LightningElement {

    columns = [
        {
            label: 'Account Name',
            fieldName: 'Nameurl',
            type: 'url',
            typeAttributes: {
                label: { fieldName: 'Name' },
                target: '_blank'
            }
        },
        { label: 'Type', fieldName: 'Type', type: 'text' },
        { label: 'Billing Country', fieldName: 'Country', type: 'text' },
        { label: 'Total Opportunity', fieldName: 'TotalOpportunity', type: 'number' },
        {
            type: 'button',
            typeAttributes: {
                label: 'Create Contact',
                name: 'create_contact',
                variant: 'brand'
            }
        },
        {
            type: 'button',
            typeAttributes: {
                label: 'Delete Account',
                name: 'delete_account',
                variant: 'destructive'
            }
        }
    ];

    @wire(accountData)
    accountResult;

    get isRecordAvailable() {
        return this.accountResult?.data?.length > 0;
    }
}
