import java.util.Scanner;

public class MainGame {




    public static void main(String [] args ){
        Scanner scan = new Scanner(System.in);
        System.out.println("Welcome to Snakes and Ladders, please enter the number of players: ");
        int numPlayers = scan.nextInt();

        Player[] playerArray = new Player[numPlayers]; //initialize array of players
        BoardGame board = new BoardGame(); //initialize game board
        Dice d = new Dice(); // new Dice for game

        for (int i = 0; i < numPlayers; i++){
            System.out.println("Enter the name of Player " + (i+1) + ": ");
            String name = scan.next();
            playerArray[i] = new Player(name);
        }

        boolean gameOver = false;

        while (!gameOver){
            for (Player i : playerArray){
                int moveBy = d.roll(); //roll the dice
                i.move(moveBy); //move the player by the value rolled by the dice
                board.myBoard[i.getPosition()] = i;

                if (i.getPosition() == 99){
                    System.out.println(i.name + " won the game.");
                    gameOver = true;
                    break;
                }
             }
        }

    }
}


