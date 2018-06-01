_briefing = [];
#define NEWTAB(NAME) _briefing set [count _briefing, ["Diary",[NAME,"
#define ENDTAB "]]];
#define DISPLAYBRIEFING() _size = count _briefing - 1;for '_i' from 0 to _size do {player createDiaryRecord (_briefing select _size - _i);};


switch (side player) do
{ //Checks what team the player is on

case west:
{ //If player is west he receives this briefing


		NEWTAB("I. Situation:")
		<br/>1. Enemy Forces
		<br/>
		<br/>a. Disposition:
		<br/>
		<br/>The enemy disposition is defensive, consisting primarily of hastily prepared positions around and on approach to OBJ1.
		<br/>
		<br/>b. Composition:
		<br/>
		<br/>Enemy forces consist of mujahideen forces, well-equipped and with high morale.
		<br/>
		<br/>c. Strength:
		<br/>
		<br/>Enemy force strength in the region is estimated at several hundred fighters. Force strength within the immediate AO is unknown, however contact made by 1 Platoon indicates at least a platoon sized element. The enemy is heavily using mortars, a wide variety of small arms,mines , vehicle-borne weapons, and static weapons,  including ZSU-23-2,AGS-30, ZPU-2 and ZPU-4 weapon systems.
		<br/>
		<br/>2. Friendly Forces
		<br/>
		<br/>a. Disposition:
		<br/>
		<br/>The initial attack into the AO by 1 Platoon was defeated quickly by enemy forces, and the remainder of G Company has arrived to reinforce the attack. Golf Company's parent battalion is located primarily to the west, as part of the perimeter being formed by the MRR around Tottah.
		<br/>
		<br/>b. Higher Units Mission:
		<br/>
		<br/>Battalion has been tasked with elimination or capture of enemy fighters in the vicinity of OBJ1, Goram and Fez Goram, as well as securing the eastern flank of the perimeter around Tottah.
		<br/>
		<br/>c. Composition:
		<br/>
		<br/>2 and 3 Platoons, 7 Coy. Attached, One 3-Vehicle Armored Group, located vicinity [<marker name='fob'>TD048055</marker>]. Remnants of 1 Platoon are located within the AO.
		<br/>
		<br/>
		<br/>d. Strength:
		<br/>
		<br/>2 and 3 Platoons, full strength. 1 Platoon, approx. 20% strength.
		<br/>
		<br/>e. Weather:
		<br/>
		<br/> Sunny clear.
		ENDTAB;

NEWTAB("II. Mission:")
		<br/>1 Platoon shall assault and seize enemy held positions at OBJ1 vicinity [<marker name='blufor_obj1'>TD053040</marker>] NLT 021300 May.
		ENDTAB;


NEWTAB("III. Execution:")
		<br/>1. Concept of the Operation
		<br/>
		<br/>Regiment is to secure the town of Tottah NLT 030000 May.
		<br/>
		<br/>2. Maneuver
		<br/>
		<br/>Mission commander's discretion
		<br/>
		<br/>3. Timing
		<br/>
		<br/>Mission commander's discretion
		<br/>
		<br/>4. Tasks to Maneuver Units
		<br/>
		<br/>C Company:
		<br/>
		<br/>1 Platoon shall assault and seize enemy held positions at OBJ1 vicinity [<marker name='blufor_obj1'>TD053040</marker>] NLT 021300 May.
		ENDTAB;


NEWTAB("IV. Sustainment:")

		<br/>1. Support
		<br/>
		<br/>a. Fires
		<br/>
		<br/>Fires will be provided by Battalion.
		<br/>
		<br/>2. Service
		<br/>
		<br/>a. General
		<br/>
		<br/>Nil
		<br/>
		<br/>b. MOPP Level.
		<br/>
		<br/>Level 0
		<br/>
		<br/>c. Handling of Prisoners
		<br/>
		<br/>Restrain at the objective, hold for processing.
		ENDTAB;

NEWTAB("V. Command & Signal:")
		<br/>1. Command
		<br/>
		<br/>Company located at [<marker name='fob'>TD048055</marker>].
		<br/>
		<br/>2. Signals
		<br/>
		<br/>a. Radio Frequencies
		<br/>
		<br/>Long Range:
		<br/> 1 Platoon Net   - Channel 1, 36.625
		<br/> 2 Platoon Net   - Channel 2, 37.775
		<br/> 3 Platoon Net   - Channel 3, 40.275
		<br/>
		<br/> Company Net    - Channel 6, 51.850
		<br/>
		<br/>b. Callsigns
		<br/>
		<br/>  Golf 1'1 	- 1 Section
		<br/>  Golf 1'2 	- 2 Section
		<br/>  Golf 1'3 	- 3 Section
		<br/>  Golf 1'6 	- 1 Platoon Commander
		<br/>  Golf 1'7 	- 1 Platoon 2IC
		<br/>
		<br/>  Golf 2'1 	- 1 Section
		<br/>  Golf 2'2 	- 2 Section
		<br/>  Golf 2'3 	- 3 Section
		<br/>  Golf 2'6 	- 2 Platoon Commander
		<br/>  Golf 2'7 	- 2 Platoon 2IC
		<br/>
		<br/>  Golf 3'1 	- 1 Section
		<br/>  Golf 3'2 	- 2 Section
		<br/>  Golf 3'3 	- 3 Section
		<br/>  Golf 3'6 	- 3 Platoon Commander
		<br/>  Golf 3'7 	- 3 Platoon 2IC
		<br/>
		<br/>  Golf 4 	    - Bronegruppa
		<br/>
		<br/>  Golf 7 	    - Company First Sergeant
		<br/>  Golf 6 	    - Company CO

		ENDTAB;

}; //End of west case

}; //End of switch
NEWTAB("Game Mastering") //This is shown for everyone
This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.
ENDTAB;

NEWTAB("VI. Mission notes:") //This is shown for everyone
<br/>If you are atleast 100m away from your SL you can teleport to him by using the action menu and choosing the teleport option.
<br/>
<br/>Timelimit is 120 minutes.
<br/>
<br/>Victory is achieved by clearing OBJ1.<br/>
<br/>Defeat occurs when 75% of your force is combat ineffective or the 2h time limit is reached.<br/>
<br/
<br/>This mission uses ACE Wounding medical system with United Operations Preset.
<br/>
<br/>Author: Sacher

ENDTAB;

DISPLAYBRIEFING();
