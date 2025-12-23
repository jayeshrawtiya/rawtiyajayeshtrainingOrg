import { LightningElement } from 'lwc';
import {showToastMessage} from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import CONTACT_LASTNAME from '@salesforce/schema/Contact.LastName';
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone';

export default class M_recordEditForm extends LightningElement 
{
    objectApiName = CONTACT_OBJECT;
    lastnamefield = CONTACT_LASTNAME;
    phonefield = CONTACT_PHONE;
    
    ContactId = "it will be displayed here" //provideing default value

    handleSuccess(eventX)
    {

        this.ContactId = eventX.detail.Id;
        //creating object
        const eventt= new showToastMessage({title:"Successful", 
                                            message:"Player created", 
                                            variant:"success"});

        
        this.dispatchEvent(eventt);
    }


}