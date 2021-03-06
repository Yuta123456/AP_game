/*
  * 必要な変数の定義
 *
 */
import processing.net.*;
start s = new start();
MainScreen main = new MainScreen();
Rule rule = new Rule();
CalcDamage calcdamage = new CalcDamage();
Player me = new Player();
Player enemy = new Player();
String enemyAction = "";
int enemyLifePoint = 10;
int enemyRandPoint = 10;
Client client;
String GameNo;
enum Status {
  GAME_START, 
    INPUT_ACTION, 
    MATCHING, 
    RESULT, 
    GAME_FINISH
}
PFont Japanfont, Englishfont;
Status CurrentStatus = Status.GAME_START;
GameFlow Gameflow = new GameFlow();
void setup() {
  size(1200, 800);
  me.setenemy(enemy);
  enemy.setenemy(me);
  Gameflow.setScreen(new start());
}
void draw() {
  background(255);
  Gameflow.display();
  //println(CurrentStatus);
}
void clientEvent(Client client) {
  // 受信したデータをプロトコルによって読み込む。
  // 状態によって場合分け
  // void draw内でやってもまあいいかな
  // 予想されるContent-typeを受け取り、読み取った文字列を返す関数。

  switch(CurrentStatus) {
  case GAME_START:
    // GAME_START中に何かを受け取ることはない。
  case MATCHING :
    if (ReadData("MatchingComplete", client).compareTo("Done\n") == 0) {
      CurrentStatus = Status.INPUT_ACTION;
    }
  case INPUT_ACTION:
    String result = ReadData("Result", client);
    updateState(result);
  case RESULT:
    // いらないかも。相手の起こした行動、ダメージ、相手のライフポイントさえあれば描画できそう。
    //enemy.NextAction = new ActionCommand();
  case GAME_FINISH:
  }
}
void serverEvent (Client client) {
  // コネクションが成立したときによばれる
  println("connection success");
}
void disconnectEvent(Client client) {
  // コネクションが切断されたときに呼ばれる。
  println("disconnect with server");
}
void connectServer() {
  client = new Client(this, "127.0.0.1", 5204);
}
void updateState(String result){
  // 自分のHP, 相手のHP, 相手の行動, 自分の行動、自分のRandomの値、相手のRandomの値
  String [] data = split(result.trim(), ",");
}
