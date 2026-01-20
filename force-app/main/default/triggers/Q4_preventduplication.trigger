trigger Q4_preventduplication on Account (before insert) {

   Q4_preventduplicatioHandler.prventduplicateAccount(Trigger.new);

}