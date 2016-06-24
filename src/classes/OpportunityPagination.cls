public class OpportunityPagination{  
    public ApexPages.StandardSetController Con{        get {    
       if(con== null) {   
        con= new ApexPages.StandardSetController(Database.getQueryLocator([select name,closedate from Opportunity]));     
               }         
                  con.setPageSize(5);   
                    return con;  
                          }  
                          set;  
                      }
                    
       
             public Boolean hasNext {    
                 get {            
                 return con.getHasNext();    
                     }       
                  set;   
                   }
                   public Boolean hasPrevious {    
                       get {         
                          return con.getHasPrevious();     
                          }       
                           set;   
                            }
    public Integer pageNumber {      
      get {      
            return con.getPageNumber();   
         }     
           set; 
           }  
    public void first() {     
              con.first(); 
                 }
    public void last() {     
       con.last(); 
          }  
     public void previous() {  
           con.previous(); 
              }
     public void next()
      { 
            con.next(); 
               }  
   public void cancel() {   
        con.cancel(); 
          } 
     }