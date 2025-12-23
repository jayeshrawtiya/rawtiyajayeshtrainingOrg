import { LightningElement, track } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LASTNAME from '@salesforce/schema/Contact.LastName'
import EMAIL from '@salesforce/schema/Contact.Email'

export default class M_RecordForm extends LightningElement 
{
    objectApiName = CONTACT_OBJECT;
    recordId="0035g00001ADzPnAAL";
    @track fields = [LASTNAME, EMAIL];


}