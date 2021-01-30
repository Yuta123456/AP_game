import processing.net.*;

Server myServer = new Server(this, 5204);
// Serverに対してclientは多数
ArrayList<Client> clients = new List<>();

void serverEvent(Server server, Client client){
  // サーバに接続があったときに走る。
  // このクライアントにマッチングさせるクライアントが居ればマッチングさせる。
  // そうでない場合は、待ち行列にいれる。
}
void clientEvent(){
  // コネクションからデータを受信したときに走る。
  // 
}
