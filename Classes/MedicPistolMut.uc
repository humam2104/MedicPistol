class MedicPistolMut extends KfMutator;
var KFPerk KFP;
var KFInventoryManager KFIM;
var Pawn CurPawn;
var KFWeapon MedicPistol2;
var class<KFWeapon> MedicPistol2Class;
var KFWeapon KFW;

	function InitMutator(string Options, out string ErrorMessage)
	{
		local String CurrentError;
		CurrentError = ErrorMessage;
		super.InitMutator( Options, ErrorMessage ); 
		`log("********  MedicPistolMut Mutator initialized ********");
			if (CurrentError != "")
			{
				`log("******** Error Encountered: ********");
				`log(CurrentError);
				`log("******** Error End ********");
			}
	}

	//Prevents the game from adding this mutator multiple times
	function AddMutator(Mutator M)
	{
		if( M != Self)
		{
			if(M.Class==Class)
				M.Destroy();
			else Super.AddMutator(M);
		}
	}

	function PostBeginPlay()
	{
		Super.PostBeginPlay();	
		Settimer(10,true, nameof(GivePistol)); //Sets a timer that checks for the pistol to be given to the player
	}

	function bool CheckPistol(out KFWeapon KFMP2, name WeaponClassName){
		return KFIM.getWeaponfromclass(KFMP2, WeaponClassName);
	}

	function GivePistol()
	{
			local Controller C;
		    foreach WorldInfo.AllControllers( class'Controller', C)
		    {
				if(C.bIsPlayer == false) //This small check will help loop through all zeds and players quicker
		    		continue;
			    else if( C.bIsPlayer
	        	&& C.PlayerReplicationInfo != none
	        	&& C.PlayerReplicationInfo.bReadyToPlay
	        	&& !C.PlayerReplicationInfo.bOnlySpectator
	        	&& C.GetTeamNum() == 0 ) //Checks for a human player
		        {
		        	Curpawn = KFPawn_Human(KFPlayerController(C).AcknowledgedPawn);
		        }
		        if (CurPawn == None) continue; //Skips if there's no player found
		        KFIM = KFInventoryManager(kfPawn(Curpawn).InvManager);
				KFP = kfpawn(curpawn).GetPerk(); //This gets KFPerk

				
				if (CheckPistol(MedicPistol2,'KFWeap_Pistol_Medic2')) continue; //Do Nothing
				//MedicPistol2 is just for storage, doesn't actually matter
				else if (CheckPistol(MedicPistol2,'KFWeap_Pistol_Medic2') == false)
				{
					MedicPistol2Class = class'KFWeap_Pistol_Medic2';
					KFIM.CreateInventory(MedicPistol2Class, false);
					`log("MedicPistolMut:- Custom Medic Gun is Given");
				}
		    }
	}