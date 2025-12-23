import { LightningElement } from 'lwc';

export default class L_comboboxDemo extends LightningElement 
{
    value=''; // by default it will be empty till the time user select any option
    
    get options() //creating option and its value
    {
        return[
            {label:"new", value:"first value"},  //option1
            {label:"old", value:"second value"}, //option2
        ];
    }

    handleChange(event)
    {
        this.value = event.detail.value;
    }
}