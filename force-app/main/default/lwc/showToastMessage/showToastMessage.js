import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShowToastMessage extends LightningElement 
{
    myTitle = 'Salesforce NOOB';

    //First function
    handleClick()
    {
        this.showToast(this.myTitle); // passing argument to function 2
    }



    //second function
    showToast(args)
    {
        //creating event
        const eventName= new ShowToastEvent({
            title:args,       //title will be recieved from function 1
            message:'want to display toast example', 
            variant:'error'})

            
        //now to fire the above event we need dispatchEvent function
        this.dispatchEvent(eventName);
    }


}

//Whenever an buttonclick will be called first function handle click willbe called 
//and handleClick function will call second function ShowToast which will display toast