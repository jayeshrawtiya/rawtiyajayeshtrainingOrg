import { LightningElement } from 'lwc';

export default class H_conditionalRendering_lwcIfElse extends LightningElement 
{
    buttonLabel = "Button 3"
    property1 = false
    property2=false;

    handleClick()
    {
        if(this.property1 ==true)
        {
            this.property1 = false;
            this.property2 = true;
            this.buttonLabel = 'Button 2';
        }
        else
        {
            this.property2=false;
            this.property1=true;
            this.buttonLabel="Button 1"

        }

    }
}