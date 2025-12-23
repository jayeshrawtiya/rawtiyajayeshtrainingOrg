import { LightningElement, api, wire } from 'lwc';
import fetchRelatedProduct from '@salesforce/apex/ProductSelectorController.fetchRelatedProduct';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';

export default class DisplayRelatedProducts extends NavigationMixin(LightningElement) {
    @api recordId;
    products = [];
    error;
    wiredResult;

    @wire(fetchRelatedProduct, { orderId: '$recordId' })
    wiredProducts(result) {
        this.wiredResult = result;
        const { data, error }=result;
        if (data) 
            this.products = data;
        else if (error) {
            console.log('error : ', error);
            this.products = [];
        }
    }

    handleNavigation(event) {
        const recordIdx = event.currentTarget.dataset.id;
        console.log('recordx value ---- :', recordIdx);

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordIdx,
                objectApiName: 'Product__c',
                actionName: 'view'
            }
        });
    }

    connectedCallback() {
        if (this.wiredResult) {
            refreshApex(this.wiredResult);
            }
    }
}