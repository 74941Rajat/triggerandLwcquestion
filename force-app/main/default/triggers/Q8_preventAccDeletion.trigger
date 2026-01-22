trigger Q8_preventAccDeletion on Account (before delete) {


Q8_preventAccDeletionHandler.preventdelete(Trigger.old);
}