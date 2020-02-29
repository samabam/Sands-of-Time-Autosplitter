state("TWD-Win64-Shipping"){
	bool isLoading: "", 0x47CA3D0;
	int dayCount: 0x04AD40B8, 0x8, 0x1E0, 0x28, 0x350;
	int mapID: 0x4A77CC8;
	//int boatRide: 
}

init{
    timer.IsGameTimePaused = false;
	game.Exited += (s, e) => timer.IsGameTimePaused = true;
}

isLoading
{
	
	if(current.isLoading){
		return true;
	}
	return false;
}

startup{
//Delcaring flags & targets.
	bool beenBastion = false;
} 

//
reset {
}

//When the Prince is in the starting position and a cutscene has just been skipped, start.
start {
	if(current.mapID == 10){
		return true;
	}
	
	vars.beenBastion = false;
}

split{


//In the case of each split, looking for qualifications to complete the split.
switch (timer.CurrentSplitIndex)
			{
				case 0: //Tutorial
					if(current.mapID == 14){
					return true;
					}
					break;
				case 1: //Day 1
					if(current.dayCount == 2){
					return true;
					}
					break;
				case 2: //Day 2
					if(current.dayCount == 3){
					return true;
					}
					break;
				case 3: //Day 3
					if(current.dayCount == 4){
					return true;
					}
					break;
				case 4: //Day 4
					if(current.dayCount == 5){
					return true;
					}
					break;
				case 5: //Day 5
					if(current.dayCount == 6){
					return true;
					}
					break;
				case 6: //Day 6
					if(current.dayCount == 7){
					return true;
					}
					break;
				case 7: //Day 7
					if(current.dayCount == 8){
					return true;
					}
					break;
				case 8: //Day 8
					if(current.dayCount == 9){
					return true;
					}
					break;
				case 9: //Bastion
					if(current.mapID == 14){
					vars.beenBastion = true;
					}
					
					if(vars.beenBastion == true && current.mapID == 11){
					return true;
					}
					
					break;
				case 10: //New Orleans Shout
					if(current.mapID == 35){
					return true;
					}
					break;					
				case 11: //End
					if(current.dayCount == 19){
					return true;
					}
					break;		
			}
			
}