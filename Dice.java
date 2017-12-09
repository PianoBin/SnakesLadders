import java.util.Random;
public class Dice {

    public int roll(){
        Random n = new Random();
        int x = n.nextInt(6) + 1;

        return x;
    }
}
