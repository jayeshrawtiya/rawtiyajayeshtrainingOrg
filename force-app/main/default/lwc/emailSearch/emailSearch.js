import { LightningElement } from 'lwc';
import fetchAllRecordsRelatedToEmail from '@salesforce/apex/ProductSelectorController.fetchAllRecordsRelatedToEmail';
import { NavigationMixin } from 'lightning/navigation';

export default class EmailSearch extends NavigationMixin(LightningElement) {

    contactRecords=[];
    orderRecords=[];
    caseRecords=[];
    email = '';
    contactlength = 0;
    clickedSubmit = false;

    //Capturing Input
    handleChange(event)
    {
        this.email = event.target.value;
    }

    //Fetching contact, order, cases records on click of submit button.
    handleSubmit()
    {
        fetchAllRecordsRelatedToEmail({email:this.email})
            .then((result) => {
                if(result){
                    const plainresult = JSON.parse(JSON.stringify(result));
                    console.log('plainresult', plainresult);
                    this.contactRecords = result.contact;
                    this.orderRecords = result.orders;
                    this.caseRecords = result.cases;
                    this.clickedSubmit = true;
                }
                else{
                    this.contactRecords = [];
                    console.log('No records found');
                    this.clickedSubmit = true;
                }
            })
            .catch((error) => {
                console.log('Error : '+error);
            });
    }



    //Navigating to contact record on click
    handlecontactclick(event){
        const ContactIdx = event.currentTarget.dataset.id;
        console.log('Contact data id : ', ContactIdx);
        
        
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: ContactIdx,
                objectApiName: 'Contact',
                actionName: 'view'
            }
        });
    }


    //Navigating to order record on click
    handleorderclick(event){
        console.log('Order data id : '+event.currentTarget.dataset.id);
        const OrderIdx = event.currentTarget.dataset.id;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: OrderIdx,
                objectApiName: 'Orders__c',
                actionName: 'view'
            }   
        });
    }

    
    //Navigating to Case record on click
    handlecaseclick(event){
        console.log('case data id : '+event.currentTarget.dataset.id); 
        const CaseIdx = event.currentTarget.dataset.id;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: CaseIdx,
                objectApiName: 'Case',
                actionName: 'view'
            }
        });
    }

    //Getter methods used for diplaying template tag at necessary time
    get isNoContact(){
        return this.clickedSubmit && this.contactRecords.length === 0;
    }

    get hasContacts() {
        return this.clickedSubmit && this.contactRecords.length > 0;  
    }

    get hasOrders() {
        return this.clickedSubmit && this.orderRecords.length > 0;
    }

    get hasCases() {
        return this.clickedSubmit && this.caseRecords.length > 0;
    }
}