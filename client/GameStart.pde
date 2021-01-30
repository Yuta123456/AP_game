class start extends Screen {
  private PFont Englishfont;
  private PFont Japanesefont; 
  private boolean meReady = false;
  String GameFlow = "start";
  color c1=0;
  String HealorDamage="A";

  void display() {
    background(255);

    textAlign( CENTER ); //中央揃え
    Englishfont = createFont("Arial", 70);//英語
    Japanesefont = createFont("Meiryo", 100);//日本語

    textFont(Japanesefont);
    fill(0);
    textSize(100);
    fill(255);
    strokeWeight(3);
    // 準備完了の四角
    
    rect(width/2-200, height*3/4+42, 50, 50);
    // ルール説明の四角
    rect(width*5/8 +45, 25, 50, 50);
    textSize(40);
    fill(0);

    text("r　 でルール説明", width*7/8-80, height/12);
    text("q  を押して準備完了", width/2, height*3/4+80);

    textFont(Englishfont); 
    textSize(70);
    text("Game Start", width/2, height/2);

    if (keyPressed) {
      keyPressed();
    }
  
    textFont(Japanesefont);
    textSize(50);
    if (meReady) {
      fill(255, 0, 0);
      text("待ち", width/2, height*3/4-40);
    } else {
      fill(0, 0, 255);
      text("マッチング中...", width/2, height*3/4-40);
    }
    if (meReady || true) {
      delay(50);
      Gameflow.setScreen(new MainScreen());
      meReady = false;
    }
  }


  private void keyPressed() {
    if (key == 'q') {//キーボードでaを入力をしたら実行される
      meReady = true;
    }
    if (key == 'r') {//キーボードでスペースを入力したら実行される
      delay(50);
      Gameflow.setScreen(new Rule());
    }
  }
}
