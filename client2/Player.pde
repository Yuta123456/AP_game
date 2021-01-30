
class Player {
  Player enemy = null;
  int lifepoint = 10;
  ActionCommand NextAction = null;
  boolean extra = false;
  void setenemy(Player e) {
    enemy = e;
  }
  ActionCommand getAction() {
    return NextAction;
  }
  void action() {
    NextAction.Action(this);
  }
}
