trigger AuditHistory on Opportunity (after update) {
	    //get all fields from compliance that we want to check for changes
    Map<String, Schema.SObjectField> allComplFieldsMap = Schema.SObjectType.Audit_History__c.fields.getMap();
    Map<String, Schema.DescribeFieldResult> complFieldsToTrack = new Map<String, Schema.DescribeFieldResult>();
    for (Schema.SObjectField complField : allComplFieldsMap.values()) {
        Schema.DescribeFieldResult describeResult = complField.getDescribe();
        //choose which fields to track depending on the field type
        if (describeResult.getType() == Schema.DisplayType.Boolean ||
            describeResult.getType() == Schema.DisplayType.Combobox ||
            describeResult.getType() == Schema.DisplayType.Currency ||
            describeResult.getType() == Schema.DisplayType.Date ||
            describeResult.getType() == Schema.DisplayType.DateTime ||
            describeResult.getType() == Schema.DisplayType.Double ||
            describeResult.getType() == Schema.DisplayType.Email ||
            describeResult.getType() == Schema.DisplayType.Integer ||
            describeResult.getType() == Schema.DisplayType.MultiPicklist ||
            describeResult.getType() == Schema.DisplayType.Percent ||
            describeResult.getType() == Schema.DisplayType.Phone ||
            describeResult.getType() == Schema.DisplayType.Picklist ||
            describeResult.getType() == Schema.DisplayType.String ||
            describeResult.getType() == Schema.DisplayType.TextArea ||
            describeResult.getType() == Schema.DisplayType.Time ||
            describeResult.getType() == Schema.DisplayType.URL) 
        {
            //don't add standard fields that are not necessary
            if (describeResult.getName() != 'CreatedDate' &&
                describeResult.getName() != 'LastModifiedDate' &&
                describeResult.getName() != 'SystemModstamp' &&
                //only add fields that are visible to the current user
                describeResult.isAccessible() &&
                //do not add formula fields
                !describeResult.isCalculated()
                )
            {
                complFieldsToTrack.put(describeResult.getName(), describeResult);
            }
        }
    }
}