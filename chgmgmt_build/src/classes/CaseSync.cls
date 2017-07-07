public class CaseSync {
    
    @future
    public static void addMembers(List<Id> memberIds){
        
        List<GroupMember> ToInsertUserList = new List<GroupMember>();
        Group groupId = [Select Id From Group WHERE Name ='Printers Queue' LIMIT 1];
        
        for(Id u: memberIds){
            GroupMember gma = new GroupMember(GroupId = groupid.Id,UserorGroupId = u);
            ToInsertUserList.add(gma);
        }
        insert ToInsertUserList;
        
    }
    
    @future
    public static void deleteMembers(List<Id> memberIds){
        
        List<GroupMember> ToDeleteUserList = new List<GroupMember>();
        
        Group groupid = [select id from group where name ='Printers Queue' LIMIT 1];
        ToDeleteUserList = [select GroupId,UserOrGroupId  from GroupMember where Group.type='Queue' and GroupId = :groupId.Id and UserOrGroupId in :memberIds];
        
        delete ToDeleteUserList;
        
    }

}