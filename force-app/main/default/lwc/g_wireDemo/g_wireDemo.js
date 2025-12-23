import { LightningElement, wire, track } from 'lwc';
import wireDemoApexclass from '@salesforce/apex/lwc_wiredemoclass.getData';

const columns= [  {label: "Contact Name", fieldName: "Name"},
                  {label: "phone Number", fieldName: "Phone"}, ];


export default class G_wireDemo extends LightningElement 
{   
    @track columns= columns;
    @track data=[];

    //@wire(apexMethodname, {apexMethod parameters})        SYNTAX
    // whatever parameter we need to pass to apex from lwc will me mentioned in curly braces
    @wire(wireDemoApexclass)

    //if all records are fetched successfully that will be stored in data object.
    //if some error occurs whatever record will be fetched will be stored in error Object.
    wiredDta({data, error})
    {
        if(data)
        {
            this.data=data;
        }
        else if(error)
        {
            console.log("error Occured");
        }
    }
}