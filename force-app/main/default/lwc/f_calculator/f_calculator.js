import { LightningElement, track } from 'lwc';

export default class F_calculator extends LightningElement 
{
    //for creating object: ObjectName = {fieldName: ”fieldValue”,  fieldName: ”fieldValue”}
    @track Values ={number1:"", number2:""};

    handleNumber(eventx)
    {
        //to know user in enter which number & to access that value
        const field = eventx.target.name;
       
        if(field=='number1')
        {
            this.Values.number1 = eventx.target.value;
        }
        else if(field=='number2')
        {
            this.Values.number2 = eventx.target.value;
        }
    }

    handleClick(eventy)
    {
        const button = eventy.target.name;
        if(button == "add")
        {
            //let res = this.Values.number1+this.Values.number2;
            window.alert(parseInt(this.Values.number1)+parseInt(this.Values.number2));
        }
        else if(button == "Sub")
        {
            window.alert((this.Values.number1)-(this.Values.number2));
        }
        else if(button == "mult")
        {
            window.alert(this.Values.number1*this.Values.number2);
        }
        else if(button == "div")
        {
            window.alert(this.Values.number1/this.Values.number2);
        }
    }
}

/*

Assingment 1 :-Create a new Lightning App.- 
Create a new record page for Contact Object.- 
Create a Home Page for your App.

Assingment 2 :-Create a new lightning component to perform 
Additon, Substraction, Multiplication, Division operation.
-Add the component to your App's home page.

*/