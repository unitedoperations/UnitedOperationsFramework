class UO_FW_ArtilleryAIFO
{
    displayName = "Artillery AI FO Options";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_ArtilleryFOAIEnabled
        {
            property = "UO_FW_ArtilleryFOAIEnabled";
            displayName = "Make Unit an Artillery AI FO?";
            tooltip = "Enables Artillery FO";
            control = "UO_FW_CheckBoxStateAIOnlyCategory";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOAIGuns
        {
            displayName = "Guns Available to Observer";
            tooltip = "List of guns the FO is able to use seperated by comma. Default empty";
            property = "UO_FW_ArtilleryFOAIGuns";
            control = "EditArray";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "[]";
        };
        class UO_FW_ArtilleryFOAIKnowledge
        {
            displayName = "Knowledge Required";
            tooltip = "Minimum required knowledge about unit targeted. https://community.bistudio.com/wiki/knowsAbout. Default 3";
            property = "UO_FW_ArtilleryFOAIKnowledge";
            control = QMGVAR(1To4Step01_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "3";
        };
        class UO_FW_ArtilleryFOAIMinRange
        {
            displayName = "Minimal Range";
            tooltip = "minimum range between firemission to stop 10 batteries shooting 1 guy. Default 300";
            property = "UO_FW_ArtilleryFOAIminRange";
            control = QMGVAR(200To1000Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "300";
        };
        class UO_FW_ArtilleryFOAIViewRange
        {
            displayName = "View Range";
            tooltip = "Maximum range the FO can see. Default 1000";
            property = "UO_FW_ArtilleryFOAIViewRange";
            control = QMGVAR(500To2500Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "1000";
        };
        class UO_FW_ArtilleryFOAIDispersion
        {
            displayName = "Dispersion";
            tooltip = "Dispersion of called in artillery strike. Default 200";
            property = "UO_FW_ArtilleryFOAIDispersion";
            control = QMGVAR(0To250Step10_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "200";
        };
        class UO_FW_ArtilleryFOAISalvoCount
        {
            displayName = "Ammount Of Salvos";
            tooltip = "Number of salvos the artillery should fire. Default 3";
            property = "UO_FW_ArtilleryFOAISalvoCount";
            control = QMGVAR(1To5Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "3";
        };
        class UO_FW_ArtilleryFOAIRoundsPerSalvo
        {
            displayName = "Rounds Per Salvo";
            tooltip = "Number of rounds which should be fired per salvo. Default 5";
            property = "UO_FW_ArtilleryFOAIRoundsPerSalvo";
            control = QMGVAR(1To10Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "5";
        };
        class UO_FW_ArtilleryFOAISalvoWaitTime
        {
            displayName = "Time Between Salvos";
            tooltip = "Time between salvos, which should be waited in seconds. Default 30";
            property = "UO_FW_ArtilleryFOAISalvoWaitTime";
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "30";
        };
        class UO_FW_ArtilleryFOAIMinSpottedDistance
        {
            displayName = "Spotting Round Distance";
            tooltip = "Range in m of how close a spotting round needs to land near the target before a firemission is fired. Setting this to zero disables the accuracy requirement of the spotting round. Default 150";
            property = "UO_FW_ArtilleryFOAIMinSpottedDistance";
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "150";
        };
        class UO_FW_ArtilleryFOAIRoundIndex
        {
            displayName = "Round Index";
            tooltip = "Ammunition index from _artillery call UO_FW_fnc_GetAmmoDisplayNameAndIndex. 0 is generally HE. Default 0";
            property = "UO_FW_ArtilleryFOAIRoundIndex";
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "0";
        };
        class UO_FW_ArtilleryFOAIAccuracy
        {
            displayName = "Estimation Accuracy";
            tooltip = "Accuracy of location estimation of target in meters. Default 50";
            property = "UO_FW_ArtilleryFOAIAccuracy";
            control = QMGVAR(0To250Step10_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class UO_FW_ArtilleryFOAISpeed
        {
            displayName = "Call In Speed";
            tooltip = "Time needed for FO to calculate firemission. Default 30";
            property = "UO_FW_ArtilleryFOAISpeed";
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "30";
        };
    };
};
