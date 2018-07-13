class UO_FW_ArtilleryAIFO
{
    displayName = "Artillery AI FO Settings";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_ArtilleryFOAIEnabled
		{
			property = "UO_FW_ArtilleryFOAIEnabled";
			displayName = "Artillery AI FO";
			tooltip = "Enables Artillery FO";
			control = "CheckboxState";
			expression="_this setVariable ['%s', _value];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_ArtilleryFOAIGuns
		{
			displayName = "Aviable Guns";
			tooltip = "List of guns the FO is able to use seperated by comma. Default empty";
			property = "UO_FW_ArtilleryFOAIGuns";
			control = "EditArray";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			defaultValue = "[]";
		};
		class UO_FW_ArtilleryFOAIKnowledge
		{
			displayName = "AI FO Knowledge Required";
			tooltip = "Minimum required knowledge about unit targeted. https://community.bistudio.com/wiki/knowsAbout. Default 3";
			property = "UO_FW_ArtilleryFOAIKnowledge";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "3";
		};
		class UO_FW_ArtilleryFOAIMinRange
		{
			displayName = "AI FO Minimal Range";
			tooltip = "minimum range between firemission to stop 10 batteries shooting 1 guy. Default 300";
			property = "UO_FW_ArtilleryFOAIminRange";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "300";
		};
		class UO_FW_ArtilleryFOAIViewRange
		{
			displayName = "AI FO View Range";
			tooltip = "Maximum range the FO can see. Default 1000";
			property = "UO_FW_ArtilleryFOAIViewRange";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "1000";
		};
		class UO_FW_ArtilleryFOAIDispersion
		{
			displayName = "AI FO Dispersion";
			tooltip = "Dispersion of called in artillery strike. Default 200";
			property = "UO_FW_ArtilleryFOAIDispersion";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "200";
		};
		class UO_FW_ArtilleryFOAIBurstCount
		{
			displayName = "AI FO Burst Count";
			tooltip = "Number of bursts the artillery should fire. Default 3";
			property = "UO_FW_ArtilleryFOAIBurstCount";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "3";
		};
		class UO_FW_ArtilleryFOAIRoundsPerBurst
		{
			displayName = "AI FO Rounds Per Burst";
			tooltip = "Number of rounds which should be fired per burst. Default 5";
			property = "UO_FW_ArtilleryFOAIRoundsPerBurst";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "5";
		};
		class UO_FW_ArtilleryFOAIBurstWaitTime
		{
			displayName = "AI FO Burst Wait Time";
			tooltip = "Time between bursts, which should be waited in seconds. Default 30";
			property = "UO_FW_ArtilleryFOAIBurstWaitTime";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "30";
		};
		class UO_FW_ArtilleryFOAIMinSpottedDistance
		{
			displayName = "AI FO Minimum Spotted Distance";
			tooltip = " range in m of how close a spotting round needs to be to be accepted. Default 150";
			property = "UO_FW_ArtilleryFOAIMinSpottedDistance";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "150";
		};
		class UO_FW_ArtilleryFOAIRoundIndex
		{
			displayName = "AI FO Round Index";
			tooltip = "Ammunition index from _artillery call UO_FW_FNC_GetAmmoDisplayNameAndIndex. 0 is generally HE. Default 0";
			property = "UO_FW_ArtilleryFOAIRoundIndex";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "0";
		};
		class UO_FW_ArtilleryFOAIAccuracy
		{
			displayName = "AI FO Accuracy";
			tooltip = "Accuracy of location estimation of target in meters. Default 50";
			property = "UO_FW_ArtilleryFOAIAccuracy";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "50";
		};
		class UO_FW_ArtilleryFOAISpeed
		{
			displayName = "AI FO Speed";
			tooltip = "Time needed for FO to calculate firemission. Default 30";
			property = "UO_FW_ArtilleryFOAISpeed";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectBrain";
			validate = "number";
			typeName = "NUMBER";
			defaultValue = "30";
		};
	};
};