trigger UpdateStage on Case (before update) {
for(case cs:trigger.new){
if(trigger.oldmap.get(cs.id).status =='working'){
cs.status.addError('Status cannot be changed');
}


}

}