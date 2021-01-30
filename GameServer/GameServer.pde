import processing.net.*;
import java.util.List;
import java.util.HashSet;
Server myServer;
Client client1 = null;
Client client2 = null;
boolean client1Action = false;
boolean client2Action = false;
Player player1 = new Player();
Player player2 = new Player();
int countClient = 0;
void setup() {
  myServer = new Server(this, 5204);
  size(400, 200);
}
void draw() {
}

void serverEvent(Server server, Client client) {
  // サーバに接続があったときに走る。
  // このクライアントにマッチングさせるクライアントが居ればマッチングさせる。
  // そうでない場合は、待ち行列にいれる。
  countClient++;
  if (countClient > 2) {
    return ;
  }
  if (client1 == null) {
    client1 = client;
  } else {
    client2 = client;
  }
  if (client1 != null && client2 != null) {
    //boolean SubmitData(String ContentType, String Body, Client client)
    SubmitData("MatchingComplete", "Done", client1);
    SubmitData("MatchingComplete", "Done", client2);
  }
}
void clientEvent(Client client) {
  // コネクションからデータを受信したときに走る。
  // Actionを受け取る。String 型
  //String ReadData(String ExpectContentType, Client client)
  if (client == client1) {
    String act = ReadData("ActionCommand", client1);
    setAction(player1, act);
  } else if (client == client2) {
    String act = ReadData("ActionCommand", client2);
    setAction(player2, act);
  }
  // 両方のアクションの結果を受け取ったら、計算を走らせる。
  if (player1.NextAction != null && player2.NextAction != null) {
    CalcDamage();
  }
}

void CalcDamage() {   
  player1.action();
  player2.action();
  // 自分のHP, 相手のHP, 相手の行動, 自分の行動、自分のRandomの値、相手のRandomの値
  String responceClient1 = str(player1.lifepoint)+ ',' +str(player2.lifepoint) + ','+ player1.getAction().getName() 
  + ','+ player2.getAction().getName() + ','+ str(player1.getAction().getPoint()) + ','+ str(player2.getAction().getPoint());
  String responceClient2 = str(player2.lifepoint)+ ',' +str(player1.lifepoint) + ','+ player2.getAction().getName() 
  + ','+ player1.getAction().getName() + ','+ str(player2.getAction().getPoint()) + ','+ str(player1.getAction().getPoint());
  // boolean SubmitData(String ContentType, String Body, Client client)
  SubmitData("Result", responceClient1, client1);
  SubmitData("Result", responceClient2, client2);
  player1.NextAction = null;
  player2.NextAction = null;
  
}
void setAction(Player p, String action) {
  switch (action) {
  case "AttackAction\n":
    p.NextAction = new AttackAction();
  case "DeffenceAction\n":
    p.NextAction = new DeffenceAction();
  case "HealAction\n":
    p.NextAction = new HealAction();
  case "Counter Command\n":
    p.NextAction = new CounterAction();
  case "Drain Command\n":
    p.NextAction = new DrainAction();
  case "DragonRage Command\n":
    p.NextAction = new DragonRageAction();
  }
}
