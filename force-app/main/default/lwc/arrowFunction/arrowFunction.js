import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ArrowFunction extends LightningElement 
{
    connectedCallback()
    {
        let callingfunction = this.DivisionFunction(10,2);
        let callingarrorwfunction = this.ArrowDivision(17,2);
        window.alert("normal function called :"+callingfunction);
        window.alert("Arrow function called : "+callingarrorwfunction);
    }

    DivisionFunction(dividend, divisor)
    {
        return (dividend/divisor);
    }

    ArrowDivision = (Dividend, Divisor) =>(Dividend/Divisor);
    
        //eturn (Dividend/Divisor);
    
}