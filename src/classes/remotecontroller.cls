public with sharing class remotecontroller {
static final integer max_vol=25;
integer volume;
public integer increasevolume(integer amount){

volume+=amount;
return volume;
}
public integer decreasevolume(integer amount){
volume-=amount;
return volume;
}
}