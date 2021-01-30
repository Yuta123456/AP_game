import processing.net.*;
import java.util.Iterator;
class HeaderReader implements Iterable<String>, Iterator<String> {
  Client client;
  boolean stop = false;

  HeaderReader(Client client) {
    this.client = client;
  }

  Iterator<String> iterator() {
    return this;
  }

  boolean hasNext() {
    return !this.stop;
  }

  String next() {
    while (this.client.active()) {
      if (this.client.available() > 0) {
        String line = this.client.readStringUntil('\n');
        if (line != null) {
          if (line.equals("\r\n")) {
            this.stop = true;
          }
          return line;
        }
      }
    }
    return null;
  }
}
