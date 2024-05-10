public class Main {
    public static void main(String[] args) {
        int n = 10; // Number of terms in the Fibonacci series
        System.out.println("Fibonacci series of " + n + " terms:");
        int prev = 0, curr = 1;
        for (int i = 1; i <= n; ++i) {
            System.out.print(prev + " ");
            int sum = prev + curr;
            prev = curr;
            curr = sum;
        }
    }
}
