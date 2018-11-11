
//AUTHOR: Gkenny
//Early 2000s MSV
//
//[this, "2000MSV_RF"] call FNC_GearScript;
//[this, "2000MSV_MG"] call FNC_GearScript;
//[this, "2000MSV_MGASST"] call FNC_GearScript;
//[this, "2000MSV_RPK"] call FNC_GearScript;
//[this, "2000MSV_RPG"] call FNC_GearScript;
//[this, "2000MSV_RPGASST"] call FNC_GearScript;
//[this, "2000MSV_EFR"] call FNC_GearScript;
//[this, "2000MSV_SL"] call FNC_GearScript;
//[this, "2000MSV_PL"] call FNC_GearScript;
//[this, "2000MSV_COY"] call FNC_GearScript;
//[this, "2000MSV_RTO"] call FNC_GearScript;
//[this, "2000MSV_COYSGT"] call FNC_GearScript;
//[this, "2000MSV_PLTSGT"] call FNC_GearScript;
//[this, "2000MSV_MKS"] call FNC_GearScript;
//[this, "2000MSV_GNR"] call FNC_GearScript;
//[this, "2000MSV_DRVR"] call FNC_GearScript;
//[this, "2000MSV_CMDR"] call FNC_GearScript;
//[this, "2000MSV_MED"] call FNC_GearScript;
//[this, "2000MSV_BMP"] call FNC_GearScript;
//[this, "2000MSV_PILOT"] call FNC_GearScript;
#define package "2000MSV_"

SET_GROUP(uniform)
	["rhs_uniform_flora"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 3, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 3, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 3, "uniform"] call FNC_AddItem;
	["ACE_quikclot", 3, "uniform"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 1, "uniform"] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["ACE_earplugs"] call FNC_AddItem;
	["skn_m04_gas_mask_blk"] call FNC_AddItem;
END_GROUP;

SET_GROUP(helmet)
	["rhs_6b26","rhs_6b26_bala","rhs_6b26_ess","rhs_6b26_ess_bala"] call FNC_AddItemRandom;
	//["rhs_6b26"] call FNC_AddItem;
END_GROUP;




	case (package + "RF"): { //Rifleman

		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest
		ADD_GROUP(uniform);
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",7,"vest"] call FNC_AddItem; //Magazines

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; //Flash hider

	};

	case (package + "RPG") : { //RPG Grenadier

		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest
		["rhs_rpg_empty"] call FNC_AddItem; // RPG Carrier

		ADD_GROUP(uniform);
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",7,"vest"] call FNC_AddItem; //Magazines

		["rhs_rpg7_PG7VL_mag",2,"backpack"] call FNC_AddItem; // RPGs
		["rhs_rpg7_OG7V_mag",1,"backpack"] call FNC_AddItem;

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; //Flash hider

		["rhs_weap_rpg7"] call FNC_AddItem; // RPG-7
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3"; //RPG Scope

	};

	case (package + "RPGASST") : { // RPG Assistant

		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest
		["rhs_rpg_empty"] call FNC_AddItem; // RPG Carrier

		ADD_GROUP(uniform);
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",7,"vest"] call FNC_AddItem; //Magazines

		["rhs_rpg7_PG7VL_mag",1,"backpack"] call FNC_AddItem;
		["rhs_rpg7_PG7VR_mag",1,"backpack"] call FNC_AddItem;	// RPGs
		["rhs_rpg7_OG7V_mag",1,"backpack"] call FNC_AddItem;

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; //Flash hider

	};

	case (package + "EFR") : { //Efreitor

		ADD_GROUP(uniform);
		["rhs_6b23_6sh92_vog_headset"] call FNC_AddItem; //vest
		["rhs_6b26_ess"] call FNC_AddItem; // helmet

		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio

		["rhs_mag_rgn",1,"vest"] call FNC_AddItem; // Frag
		["rhs_mag_rdg2_white",1,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_assault_umbts"] call FNC_AddItem;
		["rhs_VOG25",15,"backpack"] call FNC_AddItem; // Frag Vogs
		["rhs_GRD40_White",2,"backpack"] call FNC_AddItem; // Smoke Vogs
		["rhs_GRD40_Green",1,"backpack"] call FNC_AddItem;
		["rhs_GRD40_Red",1,"backpack"] call FNC_AddItem;

		["rhs_weap_ak74m_gp25"] call FNC_AddItem; // AK GP
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
	};

	case (package + "SL") : { //Section Leader

		ADD_GROUP(uniform);
		["rhs_6b23_6sh92_headset_mapcase"] call FNC_AddItem; //vest
		["rhs_6b26"] call FNC_AddItem; // helmet
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio

		["rhs_mag_rgn",2,"vest"] call FNC_AddItem; // Frag
		["rhs_mag_rdg2_white",2,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",7,"vest"] call FNC_AddItem; // Ammo


		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider

	};

	case (package + "PL") : { // PLT Commander

		ADD_GROUP(uniform);
		["rhs_6b23_crewofficer"] call FNC_AddItem; // vest
		["rhs_assault_umbts"] call FNC_AddItem; // Radio Backpack
		["rhs_6b26_ess","rhs_6b26"] call FNC_AddItemRandom; // helmet
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio
		["ACRE_PRC117F",1,"backpack"] call FNC_AddItem; // COY Radio

		["rhs_mag_rgn",1,"vest"] call FNC_AddItem; // Frag
		["rhs_mag_rdg2_white",1,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",4,"vest"] call FNC_AddItem; // Ammo
		["rhs_mag_9x18_8_57N181S",1,"uniform"] call FNC_AddItem;
		["rhs_mag_9x18_8_57N181S",1,"vest"] call FNC_AddItem;


		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
		_unit addPrimaryWeaponItem "rhs_acc_1p29"; // Scope

		["rhs_weap_makarov_pm"] call FNC_AddItem; // Makarov PM
	};

	case (package + "COY") : { // Company Commander

		ADD_GROUP(uniform);
		["rhs_6b23_crewofficer"] call FNC_AddItem; // vest
		["rhs_6b26_ess","rhs_6b26"] call FNC_AddItemRandom; // helmet
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio

		["rhs_mag_rdg2_white",1,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",4,"vest"] call FNC_AddItem; // Ammo
		["rhs_mag_9x18_8_57N181S",2,"vest"] call FNC_AddItem;


		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
		_unit addPrimaryWeaponItem "rhs_acc_1p29"; // Scope

		["rhs_weap_makarov_pm"] call FNC_AddItem; // Makarov PM
	};
	case (package + "COYSGT") : { // Company Sergeant

		ADD_GROUP(uniform);
		["rhs_6b23_6sh92_vog_headset"] call FNC_AddItem; //vest
		["rhs_6b26_ess","rhs_6b26"] call FNC_AddItemRandom; // helmet
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio

		["rhs_mag_rgn",1,"vest"] call FNC_AddItem; // Frag
		["rhs_mag_rdg2_white",1,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_assault_umbts"] call FNC_AddItem;
		["rhs_VOG25",15,"backpack"] call FNC_AddItem; // Frag Vogs
		["rhs_GRD40_White",2,"backpack"] call FNC_AddItem; // Smoke Vogs
		["rhs_GRD40_Green",1,"backpack"] call FNC_AddItem;
		["rhs_GRD40_Red",1,"backpack"] call FNC_AddItem;

		["rhs_weap_ak74m_gp25"] call FNC_AddItem; // AK GP
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
		_unit addPrimaryWeaponItem "rhs_acc_1p29"; // Scope
	};
	case (package + "PLTSGT") : { // PLT Sergeant

		ADD_GROUP(uniform);
		["rhs_6b23_6sh92_vog_headset"] call FNC_AddItem; //vest
		["rhs_6b26_ess","rhs_6b26"] call FNC_AddItemRandom; // helmet
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC343",1,"uniform"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio

		["rhs_mag_rgn",1,"vest"] call FNC_AddItem; // Frag
		["rhs_mag_rdg2_white",1,"vest"] call FNC_AddItem; // Smoke

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_assault_umbts"] call FNC_AddItem;
		["rhs_VOG25",15,"backpack"] call FNC_AddItem; // Frag Vogs
		["rhs_GRD40_White",2,"backpack"] call FNC_AddItem; // Smoke Vogs
		["rhs_GRD40_Green",1,"backpack"] call FNC_AddItem;
		["rhs_GRD40_Red",1,"backpack"] call FNC_AddItem;

		["rhs_weap_ak74m_gp25"] call FNC_AddItem; // AK GP
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
	};
	case (package + "RTO"): { // RTO

		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest



		ADD_GROUP(uniform);
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["rhs_assault_umbts"] call FNC_AddItem; // Radio Backpack

		["ACRE_PRC117F",1,"backpack"] call FNC_AddItem; // COY Radio

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; //Magazines

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; //Flash hider

	};

	case (package + "MKS") : { // Marksman

		ADD_GROUP(uniform);
		["rhs_6b23_sniper"] call FNC_AddItem;
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_mag_9x18_8_57N181S",3,"vest"] call FNC_AddItem; // PM ammo
		["rhs_10Rnd_762x54mmR_7N1",9,"vest"] call FNC_AddItem; // SVD ammo

		["rhs_weap_svdp"] call FNC_AddItem; // SVD
		_unit addPrimaryWeaponItem "rhs_acc_pso1m2"; //Scope

		["rhs_weap_makarov_pm"] call FNC_AddItem; // Makarov PM
	};

	case (package + "MG") : { //Machinegunner

		ADD_GROUP(uniform);
		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest
		["rhs_sidor"] call FNC_AddItem; // Backpack
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_100Rnd_762x54mmR",1,"vest"] call FNC_AddItem; // PKM Ammo
		["rhs_100Rnd_762x54mmR",2,"backpack"] call FNC_AddItem;

		["ruPal_rhs_weap_pkm"] call FNC_AddItem; // PKM
	};
	case (package + "MGASST") : { // MG Assistant

		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest

		ADD_GROUP(uniform);
		ADD_GROUP(helmet);
		["rhs_sidor"] call FNC_AddItem; // Backpack
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",7,"vest"] call FNC_AddItem; //Magazines
		["rhs_100Rnd_762x54mmR",2,"backpack"] call FNC_AddItem; // PKM Ammo

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; //Flash hider

	};

	case (package + "DRVR") : { // Driver

		ADD_GROUP(uniform);
		["rhs_6b23_engineer"] call FNC_AddItem; // Vest
		["rhs_tsh4_ess","rhs_tsh4_ess_bala"] call FNC_AddItemRandom; //Helmets
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_weap_aks74u"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u"; // Flash Hider

	};

	case (package + "GNR") : { // Gunner

		ADD_GROUP(uniform);
		["rhs_6b23_engineer"] call FNC_AddItem; // Vest
		["rhs_tsh4","rhs_tsh4_bala"] call FNC_AddItemRandom; //Helmets
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio


		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_weap_aks74u"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u"; // Flash Hider

	};

	case (package + "MED") : { // Medic

		ADD_GROUP(uniform);
		["rhs_6b23_medic"] call FNC_AddItem; // vest
		["rhs_medic_bag"] call FNC_AddItem; // medic bag
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		ADD_GROUP(helmet);

		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio

		
		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo
		["rhs_mag_rgn",1,"vest"] call FNC_AddItem; // Frag Grenadier
		["rhs_mag_rdg2_white",2,"vest"] call FNC_AddItem; // White Smoke



		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider

	};

	case (package + "RPK") : { //RPK

		ADD_GROUP(uniform);
		["rhs_6b23_rifleman"] call FNC_AddItem;  //Vest
		["rhs_sidor"] call FNC_AddItem; // Backpack
		ADD_GROUP(helmet);
		ADD_GROUP(IFAK);
		ADD_GROUP(items);

		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_45Rnd_545X39_7N10_AK",4,"vest"] call FNC_AddItem; // RPK Ammo
		["rhs_45Rnd_545X39_7N10_AK",5,"backpack"] call FNC_AddItem;
		["rhs_45Rnd_545X39_AK_Green",1,"backpack"] call FNC_AddItem;

		["hlc_rifle_rpk"] call FNC_AddItem; // RPK
	};

	case (package + "CMDR") : { // Gunner

		ADD_GROUP(uniform);
		["rhs_6b23_engineer"] call FNC_AddItem; // Vest
		["rhs_tsh4","rhs_tsh4_bala"] call FNC_AddItemRandom; //Helmets
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["Binocular"] call FNC_AddItem; // Binoculars

		["ACRE_PRC148",1,"uniform"] call FNC_AddItem; // PLT Radio


		["rhs_mag_rdg2_white", 1] call FNC_AddItem; //White smoke
		["rhs_mag_rgn", 1] call FNC_AddItem; //Frag grenade

		["rhs_30Rnd_545x39_7N10_AK",6,"vest"] call FNC_AddItem; // Ammo

		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider

	};


	case (package + "PILOT") :
	{ //RPK
		_unit forceAddUniform "rhs_uniform_df15";
		_unit addHeadgear "rhs_zsh7a";
		ADD_GROUP(IFAK);
		ADD_GROUP(items);
		["rhs_assault_umbts"] call FNC_AddItem;
		["ACRE_PRC343",1,"backpack"] call FNC_AddItem; // SR Radio
		["ACRE_PRC148",1,"backpack"] call FNC_AddItem; // PLT Radio
		["ACRE_PRC117F",1,"backpack"] call FNC_AddItem; // COY Radio
		["rhs_30Rnd_545x39_7N10_AK",2,"uniform"] call FNC_AddItem; // Ammo
		["rhs_weap_ak74m"] call FNC_AddItem; // AK
		_unit addPrimaryWeaponItem "rhs_acc_dtk"; // Flash Hider
	};

	case (package + "BMP") : { //RPK

		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		clearItemCargoGlobal _unit;

		_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 4];
		_unit addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag", 4];
		_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VR_mag", 4];
		_unit addMagazineCargoGlobal ["rhs_rshg2_mag", 2];
		_unit addWeaponCargoGlobal ["rhs_weap_rpg26", 2];
		_unit addWeaponCargoGlobal ["rhs_weap_rshg2", 2];
		_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK", 40];
		_unit addMagazineCargoGlobal ["rhs_rpg26_mag", 2];
		_unit addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 15];
		//_unit addWeaponCargoGlobal "JS_RF_AK47";
		//_unit addMagazineCargoGlobal ["JS_30rnd_AK47", 20];
		_unit addMagazineCargoGlobal ["rhs_mag_rdg2_white", 6];
		_unit addMagazineCargoGlobal ["rhs_mag_rgd5", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 5];
		_unit addItemCargoGlobal ["ACE_packingBandage", 10];
		_unit addItemCargoGlobal ["ACE_morphine", 5];
		_unit addItemCargoGlobal ["ACE_personalAidKit",5];
		_unit addMagazineCargoGlobal ["rhs_VOG25", 20];
		_unit addMagazineCargoGlobal ["rhs_GRD40_White", 5];
		_unit addMagazineCargoGlobal ["rhs_VG40SZ", 10];
		_unit addItemCargoGlobal ["NVGoggles", 1];
		_unit addItemCargoGlobal ["rhs_acc_1pn93_1",1];
		_unit addItemCargoGlobal ["rhs_acc_1p29",1];
		_unit addItemCargoGlobal ["rhs_balaclava",4];
		_unit addItemCargoGlobal ["rhs_scarf",4];

		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_packingBandage", 10];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV_250",10];
		_unit addItemCargoGlobal ["ACE_salineIV_250",10];
		_unit addItemCargoGlobal ["ACE_quikclot",10];
		_unit addItemCargoGlobal ["ACE_elasticBandage",10];
		_unit addItemCargoGlobal ["ACE_plasmaIV_250",10];
		_unit addItemCargoGlobal ["ACE_tourniquet",10];
		_unit addItemCargoGlobal ["ACE_fieldDressing",10];
		_unit addItemCargoGlobal ["ACE_personalAidKit",10];
	};
