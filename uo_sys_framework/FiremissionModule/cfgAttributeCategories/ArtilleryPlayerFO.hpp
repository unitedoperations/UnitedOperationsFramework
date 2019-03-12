class UO_FW_ArtilleryPlayerFO
{
    displayName = "Artillery Player FO Options";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_ArtilleryFOPlayerEnabled
        {
            property = "UO_FW_ArtilleryFOPlayerEnabled";
            displayName = "Artillery Player FO";
            tooltip = "Enables Artillery Player FO";
            control = "UO_FW_CheckBoxStatePlayerOnlyCategory";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerGuns
        {
            displayName = "Guns Available to Observer";
            tooltip = "List of guns the FO is able to use seperated by comma. Use editor variable names for units. Default empty";
            property = "UO_FW_ArtilleryFOPlayerGuns";
            control = "EditArray";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "[]";
            typeName = "STRING";
        };
        class UO_FW_ArtilleryFOPlayerAllowBracketFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowBracketFiremission";
            displayName = "Allow Bracket Firemission";
            tooltip = "Enables Bracket Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowDonutFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowDonutFiremission";
            displayName = "Allow Donut Firemission";
            tooltip = "Enables Donut Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowGridspottingFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowGridspottingFiremission";
            displayName = "Allow Gridspotting Firemission";
            tooltip = "Enables Gridspotting Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowLineFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowLineFiremission";
            displayName = "Allow Line Firemission";
            tooltip = "Enables Line Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowMarkerFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowMarkerFiremission";
            displayName = "Allow Marker Firemission";
            tooltip = "Enables Marker Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowPointFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowPointFiremission";
            displayName = "Allow Point Firemission";
            tooltip = "Enables Point Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowPolarFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowPolarFiremission";
            displayName = "Allow Polar Firemission";
            tooltip = "Enables Polar Firemission";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectControllable";
        };
        class UO_FW_ArtilleryFOPlayerAllowPolarspottingFiremission
        {
            property = "UO_FW_ArtilleryFOPlayerAllowPolarspottingFiremission";
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
