public class Player {
    public static String name;
    private static int position;

    public Player(){


    }

    public Player(String n){
        name = n;
        position = 0;
    }

    public boolean move(int x) {
        if ((position + x) > 99 ) {
            return false;
        } else {
            position += x;
            return true;
        }
    }

    public int getPosition() {
        return position;
    }
}

