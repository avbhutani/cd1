package java_5;

public class fibonacci {
    public static void main(String[] args) {
        int n = 10; // number of terms in the series
        int firstTerm = 0;
        int secondTerm = 1;
        
        System.out.print("Fibonacci Series: ");
        
        for (int i = 1; i <= n; i++) {
            System.out.print(firstTerm + " ");
            
            int nextTerm = firstTerm + secondTerm;
            firstTerm = secondTerm;
            secondTerm = nextTerm;
        }
    }
}
