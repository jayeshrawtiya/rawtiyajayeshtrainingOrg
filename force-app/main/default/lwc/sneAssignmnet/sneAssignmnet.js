import { LightningElement, track } from 'lwc';

export default class SneAssignmnet extends LightningElement 
{
    @track values={userName:"", emailAddress:"",  DOB:""}

    handleInput(eventx)
    {
        const field=eventx.target.name
        if(field=="userName")
        {
            this.values.userName=eventx.target.value;
        }
        else if(field=="emailAddress")
        {
            this.values.emailAddress=eventx.target.value;
        }
        else if(field=="DOB")
        {
            this.values.DOB=eventx.target.value;
        }
    }

    handleClick()
    {
        window.alert(this.values.userName+"\n"+this.values.emailAddress+ "\n"+this.values.DOB);
    }


}