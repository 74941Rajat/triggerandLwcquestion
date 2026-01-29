trigger Q16_whencheckAcctheOppoChange on Account (after update) {

    Q16_whencheckAcctheOppoChangeHandler.changeoppostge(Trigger.new);

}