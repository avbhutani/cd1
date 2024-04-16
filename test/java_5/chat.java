package java_5;
import java.util.Scanner;

public class chat {

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Welcome to chat app: ");
        
        while(true) 
        {
            System.out.print("Enter your message: ");
            String message = scanner.nextLine();
            System.out.println("You: " + message);
            System.out.println("Bot: Hello, you had sent " + message);

            if(message == "exit")
                break;
        }
    }
}
