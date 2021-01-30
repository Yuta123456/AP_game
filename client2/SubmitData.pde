boolean SubmitData(String GameNo, String ContentType, String Body, Client client){
  client.write("GameNo : " + GameNo + "\n");
  client.write("Content-Type : " + ContentType + "\n");
  client.write("\r\n");
  client.write(Body + "\n");
  return true;
}
