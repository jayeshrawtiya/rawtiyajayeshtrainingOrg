import { LightningElement, track } from 'lwc';

export default class I_Ifconditional extends LightningElement 
{
    @track onclicklabel = 'Show';
    MyTitle='Salesforce';
    @track cardVisible=false;

    handleClick(EventX)
    {
        const labelx=EventX.target.label;
        if(labelx == 'Show')
        {
            this.onclicklabel='Hide';
            this.cardVisible = true;
        }
        else if(labelx=='Hide')
        {
            this.onclicklabel = 'Show';
            this.cardVisible = false;
        }
    
    }
}