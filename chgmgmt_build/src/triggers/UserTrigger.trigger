trigger UserTrigger on User (before insert, before update, after insert, after update) {

  List<Id> userIds = new List<Id>();
  if( Trigger.isAfter && Trigger.isUpdate ) {
    // Handle for deactived User
    for(User user : Trigger.new) {
      User oldUser = Trigger.oldMap.get(user.Id);
      if(user.IsActive == false && user.IsActive != oldUser.IsActive) {
        // When user is deactivated
        userIds.add(user.Id);
      }
    }
  }
  if(!userIds.isEmpty()) {
    // Insert with @future method
    Utils.createWithdrawalHistory(userIds);
  }
}