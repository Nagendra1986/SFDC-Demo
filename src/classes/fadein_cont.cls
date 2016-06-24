public with sharing class fadein_cont {
 public boolean displayPopup {get; set;}
public void closePopup() {
        displayPopup = false;
    }
 
    public void showPopup() {
        displayPopup = true;
        
    }
}