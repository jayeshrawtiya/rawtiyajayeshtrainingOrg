import { LightningElement, api, wire } from 'lwc';
import getLeadStatus from '@salesforce/apex/LeadToAccount.getLead';

export default class LeadToAccountButton extends LightningElement {
    @api recordId;
    isModalOpen = false;
    disableButton = false;

    lead = {};

    @wire(getLeadStatus, { leadId: '$recordId' })
    wiredLeadStatus({ data, error}) {
        if (data) {
            this.lead = data;
            const status = data.Status;
            this.disableButton = status === 'Open - Not Contacted' || status === 'Working - Contacted';
        } else if (error) {
            console.error('Error fetching lead', error);
        }
    }

    openModal() {
        this.isModalOpen = true;
    }

    closeModal() {
        this.isModalOpen = false;
    }
}