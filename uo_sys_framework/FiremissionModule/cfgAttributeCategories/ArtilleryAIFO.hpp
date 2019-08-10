#include "\x\UO_FW\addons\Main\script_macros.hpp"
class EGVAR(Firemission,ArtilleryAIFO)
{
    displayName = "Artillery AI FO Options";
    collapsed = 1;
    class Attributes
    {
        class EGVAR(Firemission,ArtilleryFOAIEnabled)
        {
            property = QEGVAR(Firemission,ArtilleryFOAIEnabled);
            displayName = "Make Unit an Artillery AI FO?";
            tooltip = "Enables Artillery FO";
            control = QEGVAR(Core,CheckBoxStateAIOnlyCategory);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOAIGuns)
        {
            displayName = "Guns Available to Observer";
            tooltip = "List of guns the FO is able to use seperated by comma. Default empty";
            property = QEGVAR(Firemission,ArtilleryFOAIGuns);
            control = "EditArray";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "[]";
        };
        class EGVAR(Firemission,ArtilleryFOAIKnowledge)
        {
            displayName = "Knowledge Required";
            tooltip = "Minimum required knowledge about unit targeted. https://community.bistudio.com/wiki/knowsAbout. Default 3";
            property = QEGVAR(Firemission,ArtilleryFOAIKnowledge);
            control = QMGVAR(1To4Step01_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "3";
        };
        class EGVAR(Firemission,ArtilleryFOAIMinRange)
        {
            displayName = "Minimal Range";
            tooltip = "minimum range between firemission to stop 10 batteries shooting 1 guy. Default 300";
            property = QEGVAR(Firemission,ArtilleryFOAIminRange);
            control = QMGVAR(200To1000Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "300";
        };
        class EGVAR(Firemission,ArtilleryFOAIViewRange)
        {
            displayName = "View Range";
            tooltip = "Maximum range the FO can see. Default 1000";
            property = QEGVAR(Firemission,ArtilleryFOAIViewRange);
            control = QMGVAR(500To2500Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "1000";
        };
        class EGVAR(Firemission,ArtilleryFOAIDispersion)
        {
            displayName = "Dispersion";
            tooltip = "Dispersion of called in artillery strike. Default 200";
            property = QEGVAR(Firemission,ArtilleryFOAIDispersion);
            control = QMGVAR(0To250Step10_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "200";
        };
        class EGVAR(Firemission,ArtilleryFOAISalvoCount)
        {
            displayName = "Ammount Of Salvos";
            tooltip = "Number of salvos the artillery should fire. Default 3";
            property = QEGVAR(Firemission,ArtilleryFOAISalvoCount);
            control = QMGVAR(1To5Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "3";
        };
        class EGVAR(Firemission,ArtilleryFOAIRoundsPerSalvo)
        {
            displayName = "Rounds Per Salvo";
            tooltip = "Number of rounds which should be fired per salvo. Default 5";
            property = QEGVAR(Firemission,ArtilleryFOAIRoundsPerSalvo);
            control = QMGVAR(1To10Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "5";
        };
        class EGVAR(Firemission,ArtilleryFOAISalvoWaitTime)
        {
            displayName = "Time Between Salvos";
            tooltip = "Time between salvos, which should be waited in seconds. Default 30";
            property = QEGVAR(Firemission,ArtilleryFOAISalvoWaitTime);
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "30";
        };
        class EGVAR(Firemission,ArtilleryFOAIMinSpottedDistance)
        {
            displayName = "Spotting Round Distance";
            tooltip = "Range in m of how close a spotting round needs to land near the target before a firemission is fired. Setting this to zero disables the accuracy requirement of the spotting round. Default 150";
            property = QEGVAR(Firemission,ArtilleryFOAIMinSpottedDistance);
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "150";
        };
        class EGVAR(Firemission,ArtilleryFOAIRoundClassName)
        {
            displayName = "Round Classname";
            tooltip = "Ammuntion classname of the round supposed to be fired. CfgMagazines classname";
            property = QEGVAR(Firemission,ArtilleryFOAIRoundClassName);
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            typeName = "STRING";
            defaultValue = "''";
        };
        class EGVAR(Firemission,ArtilleryFOAIAccuracy)
        {
            displayName = "Estimation Accuracy";
            tooltip = "Accuracy of location estimation of target in meters. Default 50";
            property = QEGVAR(Firemission,ArtilleryFOAIAccuracy);
            control = QMGVAR(0To250Step10_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class EGVAR(Firemission,ArtilleryFOAISpeed)
        {
            displayName = "Call In Speed";
            tooltip = "Time needed for FO to calculate firemission. Default 30";
            property = QEGVAR(Firemission,ArtilleryFOAISpeed);
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "30";
        };
    };
};
