public with sharing class AccountListController {
    
    //抽出対象となるフィールドリスト
    static List<String> TARGET_FILEDS = new List<String>{
        'Id','Name','BillingPostalCode','BillingState'
    };
        
    public SearchCondition condition{ get; set;}        //検索条件
    public List<Account> results { get; set;}           //検索結果リスト
    public String sortingField { get; set;}                     //見出しのソート
    
    public void init(){
        this.condition = new SearchCondition();
        this.results = new List<Account>();
    }
    
    public PageReference clear(){
            init();
            return null;
    }
    
    public PageReference search(){
        if(condition.validate()){
                return null;
        }
        
        //検索条件からSOQLを作成
        String soqlQuery = condition.getSoqlQuery();
        System.debug('[soql]' + soqlQuery);
        
        try{
            this.results = database.query(soqlQuery);
        }catch(DmlException e){
                ApexPages.addMessages(e);
        }catch(Exception e){
                ApexPages.addMessages(e);
        }
        return null;
        }
        
    public PageReference sort(){
        if(this.sortingField == null){
            return null;
        }
        
        if(this.sortingField == this.condition.sortkey){
                this.condition.setOrderReverse();
        }
        else{
                this.condition.sortkey = this.sortingField;
        }
        
        search();
        return null;
    }
    
    public String getSortKey(){
            return this.condition.sortkey;
    }
    
    public String getSortOrder(){
        return this.condition.sortOrderToString();
    }
    
    public class SearchCondition{
        
        private Time JST_AM0 = Time.newInstance(9, 0, 0, 0);
        
        public Account obj {get; set;}
        
        public String sortkey { get; set;}
        public String order { get; set;}
        
        public SearchCondition(){
                this.obj = new Account();
            
                sortkey = 'LastModifiedDate';
                order = 'DESC';
        }
        
        public boolean validate(){
                boolean isError = false;
                return isError;
    }
        
        public String getSoqlQuery(){
            List<String> param = new String[]{ getFieldList(),getWhere(),getOrder()};
                return String.format('SELECT {0} FROM Account {1}{2} LIMIT 500',param);
        }
        
        private String getFieldList(){
            return String.join(TARGET_FILEDS ,',');
        }
        
        private String getWhere(){
            List<String> param = new String[]{};
                
                if(!String.isBlank(this.obj.Name)){
                    param.add('Name = \'' + obj.Name +'\'');
                }
            
               if(!String.isBlank(this.obj.BillingPostalCode)){
                    param.add('BillingPostalCode = \'' + obj.BillingPostalCode +'\'');
                }
            
               if(!String.isBlank(this.obj.BillingState)){
                    param.add('BillingState = \'' + obj.BillingState +'\'');
                }
            
            if(param.isEmpty()){
                    return '';
            }
            return 'WHERE  ' + String.join(param, ' AND ');
         }
        
        private String getOrder(){
            List<String> param = new String[]{ sortkey, order};
                return String.format('ORDER BY {0} {1}',param);
        }
        
        private DateTime getSTartOfDay(Date d){
            JST_AM0 = Time.newInstance(15, 0, 0, 0);
            return Datetime.newInstance(d.addDays(-1),JST_AM0);
        }
        
        public String sortOrderToString(){
            if(this.order == 'DESC'){
                    return '▼';
            }
            return '▲';
        }
        
        public void setOrderReverse(){
            if(this.order == 'DESC'){
                    this.order = 'ASC';
            }
            else{
                this.order = 'DESC';
            }

        }

            
            
            }
}