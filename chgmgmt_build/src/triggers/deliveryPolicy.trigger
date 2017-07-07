trigger deliveryPolicy on ContentDistribution (before insert) {
    for (ContentDistribution cd : trigger.new) {
        String versionId = DeliveryPolicyHelper.getContentVersionId(cd);
        ContentVersion version = [select DeliveryPolicy__c from ContentVersion where Id = :versionId];
        String policy = version.DeliveryPolicy__c;
        if (policy.equals('Blocked')) {
            cd.addError('This file is not allowed to be delivered.');
        } else if (policy.equals('Password required')){
            if (!DeliveryPolicyHelper.requirePassword(cd)) {
                cd.addError('To deliver this file, set a password.');
            }
        } 
    }
}