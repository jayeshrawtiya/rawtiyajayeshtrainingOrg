import { LightningElement, api, track } from 'lwc';
import searchProducts from '@salesforce/apex/ProductSelectorController.searchProducts';
import createOrderLinks from '@salesforce/apex/ProductSelectorController.createOrderLinks';

export default class MultiProductSelector extends LightningElement {
    @api recordId; 
    @track searchKey = '';
    @track products = [];
    @track selectedProductIds = [];

    get productOptions() {
        return this.products.map(prod => ({
            label: prod.Name,
            value: prod.Id
        }));
    }

    handleSearch(event) {
        this.searchKey = event.target.value;
        if (this.searchKey.length > 1) {
            searchProducts({ searchKey: this.searchKey })
                .then(result => {
                    this.products = result;
                })
                .catch(error => {
                    console.error('Error searching products:', error);
                });
        }
    }

    handleSelectionChange(event) {
        this.selectedProductIds = event.detail.value;
    }

    handleSubmit() {
        if (this.selectedProductIds.length === 0) {
            alert('Please select at least one product.');
            return;
        }

        createOrderLinks({
            orderId: this.recordId,
            productIds: this.selectedProductIds
        })
            .then(() => {
                console.log('then selectedProductIds : ',this.selectedProductIds);
                console.log('then recordId : ',this.recordId);
                alert('Products added to the order successfully.');
                this.selectedProductIds = [];
            })
            .catch(error => {
                console.log('catch selectedProductIds : ',this.selectedProductIds);
                console.log('catch recordId : ',this.recordId);
                console.error('Error creating links:', error);
                alert('Error occurred while adding products.');
            });
    }

    get hasProducts() {
    return this.products.length > 0;
}
}