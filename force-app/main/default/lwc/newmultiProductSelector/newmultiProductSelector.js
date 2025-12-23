import { LightningElement, api, track } from 'lwc';
import searchProducts from '@salesforce/apex/ProductSelectorController.searchProducts';
import createOrderLinks from '@salesforce/apex/ProductSelectorController.createOrderLinks';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NewmultiProductSelector extends LightningElement {
    @api recordId; // Order Id
    @track searchKey = '';
    @track availableProducts = [];
    @track selectedProducts = [];

    // Computed: show product lists only if products are available
    get hasProducts() {
        return this.availableProducts.length > 0 || this.selectedProducts.length > 0;
    }

    handleSearch(event) {
    this.searchKey = event.target.value;

    if (this.searchKey.length > 1) {
        searchProducts({ searchKey: this.searchKey })
            .then(result => {
                // Add full image URL to each product object
                this.availableProducts = result.map(prod => ({
                    ...prod,
                    fullImageUrl: '/resource/flipkartproduct/flipkartproductImages/' + prod.Image_Url__c + '.png'
                }));
                this.selectedProducts = [];
            })
            .catch(error => {
                console.error('Error searching products:', error);
                this.showToast('Error', 'Failed to search products.', 'error');
            });
    }
    }

    handleAdd(event) {
        const id = event.currentTarget.dataset.id;
        const product = this.availableProducts.find(p => p.Id === id);
        if (product) {
            this.selectedProducts = [...this.selectedProducts, product];
            this.availableProducts = this.availableProducts.filter(p => p.Id !== id);
        }
    }

    handleRemove(event) {
        const id = event.currentTarget.dataset.id;
        const product = this.selectedProducts.find(p => p.Id === id);
        if (product) {
            this.availableProducts = [...this.availableProducts, product];
            this.selectedProducts = this.selectedProducts.filter(p => p.Id !== id);
        }
    }

    handleSubmit() {
        if (this.selectedProducts.length === 0) {
            this.showToast('Warning', 'Please select at least one product.', 'warning');
            return;
        }

        const selectedIds = this.selectedProducts.map(p => p.Id);

        createOrderLinks({
            orderId: this.recordId,
            productIds: selectedIds
        })
            .then(() => {
                this.showToast('Success', 'Products added to the order successfully.', 'success');
                this.selectedProducts = [];
                this.availableProducts = [];
                this.searchKey = '';
            })
            .catch(error => {
                console.error('Error creating order links:', error);
                this.showToast('Error', 'An error occurred while adding products.', 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}