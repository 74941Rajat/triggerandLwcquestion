trigger UpdateRoomAvailability on Booking__c (after insert, after update) {
    Set<Id> roomIds = new Set<Id>();

    for (Booking__c b : Trigger.new) {
        if (b.Room__c != null) {
            roomIds.add(b.Room__c);
        }
    }

    List<Room__c> roomsToUpdate = [SELECT Id, Is_Available__c FROM Room__c WHERE Id IN :roomIds];
    for (Room__c r : roomsToUpdate) {
        r.Is_Available__c = false; // booked → not available
    }

    if (!roomsToUpdate.isEmpty()) {
        update roomsToUpdate;
    }
}