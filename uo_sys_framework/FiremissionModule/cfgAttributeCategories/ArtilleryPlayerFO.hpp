#include "\x\UO_FW\addons\Main\script_macros.hpp"

class EGVAR(Firemission,ArtilleryPlayerFO)
{
    displayName = "Artillery Player FO Options";
    collapsed = 1;
    class Attributes
    {
        class EGVAR(Firemission,ArtilleryFOPlayerEnabled)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerEnabled);
            displayName = "Artillery Player FO";
            tooltip = "Enables Artillery Player FO";
            control = QEGVAR(Core,CheckBoxStatePlayerOnlyCategory);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerGuns)
        {
            displayName = "Guns Available to Observer";
            tooltip = "List of guns the FO is able to use seperated by comma. Use editor variable names for units. Default empty";
            property = QEGVAR(Firemission,ArtilleryFOPlayerGuns);
            control = "EditArray";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "[]";
            typeName = "STRING";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowBracketFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowBracketFiremission);
            displayName = "Allow Bracket Firemission";
            tooltip = "Enables Bracket Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowDonutFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowDonutFiremission);
            displayName = "Allow Donut Firemission";
            tooltip = "Enables Donut Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowGridspottingFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowGridspottingFiremission);
            displayName = "Allow Gridspotting Firemission";
            tooltip = "Enables Gridspotting Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowLineFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowLineFiremission);
            displayName = "Allow Line Firemission";
            tooltip = "Enables Line Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowMarkerFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowMarkerFiremission);
            displayName = "Allow Marker Firemission";
            tooltip = "Enables Marker Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowPointFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowPointFiremission);
            displayName = "Allow Point Firemission";
            tooltip = "Enables Point Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowPolarFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowPolarFiremission);
            displayName = "Allow Polar Firemission";
            tooltip = "Enables Polar Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class EGVAR(Firemission,ArtilleryFOPlayerAllowPolarspottingFiremission)
        {
            property = QEGVAR(Firemission,ArtilleryFOPlayerAllowPolarspottingFiremission);
            displayName = "Allow Polarspotting Firemission";
            tooltip = "Enables Polarspotting Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };

    };
};
