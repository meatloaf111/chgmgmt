public class Utils {
  @future
  public static void createWithdrawalHistory(List<Id> userIds) {
    List<WithdrawalHistory__c> histories = new List<WithdrawalHistory__c>();
    for(Id userId : userIds) {
      WithdrawalHistory__c history = new WithdrawalHistory__c();
      history.User__c = userId;
      histories.add(history);
    }
    if(!histories.isEmpty()) {
      insert histories;
    }
  }
}