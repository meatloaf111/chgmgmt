public class DeliveryPolicyHelper {
    public static String getContentVersionId(ContentDistribution cd) {
        if (cd.ContentVersionId != null) {
            return cd.ContentVersionId;
        } else {
            String versionId = [select LatestPublishedVersionId from ContentDocument where Id = :cd.ContentDocumentId].get(0).LatestPublishedVersionId;
            return versionId;
        }
    }
    
    public static boolean requirePassword(ContentDistribution cd) {
        return cd.PreferencesPasswordRequired;
    }
}