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
enum STATUS {
  GAME_START, 
    MATCHING, 
    INPUT_ACTION, 
    RESULT, 
    GAME_FINISH
}
PFont Japanfont, Englishfont;

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
}
void clientEvent(Client client) {
  // 受信したデータをプロトコルによって読み込む。
  // 状態によって場合分け
  // void draw内でやってもまあいいかな

}
void serverEvent (Client client) {
  // コネクションが成立したときによばれる
  println("connection success");
}
void disconnectEvent(Client client) {
  // コネクションが切断されたときに呼ばれる。
  println("disconnect with server");
}
