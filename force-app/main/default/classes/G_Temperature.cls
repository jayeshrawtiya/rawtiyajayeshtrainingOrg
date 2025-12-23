public class G_Temperature 
{
    //Temprature convert class
    Public static Decimal FtoC(decimal fh)
    {
        Decimal result = (fh-32)*5/9;
        return result.setScale(2);   
    }
}