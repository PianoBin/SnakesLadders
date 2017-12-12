public class Player {
    public String name;
    private int position;
    public int red;
    public int green; 
    public int blue;

    public Player(){


    }

    public Player(String n, int r, int g, int b){
        name = n;
        position = 0;
        red = r;
        green = g;
        blue = b;
    }

    public boolean move(int x) {
        if ((position + x) > 100 ) {
            return true;
        } else {
            position += x;
            return true;
        }
    }

    public int getPosition() {
        return position;
    } //getter
    public void setPosition(int x) {position = x;} //setter
}