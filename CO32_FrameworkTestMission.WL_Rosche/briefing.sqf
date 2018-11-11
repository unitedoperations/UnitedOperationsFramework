_briefing = [];
#define NEWTAB(NAME) _briefing set [count _briefing, ["Diary",[NAME,"
#define ENDTAB "]]];
#define DISPLAYBRIEFING() \
_size = count _briefing - 1; \
for '_i' from 0 to _size do \
{ \
	player createDiaryRecord (_briefing select _size - _i); \
};

switch(side player) do 
{
case west:
{
NEWTAB("I. Situation:")
<font color='#5BD527'><h1>Situation:</h1></font color><br/>
Russian forces have captured the town of Mehren. Your Platoon has been tasked with retaking it.<br/><br/>
<font color='#5BD527'><h1>Terrain:</h1></font color><br/>
Open fields  to the north and south of Mehren, Forest to the west of Mehren which can cover the approach till aprox. 200m from Mehren.<br/><br/>
<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>
Forest to the west of Mehren is the only covered approach.<br/><br/>
<font color='#5BD527'><h1>Weather:</h1></font color><br/>
Sunny
ENDTAB

NEWTAB("   A. Enemy Forces:")
<font color='#5BD527'><h1>Disposition:</h1></font color><br/>
1x Russian squad located inside Mehren.<br/><br/>
<font color='#5BD527'><h1>Strength:</h1></font color><br/>
1x Russian squad<br/><br/>
<font color='#5BD527'><h1>Equipment:</h1></font color><br/>
Russian forces are equipped with AK type assault rifles, SVD sniper rifles , PKM machine guns. underslung grenadelaunchers and RPG-7 rocket launchers.<br/> 
Their arsenal of vehicles include UAZ's, BRDM's, BTR's, BMP and T80's.<br/><br/>
<font color='#5BD527'><h1>Appearance:</h1></font color><br/>
Russian forces are wearing standard Russian EMR camouflage. <br/><br/>
<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>
Russian forces will fortify themselves inside Mehren and await the enemy attack.<br/><br/>
<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>
Russian forces will mine the forest to the south and heavily fortify their positions in Mehren delay any attacking forces.
ENDTAB

NEWTAB("   B. Friendly Forces:")
<font color='#5BD527'><h1>Disposition:</h1></font color><br/>Tapas 53 is located south of Mehren.<br/><br/>
<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>Company has been tasked with eliminating any hostile forces in the vicinity.<br/><br/>
<font color='#5BD527'><h1>Strength:</h1></font color><br/>1x Russian squad<br/><br/>
<font color='#5BD527'><h1>Appearance:</h1></font color><br/>Russian forces are wearing standard Russian EMR camouflage. <br/><br/>
ENDTAB

NEWTAB("II. Mission:")
<font color='#5BD527'><h1>Mission:</h1></font color><br/>
Clear out Mehren from any hostile presence.
ENDTAB

NEWTAB("III. Execution:")
<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>
Companies mission is to clear out any hostile forces in Mehren.<br/><br/>
<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>
Platoon commander's discretion<br/><br/>
<font color='#5BD527'><h1>Timings:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Tasks:</h1></font color><br/>
Clear out Mehren from any hostile presence NLT 900
ENDTAB

NEWTAB("IV. Service Support:")
 
ENDTAB
NEWTAB("   A. Support:")
<font color='#5BD527'><h1>Fires:</h1></font color><br/>
1x Motar loaded with 40x Smoke to help conceal the approach of friendly units.<br/><br/>
<font color='#5BD527'><h1>Ammo:</h1></font color><br/>
None
ENDTAB

NEWTAB("   B. Support: ")
<font color='#5BD527'><h1>General:</h1></font color><br/>
i) SOP Variations<br/> 
Dress: None.<br/> 
Equipment: None.<br/> 
Weapons: None.<br/> 
Vehicle Loading: None.<br/> 
<br/> 
ii) Logistic Support<br/> 
Replen Plan: None for 24h.<br/> 
Ammunition: Each man carries his own ammunition.<br/> 
IPE: Helmets and body armour are to be worn at all times.<br/> 
<br/> 
iii) Medical<br/> 
Location: Company Aid Post is located at medics position.<br/> 
CASEVAC: By foot or with platoon asset.<br/> 
Plan: Set up a Casualty Collection Point and extract casualties to this point.<br/> 
Stretchers: None.<br/> 
Med Packs: Platoon medpack carried by medics.<br/> 
Morphine: Everyone carries 1 stick of Morphine.<br/>
ENDTAB
NEWTAB("V. Command & Signal:")

ENDTAB
NEWTAB("   A. Command:")
<font color='#5BD527'><h1>General:</h1></font color><br/>
i) Chain of Command:<br/>
Tapas 530 -> Tapas 531 -> Tapas 532 -> Tapas 533
ENDTAB
NEWTAB("   B. Signals:")
<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>
LR:<br/> 
Tapas 530 Net: 037.775 (Channel 1)<br/>
<br/>
SR:<br/>
Tapas 531 - Channel 1<br/> 
Tapas 532 - Channel 2<br/> 
Tapas 533 - Channel 3<br/> 
Tapas 530 - Channel 6<br/> 
<br/><br/>
<font color='#5BD527'><h1>Codewords:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>
Platoon HQ  -> Tapas 530 <br/>
1st Squad  -> Tapas 531 <br/>
2nd Squad  -> Tapas 532 <br/>
3rd Squad  -> Tapas 533 <br/><br/><br/>
<font color='#5BD527'><h1>Passwords:</h1></font color><br/>
Challenge: Bobby  Answer: Rhino
ENDTAB






};
case east:
{
NEWTAB("I. Situation:")
<font color='#5BD527'><h1>Situation:</h1></font color><br/>
We have  captured the town of Mehren. We are tasked with defending this town from any counterattack by hostile forces.<br/><br/>
<font color='#5BD527'><h1>Terrain:</h1></font color><br/>
Open fields  to the north and south of Mehren, Forest to the west of Mehren which can cover any approaches till aprox. 200m from Mehren.<br/><br/>
<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>
Forest to the west offers the most covered route for approach by any force.<br/><br/>
<font color='#5BD527'><h1>Weather:</h1></font color><br/>
Sunny, Day
ENDTAB

NEWTAB("   A. Enemy Forces:")
<font color='#5BD527'><h1>Disposition:</h1></font color><br/>
Borovian light infantry platoon located west of Mehren.<br/><br/>
<font color='#5BD527'><h1>Strength:</h1></font color><br/>
Borovian light infantry platoon with motar support.<br/><br/>
<font color='#5BD527'><h1>Equipment:</h1></font color><br/>
Borovians forces are equipped with G3 rifles, MG3 machine guns  and RPG-7 rocket launchers. <br/>Their arsenal of vehicles include Btr apcs, BMP ifvs and T-series of tanks.<br/><br/><br/>
<font color='#5BD527'><h1>Appearance:</h1></font color><br/>
Borovian forces are most commonly wearing TTSKO camouflage.<br/><br/>
<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>
Borovian forces will advance through the forest to the west and assault the town in full force.<br/><br/>
<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>
Borovian forces will use motars to suppress the town and advance under covering fire and overwhelm any defending forces.
ENDTAB

NEWTAB("   B. Friendly Forces:")
<font color='#5BD527'><h1>Disposition:</h1></font color><br/>Russian infantry squad located inside Mehren.<br/><br/>
<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>Company is located 1km east of Mehren unable to provide support within 60min.<br/><br/>
<font color='#5BD527'><h1>Strength:</h1></font color><br/>Borovian light infantry platoon with motar support.<br/><br/>
<font color='#5BD527'><h1>Appearance:</h1></font color><br/>Borovian forces are most commonly wearing TTSKO camouflage.<br/><br/>
ENDTAB

NEWTAB("II. Mission:")
<font color='#5BD527'><h1>Mission:</h1></font color><br/>
Defend Mehren from any hostile force.
ENDTAB

NEWTAB("III. Execution:")
<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>
Companies mission is to defend Mehren from any hostile force.<br/><br/>
<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>
Squad leaders discretion.<br/><br/>
<font color='#5BD527'><h1>Timings:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Tasks:</h1></font color><br/>
Defend Mehren.
ENDTAB

NEWTAB("IV. Service Support:")
 
ENDTAB
NEWTAB("   A. Support:")
<font color='#5BD527'><h1>Fires:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Ammo:</h1></font color><br/>
NA
ENDTAB

NEWTAB("   B. Support: ")
<font color='#5BD527'><h1>General:</h1></font color><br/>
i) SOP Variations<br/> 
Dress: None.<br/> 
Equipment: None.<br/> 
Weapons: None.<br/> 
Vehicle Loading: None.<br/> 
<br/> 
ii) Logistic Support<br/> 
Replen Plan: None for 24h.<br/> 
Ammunition: Each man carries his own ammunition.<br/> 
IPE: Helmets and body armour are to be worn at all times.<br/> 
<br/> 
iii) Medical<br/> 
Location: Company Aid Post is located at medics position.<br/> 
CASEVAC: By foot or with platoon asset.<br/> 
Plan: Set up a Casualty Collection Point and extract casualties to this point.<br/> 
Stretchers: None.<br/> 
Med Packs: Platoon medpack carried by medics.<br/> 
Morphine: Everyone carries 1 stick of Morphine.<br/>
ENDTAB
NEWTAB("V. Command & Signal:")

ENDTAB
NEWTAB("   A. Command:")
<font color='#5BD527'><h1>General:</h1></font color><br/>
Chain of Command:<br/>
Ratnik 230i
ENDTAB
NEWTAB("   B. Signals:")
<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>
LR:<br/> 
Ratnik 230 Net: 037.775 (Channel 1)<br/>
<br/>
SR:<br/>
Ratnik 230 - Channel 1<br/> <br/><br/>
<font color='#5BD527'><h1>Codewords:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>
NA<br/><br/>
<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>
1st Squad -> Ratnik 230<br/><br/>
<font color='#5BD527'><h1>Passwords:</h1></font color><br/>
Rasputin -> Putin
ENDTAB

};
case independent:
{






};
case civilian:
{






};
};
NEWTAB("Mission Notes:")
<font color='#5BD527'><h1>Author:</h1></font color><br/>
<br/><br/>
<font color='#5BD527'><h1>Testers:</h1></font color><br/>
<br/><br/>
<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>
Blufor wins if Opfor takes 75% Casualties or the capturezone is controlled for 5 minutes <br/>Opfor wins if Blufor takes 75% Casualties <br/><br/><br/>
<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>
<br/><br/>
<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>
V1: Initial Upload
ENDTAB
NEWTAB("Game Mastering")
<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>This mission is designed for game mastering and can be manipulated as per Mission Notes
ENDTAB
DISPLAYBRIEFING()