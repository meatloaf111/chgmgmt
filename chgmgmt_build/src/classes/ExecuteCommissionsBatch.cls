global class ExecuteCommissionsBatch  implements Schedulable{
    public void execute(SchedulableContext sc){
    	Database.executeBatch(new BatchUpdateCommissions(),1);
            }
}