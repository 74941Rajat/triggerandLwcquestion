import { LightningElement, wire } from 'lwc';
import accountData from '@salesforce/apex/FetchAccwithOpportunity.fetchData';
import deleteAccount from '@salesforce/apex/FetchAccwithOpportunity.deleteAccountaccToOppo';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class DisplayAccWithOppo extends NavigationMixin(LightningElement) {

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
        { label: 'Billing Country', fieldName: 'Contry', type: 'text' },
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

    wiredResult;

    @wire(accountData)
    wiredResult;



    get isRecordAvailable() {
        return this.wiredResult?.data?.length > 0;
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        switch (actionName) {
            case 'create_contact':
                this.createContact(row.AccountId);
                break;
            case 'delete_account':
                this.deleteAccount(row.AccountId);
                break;
            default:
                break;
        }
    }

    /* ---------------- CREATE CONTACT ---------------- */
    createContact(accountId) {
        const defaultValues = encodeDefaultFieldValues({
            AccountId: accountId
        });

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }

    /* ---------------- DELETE ACCOUNT ---------------- */
    async deleteAccount(accountId) {
        try {
            await deleteAccount({ accountId });

            this.showToast(
                'Success',
                'Account deleted successfully',
                'success'
            );

            // 🔄 Refresh Apex Data
            await refreshApex(this.wiredResult);

        } catch (error) {
            this.showToast(
                'Error',
                error.body?.message || 'Something went wrong',
                'error'
            );
        }
    }

    /* ---------------- TOAST UTILITY ---------------- */
    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
