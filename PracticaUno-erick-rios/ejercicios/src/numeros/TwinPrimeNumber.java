package numeros;

import java.util.Scanner;

public class TwinPrimeNumber{
    
    /**
     * @param  number
     * @return An array of booleans with which we initialize the sieve of eratosthenes
     */
    public static boolean[] findTwinPrimeNumber(int number) throws Exception{
        if(number < 5 || number >1000 ) throw new Exception("Remember! Input should be greater or equal to five and less or equal to 5!");
        boolean prime[] = new boolean[number + 1];
        for(int i = 0; i <= number; i++ ){
            prime[i] = true;
        }
        return prime;
    }
   
    /**
     * @param prime
     * @param number
     * @return an array where multiples of indices greater than two are eliminated. 
     *         Those that are not crossed out are primes. The process ends when the 
     *         square of the next confirmed prime number is greater than n.
     */
    public static boolean[] findMultipliesOfNumber(boolean[] prime, int number){
        for(int p = 2; p*p <= number; p++){
            if(prime[p] == true){
                for (int j = p * 2; j <= number; j += p){
                    prime[j] = false;
                }
            }
        }
        return prime;
    }

    
    /**
     * @param prime
     * @param number
     */
    public static void printPrimeNumber(boolean[] prime, int number){
        for(int k = number; k >= 2; k--){
            if(prime[k] == true && prime[k-2] == true){
                System.out.println(String.format("Entry: %d | Twin Prime Numbers: %d %d", number, k-2 , k));
                break;
            }
        }

    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String input = sc.nextLine();
        try{
            int number2 = Integer.parseInt(input);
            boolean[] primeOne = findTwinPrimeNumber(number2);
            boolean[] primeTwo = findMultipliesOfNumber(primeOne, number2);
            printPrimeNumber(primeTwo , number2);
        }catch (NumberFormatException ex) {
            System.out.println("You should enter a valid number or, at least a number");
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    } //end of method main
}//end of class TwinPrimeNumbers
