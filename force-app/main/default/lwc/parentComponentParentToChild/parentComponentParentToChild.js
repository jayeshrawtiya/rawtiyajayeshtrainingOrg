import { LightningElement } from 'lwc';

export default class ParentComponentParentToChild extends LightningElement 
{
    startCounter=0;

    handleStartChange(event)
    {
        this.startCounter=event.target.value;
    }

    handleClick()
    {
        const updateCounter = this.template.querySelector('c-child-component-parent-to-child');
        updateCounter.increaseCounter();

        //this.template.querySelector('c-child-component-parent-to-child').handleClick();
    }
    
}