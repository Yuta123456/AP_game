class MainScreen extends Screen {
  void display() {
    update();
    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanfont = createFont("Meiryo", 50);//日本語
    strokeWeight(5);
    stroke(0, 0, 0);

    Attack();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("3 ~ 7 ダメージ", 213, 270);
    
    fill(255);
    if (me.NextAction instanceof AttackAction){
      fill(255,255,0);
    }
    rect(160, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("a", 200, 370);
    
    Kaunter();

    //追加内容
    fill(0);
    textFont(Japanfont);

    textSize(30);
    text("相手がAttack選択時、", 213, 630);
    text("Attack無効＆3～7ダメージ", 213, 660);
    fill(255);
    if (me.NextAction instanceof CounterAction){
      fill(255,255,0);
    }
    rect(160, 700, 80, 80);
    fill(0);
    textSize(70);
    text("z", 200, 765);
    
    if (me.extra){ 
      rect(95, 700, 80, 80);
    }


    Diffence();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("Attack無効、1回復", 599, 270);
    fill(255);
    if (me.NextAction instanceof DeffenceAction){
      fill(255,255,0);
    }
    rect(550, 305, 80, 80);
    fill(0);
    textFont(Englishfont);
    textSize(70);
    text("s", 590, 370);


    Dragon();
    
    
    //追加内容
    fill(0);
    textFont(Japanfont);

    textSize(37);
    text("固定4ダメージ", 599, 650);

    fill(255);
    if (me.NextAction instanceof DragonRageAction){
      fill(255,255,0);
    }
    rect(550, 700, 80, 80);
    fill(0);
    textSize(70);
    text("x", 590, 765);
    
    if (me.extra){ 
      rect(481, 700, 80, 80);
    }

    Heal();

    fill(0);
    textFont(Japanfont);
    textSize(37);
    text("3 ~ 5 回復", 985, 270);
    fill(255);
    if (me.NextAction instanceof HealAction){
      fill(255,255,0);
    }
    rect(950, 305, 80, 80);
    
    fill(0);

    textFont(Englishfont);

    textSize(70);
    text("d", 990, 370);
    
    
    Drain();
    
    fill(0);
    textFont(Japanfont);
    textSize(30);
    text("相手がHeal選択時、", 985, 630);
    text("Heal無効＆相手の回復分回復", 985, 660);
    fill(255);
    if (me.NextAction instanceof DrainAction){
      fill(255,255,0);
    }
    rect(950, 700, 80, 80);
    fill(0);

    textSize(70);
    text("c", 990, 765);
    textSize(40);
    fill(0);

    calcdamage.DrawHeart(71, 50, me.lifepoint);
    calcdamage.DrawHeart(1130, 50, enemy.lifepoint);
  }
  void update() {
    if (me.NextAction != null && CurrentStatus == Status.RESULT) {
      delay(50);
      Gameflow.setScreen(new CalcDamage());
    }
    if (keyPressed && me.NextAction == null) {
      if (key == 'a') {
        me.NextAction = new AttackAction();
      } else if ( key == 's') {
        me.NextAction = new DeffenceAction();
      } else if (key == 'd') {
        me.NextAction = new HealAction();
      }else if (key == 'z' && (! me.extra)){
        me.NextAction = new CounterAction();
      }else if (key == 'c' && (! me.extra)){
        me.NextAction = new DrainAction();
      }else if (key == 'x' && (! me.extra)){
        me.NextAction = new DragonRageAction();
      }else {
        fill(0);
        text("invalid key", width/2, height - 100);
      }
      if (me.NextAction != null) {
        // アクションが確定している場合
        //boolean SubmitData(String GameNo, String ContentType, String Body, Client client){
        SubmitData(GameNo, "ActionCommand", me.NextAction.getName(), client);
      }
    }
  }
  void Attack() {
    fill(255, 0, 0);
    quad(20, 40, 386, 40, 406, 200, 40, 200);
    textFont(Englishfont);
    fill(255);
    text("Attack", 213, 140);
  }
  void Diffence() {

    fill(0, 0, 255);
    quad(406, 40, 772, 40, 792, 200, 426, 200);
    textFont(Englishfont);
    fill(255);
    text("Deffence", 599, 140);
  }
  void Heal() {

    fill(0, 255, 0);
    quad(792, 40, 1158, 40, 1178, 200, 812, 200);
    textFont(Englishfont);
    fill(255);
    text("Heal", 985, 140);
  }
  void Kaunter() {
    fill(255, 0, 0);
    quad(20, 420, 386, 420, 406, 580, 40, 580);
    textFont(Japanfont);
    fill(255);
    text("カウンター", 213, 520);
  }
  void Dragon() {
    fill(0, 0, 255);
    quad(406, 420, 772, 420, 792, 580, 426, 580);
    textFont(Japanfont);
    fill(255);
    text("りゅうのいかり", 599, 520);
  }
  void Drain() {
    fill(0, 255, 0);
    quad(792, 420, 1158, 420, 1178, 580, 812, 580);
    textFont(Japanfont);
    fill(255);
    text("ドレイン", 985, 520);
  }
}
