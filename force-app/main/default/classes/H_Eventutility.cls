public class H_Eventutility 
{
    public static String eventPriority(String eventstatus)
    {
        String eventPri;
        if(String.isBlank(eventStatus) || eventStatus.length()>2)
			return null;
        
        If(eventStatus == 'CA'){
            eventPri ='High';
            }
        else{
            eventPri = 'Medium';
        }
        return eventPri;   
    }
}