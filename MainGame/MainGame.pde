import controlP5.*;
 
ControlP5 cp5, cp6;
PFont f;
 
String url1, url2, url3, url4;
boolean gameOver;
Player[] playerArray;
BoardGame board;
Dice d;
ControlFont font;
boolean rolled;
 
void setup() {
  size(700, 500);
  f = createFont("Arial",16,true);
  font = new ControlFont(f, 16);
  cp5 = new ControlP5(this);
  cp5.addTextfield("Player 1 Name").setPosition(20, 100).setSize(200, 40).setAutoClear(false);
  cp5.addTextfield("Player 2 Name").setPosition(20, 170).setSize(200, 40).setAutoClear(false);
  cp5.addTextfield("Player 3 Name").setPosition(20, 240).setSize(200, 40).setAutoClear(false);
  cp5.addTextfield("Player 4 Name").setPosition(20, 310).setSize(200, 40).setAutoClear(false);
  cp5.addBang("Submit").setPosition(240, 170).setSize(100, 40);    
  url1 = "";
  url2 = "";
  url3 = "";
  url4 = "";
  cp5.getController("Player 1 Name").getCaptionLabel().setFont(font);
  cp5.getController("Player 1 Name").getValueLabel().setFont(font);
  cp5.getController("Player 2 Name").getCaptionLabel().setFont(font);
  cp5.getController("Player 2 Name").getValueLabel().setFont(font);
  cp5.getController("Player 3 Name").getCaptionLabel().setFont(font);
  cp5.getController("Player 3 Name").getValueLabel().setFont(font);
  cp5.getController("Player 4 Name").getCaptionLabel().setFont(font);
  cp5.getController("Player 4 Name").getValueLabel().setFont(font);
  cp5.getController("Submit").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  
  gameOver = false;
}
 
 
void draw () {
  background(0);
  if (url1.equals("") && url2.equals("") && url3.equals("") && url4.equals("")) {
    textFont(f, 24);
    fill(255);
    text("Welcome to Snakes and Ladders! Built by Rishu and Shoji", 10, 50);
    text("Please enter the player names (up to 4 players):", 10, 80);
  } else {
    initGame();
    drawBoard();
    while (!gameOver) {
      if (rolled) {
        for (Player i : playerArray){
          int moveBy = d.roll(); //roll the dice
          i.move(moveBy); //move the player by the value rolled by the dice
          board.myBoard[i.getPosition()] = i;
          System.out.println(i.name + " rolled " + moveBy + "! ");
          System.out.println(i.name + " is now at position " + i.getPosition());
  
          if (i.getPosition() == 99){
              System.out.println(i.name + " won the game.");
              gameOver = true;
              break;
          } else if (board.snakes.get(i.getPosition()) != null){
              i.setPosition(board.snakes.get(i.getPosition()));
              System.out.println(i.name + " has encountered a snake and is now at position " + i.getPosition());
          } else if (board.ladders.get(i.getPosition()) != null){
              i.setPosition(board.ladders.get(i.getPosition()));
              System.out.println(i.name + " has climbed a ladder and is now at position " + i.getPosition());
          }
        }
      rolled = false;
      }
    }
  }
}

void initGame() {
  int playerCount = 0;
  int newCount = 0;
  Player[] tempArray = new Player[4];
  
  if (!url1.equals("")) {
    playerCount += 1;
    tempArray[0] = new Player(url1);
  }
  
  if (!url2.equals("")) {
    playerCount += 1;
    tempArray[1] = new Player(url2);
  }
  
  if (!url3.equals("")) {
    playerCount += 1;
    tempArray[2] = new Player(url3);
  }
  
  if (!url4.equals("")) {
    playerCount += 1;
    tempArray[3] = new Player(url4);
  }
  
  //System.out.println(playerCount);
  
  playerArray = new Player[playerCount]; //initialize array of players
  board = new BoardGame(); //initialize game board
  d = new Dice(); // new Dice for game

  for (int i = 0; i < 4; i++){
      if (tempArray[i] != null) {
        playerArray[newCount] = tempArray[i];
        newCount += 1;
      }
  }
}

void drawBoard() {
  textFont(f, 24);
  fill(255);
  text("Snakes and Ladders", 20, 50);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int x = i * 40 + 20;
      int y = j * 40 + 75;
      fill(255);
      stroke(0);
      rect(x, y, 40, 40);
      fill(0);
      int square = i * 10 + j + 1;
      text(square, x, y + 40);
    }
  }
  fill(255);
  text("POSITIONS:", 500, 50);
  for (int k = 0; k < playerArray.length; k++) {
    int x = 500;
    int y = k * 30 + 80;
    fill(255);
    text(playerArray[k].name + " at " + playerArray[k].getPosition(), x, y);
  }
  cp6 = new ControlP5(this);
  cp6.addButton("Roll").setPosition(500, 400).setSize(100, 40); 
  cp6.getController("Roll").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  rolled = true;
}
 
void Submit() {
  print("the following text was submitted :");
  url1 = cp5.get(Textfield.class,"Player 1 Name").getText();
  url2 = cp5.get(Textfield.class,"Player 2 Name").getText();
  url3 = cp5.get(Textfield.class,"Player 3 Name").getText();
  url4 = cp5.get(Textfield.class,"Player 4 Name").getText();
  print(" textInput 1 = " + url1);
  print(", textInput 2 = " + url2);
  print(", textInput 3 = " + url3);
  print(", textInput 4 = " + url4);
  println();
  cp5.remove("Player 1 Name");
  cp5.remove("Player 2 Name");
  cp5.remove("Player 3 Name");
  cp5.remove("Player 4 Name");
  cp5.remove("Submit");
  background(0);
}

void Roll() {
  rolled = true;
}