public class ListsMapsController {

    public Map<String, String> inputFields { get; set; }

    public ListsMapsController() {
        inputFields = new Map<String, String> { 
            'firstName' => '', 'lastName' => '', 'age' => '0','experience'=>'' };
    }

    public PageReference submitFieldData() {
        doSomethingInterestingWithInput();
        return null;
    }
    
    public void doSomethingInterestingWithInput() {
        inputFields.put('age', (Integer.valueOf(inputFields.get('age')) + 10).format());
    }
   public List<String> people {
    get { 
        return new List<String>{'Winston', 'Julia', 'Brien'};
    }
    set;
}

public List<Integer> iter {
    get { 
        return new List<Integer>{0, 1, 2};
    }
    set;
} 
}