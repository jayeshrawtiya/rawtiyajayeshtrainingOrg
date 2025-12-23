import { LightningElement, api } from 'lwc';
import createAccount from '@salesforce/apex/LeadToAccount.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 
export default class CreateAccountForm extends LightningElement {
    @api recordId;
 
    accountName = '';
    industry = '';
    phone = '';
    website = '';
    errorMessage = ''; // for duplicate account error message.
    duplicateAccountId = ''; //for storing id of duplicate account.

 
    handleChange(event) {
        const field = event.target.dataset.id;
        this[field] = event.target.value;
    }
 
    async handleSubmit() {

        this.errorMessage = '';

        try {
            const result = await createAccount({
                name: this.accountName,
                industry: this.industry,
                phone: this.phone,
                website: this.website
            });
            
            if (result.isDuplicate) {
                this.duplicateAccountId = result.accountId;
                this.errorMessage = 'An account with this name and website already exists. ID: ';
                return; // do not close modal
            }

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'New account created successfully. ID:' +result.accountId,
                    variant: 'success'
                })
            );
 
            // Notify parent to close the modal
            this.dispatchEvent(new CustomEvent('closemodal'));
 
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }

    get duplicateAccountUrl() { //getter method for returning link of the existing account
    return this.duplicateAccountId
        ? `/lightning/r/Account/${this.duplicateAccountId}/view`
        : '#';
}

}