public class studentsearch {
public string searchfield{get;set;}
public string keyword {get;set;}
public List<SelectOption> getFields() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('Organisation','Organisation'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }

}