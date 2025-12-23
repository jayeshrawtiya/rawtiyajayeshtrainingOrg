import { LightningElement, api } from 'lwc';

//Importing Object
import Account_object from '@salesforce/schema/Account'
//Importing fields
import Name_field from '@salesforce/schema/Account.Name'
import Phone_field from '@salesforce/schema/Account.Phone'
import Website_field from '@salesforce/schema/Account.Website'


export default class M_recordViewForm extends LightningElement 
{
   
    objectApiName=Account_object;
    nameField=Name_field;
    phoneField=Phone_field;
    websiteField=Website_field;

    recordId = "0015g00001U9jiGAAR";
   

    /*
    If we are deploying this lwc component to recordPage we don't need to pass recordId and object Api name
    it will be fetched automatically if we decorate them with @api
    like this

    @api recordId;
    @api ObjectApiNAme;

    */

}