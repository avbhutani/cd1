package java_5;
import java.util.Scanner;

public class armstrong {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int number = scanner.nextInt();
        int originalNumber = number;
        int result = 0;
        int power = String.valueOf(number).length() - 1;

        while (number != 0) {
            int digit = number % 10;
            result = result + (digit * (int)Math.pow(10, power));
            number /= 10;
            power--;
        }

        System.out.println(result + " " + originalNumber);

        if (result == originalNumber) {
            System.out.println(originalNumber + " is an Armstrong number.");
        } else {
            System.out.println(originalNumber + " is not an Armstrong number.");
        }
    }
}
