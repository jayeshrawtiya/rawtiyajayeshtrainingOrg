import { LightningElement, track} from 'lwc';
import getcontacts from '@salesforce/apex/lwc_imperatoivedemo.getcontacts'

const columns= [  {label: "Contact Name", fieldName: "Name"},
                  {label: "phone Number", fieldName: "Phone"}, ];

export default class J_imperativeDemo extends LightningElement 
{
    @track columns=columns;
    @track data=[];
    connectedCallback()
    {
        //calling imperative method
        //whenever we call apex method two thing are returned from apex 
        //first one is promise i.e. if method is returning all the data successfully.

        getcontacts()
            .then(result=> {this.data=result;})
            .catch(error => {console.log("error occured");})

    }
}