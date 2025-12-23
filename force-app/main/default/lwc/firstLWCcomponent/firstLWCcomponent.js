import { LightningElement } from 'lwc';

export default class FirstLWCcomponent extends LightningElement
{
    myTitle = "Hello World";

    connectedCallback()
    {
        let leta="let printed ";
        if(this.myTitle)
        {
            var vara ="var printed | ";
        }
        //window.alert("V :"+vara+"L :"+leta);  
    }


    handleClick()
    {
        window.alert("Alert is displayed");
    }
}