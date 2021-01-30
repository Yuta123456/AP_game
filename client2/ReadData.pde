
// 予想されるContent-typeを受け取り、読み取った文字列を返す関数。
// 失敗していた場合は何を返すか未定
String ReadData(String ExpectContentType, Client client) {
  HeaderReader reader = new HeaderReader(client);
  HashMap<String, String> headers = new HashMap();
  for (String line : reader) {
    String[] header = split(line.trim(), " : ");
    if (header.length == 2) {
      headers.put(header[0], header[1]);
    }
  }
  println(headers);
  GameNo = headers.get("GameNo");
  if (headers.get("Content-Type").compareTo(ExpectContentType) != 0) {
    return null;
  }
  return client.readString();
}
