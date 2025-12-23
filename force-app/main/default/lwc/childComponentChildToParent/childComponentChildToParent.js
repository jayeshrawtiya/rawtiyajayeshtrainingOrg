import { LightningElement } from 'lwc';

export default class ChildComponentChildToParent extends LightningElement 
{
    handleSubstract()
    {
        this.dispatchEvent(new CustomEvent('eventsub'))
        // we have dispatched an eventS event from here and will handle it in parentcomponent
    }



    handleAdd()
    {
        this.dispatchEvent(new CustomEvent('eventadd'))
       // we have dispatched an eventA event from here and will handle it in parentcomponent
    }

}