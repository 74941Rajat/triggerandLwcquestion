import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_NAME from '@salesforce/schema/Opportunity.StageName';
import getOpportunities from '@salesforce/apex/Q2_lwcOpportuntyStageController.oppostageFliter';

export default class Q2_LwcOpportunityStage extends LightningElement {
    stageOptions = [];
    selectedStage = 'All';
    showClosedDate = false;

    sortBy = 'Amount';
    sortDirection = 'desc';

    columns = [
        { label: 'Name', fieldName: 'Name', sortable: true },
        { label: 'Stage Name', fieldName: 'StageName', sortable: true },
        {
            label: 'Close Date',
            fieldName: 'CloseDate',
            type: 'date',
            sortable: true,
            typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: '2-digit'
            }
        },
        { label: 'Amount', fieldName: 'Amount', type: 'currency', sortable: true }
    ];

    baseColumns = [...this.columns];

    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    opportunityObjectInfo;

    @wire(getPicklistValues, {
        recordTypeId: '$opportunityObjectInfo.data.defaultRecordTypeId',
        fieldApiName: STAGE_NAME
    })
    stagePicklistHandler({ data, error }) {
        if (data) {
            const stageValues = data.values.map(item => ({
                label: item.label,
                value: item.value
            }));

            this.stageOptions = [
                { label: 'All Stages', value: 'All' },
                ...stageValues
            ];
        } else if (error) {
            console.error(error);
        }
    }

    @wire(getOpportunities, {
        stageName: '$selectedStage',
        sortBy: '$sortBy',
        sortDirection: '$sortDirection'
    })
    opportunities;

    handleStageChange(event) {
        this.selectedStage = event.detail.value;
    }

    handleShowCloseDate(event) {
        this.showClosedDate = event.target.checked;

        if (this.showClosedDate) {
            this.columns = [...this.baseColumns];
        } else {
            this.columns = this.baseColumns.filter(
                col => col.fieldName !== 'CloseDate'
            );
        }
    }

    handleSort(event) {
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
    }
}
