trigger PrinterUserTrigger on User (after insert, after update) {

    List<Id> Userids = new List<Id>();
    List<Id> d_Userids = new List<Id>();
    
    If(Trigger.isInsert){
        for(User user:Trigger.new){
            if(User.isActive == True && User.Department=='Printers'){
                Userids.add(user.id);
            }
        }
             If(!Userids.isEmpty() ){
                CaseSync.addMembers(Userids);
            }
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        
        for(User user:Trigger.new){
            User oldUser = Trigger.oldMap.get(user.Id);
            if(user.IsActive == True && user.Department=='Printers'){
                Userids.add(user.Id);
                
            }
            if(oldUser.IsActive == False && user.IsActive == True && user.Department=='Printers'){
                Userids.add(user.id);
            }
            if(oldUser.IsActive == True && user.IsActive == True){
                d_Userids.add(user.id);
            }
        }
             If(!Userids.isEmpty() ){
                CaseSync.addMembers(Userids);
            }
        
              If(!d_Userids.isEmpty() ){
                CaseSync.deleteMembers(d_Userids);
            }
    }
    
}