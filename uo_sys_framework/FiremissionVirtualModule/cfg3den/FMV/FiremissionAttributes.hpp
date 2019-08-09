
#define FMV_ROUND(UNITNUM,ROUNDNUM)\
class PREFIX##_FiremissionVirtual_RoundClassName_##UNITNUM##_##ROUNDNUM {\
   property = QUOTE(TRIPLES(PREFIX##_FiremissionVirtual_RoundClassName,UNITNUM,ROUNDNUM));\
   displayName = QUOTE(Round ROUNDNUM Classname);\
   tooltip = "Classname of ammunition which will be created";\
   control = "Edit";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "''";\
   typeName = "STRING";\
};\
class PREFIX##_FiremissionVirtual_RoundCount_##UNITNUM##_##ROUNDNUM {\
   property = QUOTE(TRIPLES(PREFIX##_FiremissionVirtual_RoundCount,UNITNUM,ROUNDNUM));\
   displayName = QUOTE(Round ROUNDNUM Count);\
   tooltip = "Ammount of ammuntion available for the above classname";\
   control =  "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "NUMBER";\
}

#define FMV_FMATTR(ARTNUMBER)\
class PREFIX##_FiremissionVirtual_Enabled_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_Enabled,ARTNUMBER));\
   displayName = "Enabled";\
   tooltip = "Check to enable the firemission";\
   control = "CheckBoxState";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "false";\
   typeName = "BOOL";\
};\
class PREFIX##_FiremissionVirtual_Name_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_Name,ARTNUMBER));\
   displayName = "Name";\
   tooltip = "Name of the firemission displayed in the GUI. ex: B-52";\
   control = "Edit";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "''";\
   typeName = "STRING";\
};\
class PREFIX##_FiremissionVirtual_Guns_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_Guns,ARTNUMBER));\
   displayName = "Number of Guns";\
   tooltip = "Ammount of guns which are used to create this firemission. Each gun can only fire 1 shell. If 1 gun fires the entire battery is unaviable";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_Dispersion_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_Dispersion,ARTNUMBER));\
   displayName = "Dispersion";\
   tooltip = "Dispersion of the firemission in meters";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "150";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_ReloadTime_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_ReloadTime,ARTNUMBER));\
   displayName = "Reloadtime";\
   tooltip = "Time needed to reload the firemission after firing in seconds.";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_CalculationTime_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_CalculationTime,ARTNUMBER));\
   displayName = "Calculation Time";\
   tooltip = "Time needed to plot a firemission in seconds";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_FlightTime_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_FlightTime,ARTNUMBER));\
   displayName = "Flight Time";\
   tooltip = "Time needed for the firemission to reach its target in seconds";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_DelayTime_##ARTNUMBER { \
   property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_DelayTime,ARTNUMBER));\
   displayName = "Delay Time";\
   tooltip = "Time needed before the firemission fires in seconds";\
   control = "EditShort";\
   expression = SCENARIO_EXPRESSION;\
   defaultValue = "0";\
   typeName = "Number";\
};\
class PREFIX##_FiremissionVirtual_Side_##ARTNUMBER { \
    displayName = "Side"; \
    tooltip = "Artillery is restricted to this side";\
    control = "Combo";\
    typeName = "NUMBER";\
    property = QUOTE(DOUBLES(PREFIX##_FiremissionVirtual_Side,ARTNUMBER));\
    expression = SCENARIO_EXPRESSION;\
    validate = "none";\
    class values {\
        class West {name = "West"; value = 0; default = 0;};\
        class East {name = "East"; value = 1;};\
        class Ind {name = "Independent"; value = 2;};\
        class Civ {name = "Civilian"; value = 3;};\
    };\
    defaultValue = "0";\
};\
FMV_ROUND(ARTNUMBER,1)\
FMV_ROUND(ARTNUMBER,2)\
FMV_ROUND(ARTNUMBER,3)\
FMV_ROUND(ARTNUMBER,4)\
FMV_ROUND(ARTNUMBER,5)


#define FMV_ARTSETTING(ARTNUMBER) \
class PREFIX##_FiremissionVirtual_Menu_##ARTNUMBER{\
    displayName = QUOTE(Firemission ARTNUMBER Settings);\
    class AttributeCategories {\
       class  PREFIX##_FiremissionVirtual_Settings_##ARTNUMBER { \
            displayName = QUOTE(Firemission ARTNUMBER Settings); \
            collapsed = 0; \
			   class Attributes { \
                 FMV_FMATTR(ARTNUMBER) \
            }; \
        }; \
    }; \
}; \


FMV_ARTSETTING(1)
FMV_ARTSETTING(2)
FMV_ARTSETTING(3)
FMV_ARTSETTING(4)
FMV_ARTSETTING(5)
FMV_ARTSETTING(6)

