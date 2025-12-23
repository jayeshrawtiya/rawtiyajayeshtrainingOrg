import { LightningElement, wire,track } from 'lwc';
import getcontacts from '@salesforce/apex/lwc_foreachdemo.getcontacts'

export default class K_forEachDemo extends LightningElement 
{
    @track data=[];
    
    @wire(getcontacts)
    contact;
    
}