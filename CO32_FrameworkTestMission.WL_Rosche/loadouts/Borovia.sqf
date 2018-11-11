	#define package "Borovia_"


	SET_GROUP(uniform)
		["rhsgref_uniform_para_ttsko_oxblood"] call FNC_AddItem;
		["rhsgref_6b23_ttsko_forest"] call FNC_AddItem;
		["B_AssaultPack_rgr"] call FNC_AddItem;
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
		["ACE_MapTools"] call FNC_AddItem;
		["skn_m04_gas_mask_blk"] call FNC_AddItem;
	END_GROUP;

	SET_GROUP(helmet)
		["rhsgref_6b27m_ttsko_forest"] call FNC_AddItem;
	END_GROUP;
		

	SET_GROUP(gun)
	["hlc_20rnd_762x51_Mk316_G3",9] call FNC_AddItem;
		["hlc_rifle_g3a3ris"] call FNC_AddItem;
		
		_unit addPrimaryWeaponItem "rhsusf_acc_compm4" ;
	END_GROUP;

	SET_GROUP(glgun)
		["hlc_20rnd_762x51_Mk316_G3",9] call FNC_AddItem;
		["HLC_Rifle_g3ka4_GL"] call FNC_AddItem;
		
		_unit addPrimaryWeaponItem "rhsusf_acc_compm4"  ;
		_unit addMagazines ["1Rnd_HE_Grenade_shell",14];

	END_GROUP;

	SET_GROUP(grenades)
		["rhs_mag_rdg2_white",2] call FNC_AddItem;
		["rhs_mag_rgd5",2] call FNC_AddItem;
	END_GROUP;

	SET_GROUP(mgAmmo)
		["JO_120rnd_MG3",1] call FNC_AddItem;
	END_GROUP;

	
	
		case (package + "PL"):
		{
			
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["Binocular"] call FNC_AddItem;
			ADD_GROUP(gun);
			_unit addItem "ACRE_PRC148";
			ADD_GROUP(mgammo);
		};
		case( package + "PSG"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			_unit addWeapon "Binocular";
			ADD_GROUP(gun);
			_unit addItem "ACRE_PRC148";
			ADD_GROUP(mgammo);
		};

			case (package+ "SL"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			
			_unit addWeapon "Binocular";
			ADD_GROUP(glgun);
			_unit addItem "ACRE_PRC148";
		};

			case (package+ "TL"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(grenades);
			ADD_GROUP(glgun);
			ADD_GROUP(mgammo);
		};

			case (package +"MD"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			_unit setVariable ["ace_medical_medicClass",1,true];
			ADD_GROUP(grenades);
			(uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing", 5];
			(uniformContainer _unit) addItemCargoGlobal ["ACE_elasticBandage", 3];
			(uniformContainer _unit) addItemCargoGlobal ["ACE_packingBandage", 3];
			(uniformContainer _unit) addItemCargoGlobal ["ACE_tourniquet", 1];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_fieldDressing", 15];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_elasticBandage", 15];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_packingBandage", 8];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_tourniquet", 3];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_salineIV", 3];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_morphine", 8];
			//(unitBackpack _unit) addItemCargoGlobal ["ACE_atropine", 15];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_epinephrine", 8];
			//(unitBackpack _unit) addItemCargoGlobal ["ACE_quikclot", 20];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_personalAidKit", 2];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_surgicalKit", 1];
			ADD_GROUP(gun);
		};

			case (package+"AT"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["rhs_rpg7_PG7VL_mag",2] call FNC_AddItem;
			["rhs_rpg7_OG7V_mag",2] call FNC_AddItem;
			["rhs_weap_rpg7"] call FNC_AddItem;
			_unit addSecondaryWeaponItem "rhs_acc_pgo7v";
			ADD_GROUP(gun);
		};

			case( package+"AAT"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["rhs_rpg7_PG7VL_mag",3] call FNC_AddItem;
			["rhs_rpg7_OG7V_mag",3] call FNC_AddItem;
			ADD_GROUP(gun);

		};
		case (package+"AT2"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["tb_mk13_heat",1] call FNC_AddItem;
			["tb_launcher_mk13",3] call FNC_AddItem;
			["tb_mk13_heat",2] call FNC_AddItem;
			ADD_GROUP(gun);
		};
		case (package+"AAT2"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["tb_mk13_heat",3] call FNC_AddItem;
			ADD_GROUP(gun);
		};

		case (package+"MG3"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			["JO_120rnd_MG3",4] call FNC_AddItem;
			["JO_MG_MG3"] call FNC_AddItem;
			_unit addPrimaryWeaponItem "optic_Aco";
			["ACE_SpareBarrel"] call FNC_AddItem;
			
		};
		case (package+"AMG3"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			ADD_GROUP(mgammo);
			["JO_120rnd_MG3T"] call FNC_AddItem;
			ADD_GROUP(gun);
    		_unit addWeapon "Binocular";
		};
		case (package+"RF"):
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			ADD_GROUP(mgammo);
			ADD_GROUP(gun);
		};

		case ( package+"Truck"):
		{
			clearWeaponCargoGlobal _unit;
			clearMagazineCargoGlobal _unit;
			clearBackpackCargoGlobal _unit;
			clearItemCargoGlobal _unit;

			_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 10];
			_unit addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag", 10];
			_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VR_mag", 10];
			_unit addMagazineCargoGlobal ["tb_mk13_heat", 1];
			_unit addMagazineCargoGlobal ["rhs_rshg2_mag", 2];
			_unit addWeaponCargoGlobal ["rhs_weap_rpg26", 5];
			_unit addWeaponCargoGlobal ["rhs_weap_rshg2", 5];
			_unit addWeaponCargoGlobal ["hlc_rifle_g3a3ris", 2];
			_unit addMagazineCargoGlobal ["hlc_20rnd_762x51_Mk316_G3", 200];
			_unit addMagazineCargoGlobal ["JO_120rnd_MG3", 50];
			_unit addMagazineCargoGlobal ["rhs_rpg26_mag", 2];
			_unit addMagazineCargoGlobal ["rhs_mag_rdg2_white", 60];
			_unit addMagazineCargoGlobal ["rhs_mag_rgd5", 100];
			_unit addItemCargoGlobal ["ACE_epinephrine", 50];
			_unit addItemCargoGlobal ["ACE_packingBandage", 100];
			_unit addItemCargoGlobal ["ACE_morphine", 50];
			_unit addItemCargoGlobal ["ACE_personalAidKit",5];
			_unit addItemCargoGlobal ["NVGoggles", 1];
		};
			case "Medicvan":
		{
			clearWeaponCargoGlobal _unit;
			clearMagazineCargoGlobal _unit;
			clearBackpackCargoGlobal _unit;
			clearItemCargoGlobal _unit;

			_unit addItemCargoGlobal ["ACE_epinephrine", 50];
			_unit addItemCargoGlobal ["ACE_packingBandage", 100];
			_unit addItemCargoGlobal ["ACE_morphine", 50];
			_unit addItemCargoGlobal ["ACE_bloodIV_250",50];
			_unit addItemCargoGlobal ["ACE_salineIV_250",50];
			_unit addItemCargoGlobal ["ACE_quikclot",50];
			_unit addItemCargoGlobal ["ACE_elasticBandage",50];
			_unit addItemCargoGlobal ["ACE_plasmaIV_250",50];
			_unit addItemCargoGlobal ["ACE_tourniquet",50];
			_unit addItemCargoGlobal ["ACE_fieldDressing",50];
			_unit addItemCargoGlobal ["ACE_personalAidKit",50];
			_unit addItemCargoGlobal ["ACE_surgicalKit", 1];
		};
		case "Driver":
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			removeHeadgear _unit;
			_unit addHeadgear "rhs_tsh4";
			_unit addWeapon "Binocular";
		};
		case "Commander":
		{
			ADD_GROUP(uniform);
			ADD_GROUP(items);
			ADD_GROUP(helmet);
			ADD_GROUP(IFAK);
			ADD_GROUP(grenades);
			removeHeadgear _unit;
			_unit addHeadgear "rhs_tsh4";
			_unit addItem "ACRE_PRC148";
			_unit addWeapon "Binocular";
		};
	
