import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['Product__c.Image_Url__c'];

export default class ProductImage extends LightningElement {
    @api recordId;
    imageUrl;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    product({ data, error }) {
        if (data) {
            const fileName = data.fields.Image_Url__c.value;
            console.log('file name : ', fileName);
            if (fileName) {
                this.imageUrl = `/resource/flipkartproduct/${fileName}`;
                console.log('image url : ', this.imageUrl);
            }
        } else {
            console.error('Error loading product record:', error);
        }
    }
}