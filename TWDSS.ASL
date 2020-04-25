state("TWD-Win64-Shipping"){
	bool isLoading: "", 0x4B4CD80;
	int dayCount: 0x04B0BD90, 0x160, 0x280, 0x28, 0x350;
	int dayCount2: 0x04B0AB98, 0x8, 0x1E0, 0x28, 0x190, 0x18;	
	int mapID: 0x4AAE2F0;
	int menu: 0x496C2B8;
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
	
	if(current.menu == 6 && current.mapID == 1){
		return true;
	}
	
}

//When entering the tutorial map the timer starts.
start {
	if(current.mapID == 10){
		return true;
	}
	
	vars.beenBastion = false;
}

split{

//In the case of each split, looking for qualifications to complete the split.

switch(timer.Run.GetExtendedCategoryName())
	{
		case "Any% (No OoB)": 
			switch (timer.CurrentSplitIndex)
					{
						case 0: //Tutorial
							if(current.mapID == 14){
							return true;
							}
							break;
						case 1: //Day 1
							if(current.dayCount == 2 || current.dayCount2 == 2){
							return true;
							} 
							break;
						case 2: //Day 2
							if(current.dayCount == 3 || current.dayCount2 == 3){
							return true;
							}
							break;
						case 3: //Day 3
							if(current.dayCount == 4 || current.dayCount2 == 4){
							return true;
							}
							break;
						case 4: //Day 4
							if(current.dayCount == 5 || current.dayCount2 == 5){
							return true;
							}
							break;
						case 5: //Day 5
							if(current.dayCount == 6 || current.dayCount2 == 6){
							return true;
							}
							break;
						case 6: //Day 6
							if(current.dayCount == 7 || current.dayCount2 == 7){
							return true;
							}
							break;
						case 7: //Day 7
							if(current.dayCount == 8 || current.dayCount2 == 8){
							return true;
							}
							break;
						case 8: //Day 8
							if(current.dayCount == 9 || current.dayCount2 == 9){
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
						case 10: //End
							if(current.dayCount == 17 || current.dayCount2 == 17){
							return true;
							}
							break;		 
					}
				break;
				
		case "Any% (Standard)":
			switch (timer.CurrentSplitIndex)
					{
						case 0: //Day 1
							if(current.mapID == 14){
							return true;
							}
							break;
							
						case 1: //Day 1
							if(current.dayCount == 9 || current.dayCount2 == 9){
							return true;
							}
							break;
					}
				break;				
	}
}
