import java.util.AbstractMap;
import java.util.*;
import java.util.HashMap;

public class BoardGame {

 public Player[] myBoard = new Player[102];

 // first value: value landed at
 // second value: value taken to

 //hardcoded snakes map

HashMap<Integer, Integer> snakes = new HashMap<Integer, Integer>();

    {
        snakes.put(43, 16);
        snakes.put(55, 34);
        snakes.put(70, 48);
        snakes.put(78, 42);
        snakes.put(95, 73);
        snakes.put(96, 82);
    }



HashMap<Integer, Integer> ladders = new HashMap<Integer, Integer>();
    {
         ladders.put(6, 27);
         ladders.put(9, 50);
         ladders.put(20, 39);
         ladders.put(25, 57);
         ladders.put(53, 72);
         ladders.put(54, 85);
         ladders.put(61, 82);
    }

}