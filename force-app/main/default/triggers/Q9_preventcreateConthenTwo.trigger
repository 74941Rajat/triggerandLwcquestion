trigger Q9_preventcreateConthenTwo on Contact (before insert) {
  Q9_preventcreateConthenTwoHandler.preventCretionMoreThenTwoCon(Trigger.new);
}