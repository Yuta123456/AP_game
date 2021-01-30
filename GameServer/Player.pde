class Player {
  int lifepoint = 10;
  boolean extra;
  Player enemy;
  ActionCommand NextAction = null;
  
  ActionCommand getAction() {
    return NextAction;
  }
  void action() {
    NextAction.Action(this);
  }
}
