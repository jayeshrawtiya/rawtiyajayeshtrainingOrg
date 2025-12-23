public class Assignment_9a_department 
{
    @future
    public static void Departmentupdate(Set<Id> UserIds)
    {
        List<User> userList = [SELECT Id, Name, Department FROM User WHERE ID IN:UserIds];
        for(User userX : userList)
        {
            userX.Department='Future_department_dd';
        }
        update userList;
    }
}

        
        /*       
        //Updating department with two diffrent ways
        
        
        //Way 1
        List<user> accountOwnerx = new List<user>();
        For(User Duser :[SELECT Id, Department From user Where Id IN (SELECT OwnerId FROM Account WHERE Id IN :updatedaccIds)])
        {
        	accountOwnerx.add(Duser);
        }
        for(user AUser:accountOwnerx)
        {
        	Auser.Department = 'xyz';
        }
        update accountOwnerx;
            
        
        
        //Update Department
  
        Map<Id, String> accountOwner = new Map<Id, string>();
        For(user Duser : [SELECT Id, department From user Where Id IN (SELECT OwnerId FROM Account WHERE Id IN :updatedaccIds)])
        {
             accountOwner.put(Duser.Id, Duser.Department);
            //Now I have all the user Ids and department in accountOwner which needs to be updated.
        }
        List<user> updatedUserDepartment = new List<user>(); //to save updated record
        for(Id key : accountOwner.keySet())
        {
            User Duser = [SELECT Id, department FROM User WHERE Id=:Key];
            Duser.department = 'xyz';
            updatedUserDepartment.add(Duser);
        }
        if(!updatedUserDepartment.isEmpty())
            update updatedUserDepartment;     */