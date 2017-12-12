import controlP5.*;
 
ControlP5 cp5, cp6;
PFont f;
 
String url1, url2, url3, url4;
boolean gameOver;
Player[] playerArray;
BoardGame board;
Dice d;
ControlFont font;
int playerTurn;
 
void setup() {
  background(0);
  size(1200, 500);
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
  
  textFont(f, 24);
  fill(255);
  text("Welcome to Snakes and Ladders! Built by Rishu and Shoji", 10, 50);
  text("Please enter the player names (up to 4 players):", 10, 80);
  
  gameOver = false;
  playerTurn = 0;
}
 
 
void draw () {
  /*if (gameOver) {
    background(0);
    fill(255);
    text("Player wins!", 200, 200);
  }*/
}

void initGame() {
  int playerCount = 0;
  int newCount = 0;
  Player[] tempArray = new Player[4];
  
  if (!url1.equals("")) {
    playerCount += 1;
    tempArray[0] = new Player(url1, 160, 32, 240);
  }
  
  if (!url2.equals("")) {
    playerCount += 1;
    tempArray[1] = new Player(url2, 102, 205, 170);
  }
  
  if (!url3.equals("")) {
    playerCount += 1;
    tempArray[2] = new Player(url3, 49, 79, 79);
  }
  
  if (!url4.equals("")) {
    playerCount += 1;
    tempArray[3] = new Player(url4, 255, 165, 0);
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
  background(0);
  cp6 = new ControlP5(this);
  cp6.addButton("Roll").setPosition(500, 400).setSize(100, 40).setValue(0).activateBy(ControlP5.RELEASE); 
  cp6.getController("Roll").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
}

void doRolls(int x) {
  Player i = playerArray[x];
  int moveBy = d.roll(); //roll the dice
  i.move(moveBy); //move the player by the value rolled by the dice
  board.myBoard[i.getPosition()] = i;
  //System.out.println(i.name + " rolled " + moveBy + "! ");
  //System.out.println(i.name + " is now at position " + i.getPosition());
  
  fill(255);
  textFont(f, 24);
  text(i.name + " rolled " + moveBy + "! ", 500, 250);

  if (i.getPosition() == 99){
      //System.out.println(i.name + " won the game.");
      gameOver = true;
  } else if (board.snakes.get(i.getPosition()) != null){
      i.setPosition(board.snakes.get(i.getPosition()));
      //System.out.println(i.name + " has encountered a snake and is now at position " + (i.getPosition() + 1));
      textFont(f, 24);
      text(i.name + " has encountered a snake and is now at position " + (i.getPosition() + 1), 500, 300);
  } else if (board.ladders.get(i.getPosition()) != null){
      i.setPosition(board.ladders.get(i.getPosition()));
      //System.out.println(i.name + " has climbed a ladder and is now at position " + (i.getPosition() + 1));
      textFont(f, 24);
      text(i.name + " has climbed a ladder and is now at position " + (i.getPosition() + 1), 500, 300);
  }
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
  
  initGame();
  //System.out.println("Drawing board");
  drawBoard();
}

public void controlEvent(ControlEvent theEvent) {
  
}

public void Roll(int value) {
  background(0);
  textFont(f, 24);
  fill(255);
  text("Snakes and Ladders", 20, 50);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int x = i * 40 + 20;
      int y = j * 40 + 75;
      int square = i * 10 + j + 1;
      if (i % 2 == 1) {
          square = ((i * 10) + 10) - j;
      }
      
      if (square == 43 || square == 55 || square == 70 || square == 78 || square == 95 || square == 96) {
        //fill snakes
        fill(255, 0, 0);
        stroke(0);
        rect(x, y, 40, 40);
      } else if (square == 6 || square == 9 || square == 20 || square == 25 || square == 53 || square == 54 || square == 61) {
        //fill ladders
        fill(0, 255, 0);
        stroke(0);
        rect(x, y, 40, 40);
      } else if (square == 100) {
        fill(255, 255, 0);
        stroke(0);
        rect(x, y, 40, 40);
      } else if (square == 1) {
        fill(131, 139, 131);
        stroke(0);
        rect(x, y, 40, 40);
      } else {
        //fill other
        fill(255);
        stroke(0);
        rect(x, y, 40, 40);
      }
      
      for (int count = 0; count < playerArray.length; count++) {
        Player p = playerArray[count];
        if (square == p.getPosition() + 1) {
          fill(p.red, p.green, p.blue);
          stroke(0);
          rect(x, y, 40, 40);
          rect(475, 60 + (30 * count), 20, 20);
        }
      }
      
      fill(0);
      textFont(f, 24);
      if (square == 100) {
        text("W", x + 5, y + 30);
      } else {
        text(square, x + 5, y + 30);
      }
    }
  }
  if (!gameOver) {
    doRolls(playerTurn);
    if (playerTurn == playerArray.length - 1) {
      playerTurn = 0;
    } else {
      playerTurn++;
    }
  }
  fill(255);
  text("POSITIONS:", 500, 50);
  for (int k = 0; k < playerArray.length; k++) {
    int x = 500;
    int y = k * 30 + 80;
    fill(255);
    textFont(f, 24);
    text(playerArray[k].name + " at " + (playerArray[k].getPosition() + 1), x, y);
    
    if ((playerArray[k].getPosition() + 1) == 100) {
      text(playerArray[k].name + " wins!", x, 250);
    } 
  }
}