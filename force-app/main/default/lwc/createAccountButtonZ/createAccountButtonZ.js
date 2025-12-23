import { LightningElement, api, wire } from 'lwc';
import getLead from '@salesforce/apex/LeadController.getLead';
import createAccountFromLead from '@salesforce/apex/LeadController.createAccountFromLead';

export default class CreateAccountButton extends LightningElement {
    @api recordId;

    isDisabled = true;
    showForm = false;

    // Form Fields
    accountName = '';
    industry = '';
    phone = '';
    website = '';
    errorMessage = '';

    lead = {};

    @wire(getLead, { leadId: '$recordId' })
    wiredLead({ data, error }) {
        if (data) {
            this.lead = data;
            const status = data.Status;
            this.isDisabled = status === 'Open - Not Contacted' || status === 'Working - Contacted';
        } else if (error) {
            console.error('Error fetching lead', error);
        }
    }

    handleOpenForm() {
        this.showForm = true;
    }

    handleCancel() {
        this.showForm = false;
        this.clearForm();
    }

    handleInputChange(event) {
        const field = event.target.dataset.id;
        this[field] = event.target.value;
    }

    handleSubmit() {
        const payload = {
            name: this.accountName,
            industry: this.industry,
            phone: this.phone,
            website: this.website,
            leadId: this.recordId
        };

        createAccountFromLead(payload)
            .then(() => {
                this.errorMessage = '';
                this.showForm = false;
                this.clearForm();
                // You can show toast here
                this.dispatchEvent(new CustomEvent('accountcreated'));
            })
            .catch(error => {
                this.errorMessage = error.body.message;
            });
    }

    clearForm() {
        this.accountName = '';
        this.industry = '';
        this.phone = '';
        this.website = '';
        this.errorMessage = '';
    }
}