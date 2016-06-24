public class myControllr {
public boolean ShowpageBlockFlag{get;set;}
public account acc{get;set;}

public myControllr (){
acc=[select id,name,accountnumber from account limit 1];
ShowpageBlockFlag=false;
}

public pagereference ShowBlockMethod(){
ShowpageBlockFlag=true;
return null;
}
}