state("DOOMVFRx64"){
	bool isLoading: "", 0xB8C4FD0;
	int mapID: 0xB8EE230;
	int mapID2: 0x2A73A00;
	int startID: 0xC961AD8;
	float opacity: 0xB8C35E0;
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
	if(current.mapID == 0 && current.mapID2 <= 3){
		return true;
	}
	return false;
}

startup{
//Delcaring flags & targets.
} 

//
reset {
	
	if(current.startID == 14 && current.mapID == 127 && current.mapID2 == 171){
		return true;
	}
	
}

//When entering the tutorial map the timer starts.
start {
	if(current.startID == 10){
		return true;
	}
}

split{


//In the case of each split, looking for qualifications to complete the split.

switch(timer.Run.GetExtendedCategoryName())
	{
		case "Any%": 
			switch (timer.CurrentSplitIndex)
					{
						case 0: //
							if(current.mapID == 14){
							return true;
							}
							break;
						case 1: //
							if(current.mapID == 6){
							return true;
							}
							break;
						case 2: //
							if(current.mapID == 85){
							return true;
							}
							break;
						case 3: //
							if(current.mapID == 79){
							return true;
							}
							break;
						case 4: //
							if(current.mapID == 20){
							return true;
							}
							break;
						case 5: //
							if(current.mapID == 127){
							return true;
							}
							break;
						case 6: //
							if(current.mapID == 139){
							return true;
							}
							break;
						case 7: //
							if(current.opacity >= .99){
							return true;
							}
							break;
					}
				break;		
	}
}
