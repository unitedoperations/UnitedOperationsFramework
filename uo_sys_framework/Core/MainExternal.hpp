class Display;
class DisplaySimulated;
class ctrlControlsGroupNoScrollbars;
class ctrlButton;
class ctrlButtonPictureKeepAspect;
class ctrlDefaultText;
class ctrlDefault;
class ctrlMenuStrip;
class ctrlToolbox;
class ctrlCheckbox;
class ctrlCombo;
class ctrlEdit;
class ctrlStatic;
class ctrlTree;
class ctrlListbox;
class ControlsBackground;
class ctrlStaticBackground;
class ctrlStaticFooter;
class ctrlStaticTitle;
class ctrlControlsGroup;
class ctrlButtonOK;
class ctrlButtonCancel;
class ctrlCheckboxBaseline;
class Type;
class Init;
class State;
class Transformation;
class Control;
class Presence;
class Size;
//custom attributes menu
class Display3DENEditAttributesPreview {
    class ControlsBackground {
        class Background;
        class BackgroundButtons;
        class Title;
        class AttributeCategories;
        class ButtonOK;
        class ButtonCancel;
    };
    class Controls;
    class AttributeCategory {
        class Controls {
            class Minimize: ctrlCheckbox {
                show=0;
                x="0 * (pixelW * pixelGrid *     0.50)";
                y=0;
                w="5 * (pixelW * pixelGrid *     0.50)";
                h="5 * (pixelH * pixelGrid *     0.50)";
                textureChecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
                textureUnchecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
                textureFocusedChecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
                textureFocusedUnchecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
                textureHoverChecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
                textureHoverUnchecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
                texturePressedChecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
                texturePressedUnchecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
                textureDisabledChecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
                textureDisabledUnchecked="\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
                color[]={1,1,1,0.5};
                colorFocused[]={1,1,1,0.5};
                colorHover[]={1,1,1,0.5};
                colorPressed[]={1,1,1,0.5};
                colorDisabled[]={1,1,1,0.5};
            };
            class Title: ctrlButton {
                show=0;
                x="5 * (pixelW * pixelGrid *     0.50)";
                y="pixelH";
                w="(    140 -     5 - 3) * (pixelW * pixelGrid *     0.50)";
                h="5 * (pixelH * pixelGrid *     0.50)";
                style="0x10 + 0x200";
                font="RobotoCondensedLight";
                sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                colorText[]={1,1,1,0.5};
                colorBackground[]={0.2,0.2,0.2,1};
                colorFocused[]={0.2,0.2,0.2,1};
                colorBackgroundActive[]={0.2,0.2,0.2,1};
                colorShadow[]={1,1,1,0.5};
                offsetX=0;
                offsetY="-pixelH";
                offsetPressedX=0;
                offsetPressedY=0;
            };
            class Attributes: ctrlControlsGroupNoScrollbars {
                y="4 * (pixelH * pixelGrid *     0.50) + 8 * pixelH";
                w="(    140 - 5) * (pixelW * pixelGrid *     0.50)";
                class Controls {};
            };
        };
        class AttributeOverlay {
            class Controls {
                class AttributeOverlay;
                class AttributeEnable;
            };
        };
    };
};
class Display3DENEditAttributesPreviewHalfSized: Display3DENEditAttributesPreview {
    class ControlsBackground: ControlsBackground {
        class Background: Background {
            y="0.5 - (    (safezoneH * 0.56) min (    65 * (pixelH * pixelGrid *     0.50))) * 0.5 + 10 * (pixelH * pixelGrid *     0.50)";
            h="(    (safezoneH * 0.56) min (    65 * (pixelH * pixelGrid *     0.50))) - (    5 + 10) * (pixelH * pixelGrid *     0.50)";
        };
        class BackgroundButtons: BackgroundButtons {};
        class Title: Title {};
        class AttributeCategories: AttributeCategories {};
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
    class AttributeCategory: ctrlControlsGroupNoScrollbars {
        y="2 * pixelH";
        w="(    120 - 1) * (pixelW * pixelGrid *     0.50)";
        class Controls {
            class Minimize: ctrlCheckbox {
                x="0 * (pixelW * pixelGrid *     0.50)";
                y=0;
                w="5 * (pixelW * pixelGrid *     0.50)";
                h="5 * (pixelH * pixelGrid *     0.50)";
                fade=1;
                show=0;
                color[]={0,0,0,0};
                colorText[]={0,0,0,0};
                colorFocused[]={0,0,0,0};
                colorHover[]={0,0,0,0};
                colorPressed[]={0,0,0,0};
                colorDisabled[]={0,0,0,0};
                colorBackground[]={{0,0,0,0};
                colorBackgroundDisabled[]={0,0,0,0};
                colorBackgroundActive[]={0,0,0,0};
                colorShadow[]={0,0,0,0};
                onCanDestroy="";
                onDestroy="";
                onMouseEnter="";
                onMouseExit="";
                onSetFocus="";
                onKillFocus="";
                onKeyDown="";
                onKeyUp="";
                onMouseButtonDown="";
                onMouseButtonUp="";
                onMouseButtonClick="";
                onMouseButtonDblClick="";
                onMouseZChanged="";
                onMouseMoving="";
                onMouseHolding="";
                onCheckBoxesSelChanged="";
            };
            class Title: ctrlButton {
                x="5 * (pixelW * pixelGrid *     0.50)";
                y="pixelH";
                w="(    140 -     5 - 3) * (pixelW * pixelGrid *     0.50)";
                h="5 * (pixelH * pixelGrid *     0.50)";
                fade=1;
                show=0;
                color[]={0,0,0,0};
                colorText[]={0,0,0,0};
                colorFocused[]={0,0,0,0};
                colorHover[]={0,0,0,0};
                colorPressed[]={0,0,0,0};
                colorDisabled[]={0,0,0,0};
                colorBackground[]={{0,0,0,0};
                colorBackgroundDisabled[]={0,0,0,0};
                colorBackgroundActive[]={0,0,0,0};
                colorShadow[]={0,0,0,0};
                offsetX="0";
                offsetY="0";
                offsetPressedX=0;
                offsetPressedY=0;
                onCanDestroy="";
                onDestroy="";
                onMouseEnter="";
                onMouseExit="";
                onSetFocus="";
                onKillFocus="";
                onKeyDown="";
                onKeyUp="";
                onMouseButtonDown="";
                onMouseButtonUp="";
                onMouseButtonClick="";
                onMouseButtonDblClick="";
                onMouseZChanged="";
                onMouseMoving="";
                onMouseHolding="";
                onCheckBoxesSelChanged="";
            };
            class Attributes: ctrlControlsGroupNoScrollbars {
                y="4 * (pixelH * pixelGrid *     0.50) + 8 * pixelH";
                w="(    120 - 5) * (pixelW * pixelGrid *     0.50)";
                class Controls {};
            };
        };
        class AttributeOverlay: ctrlControlsGroupNoScrollbars {
            y="4 * pixelH";
            class Controls {
                class AttributeOverlay: ctrlStatic {
                    style=2;
                    colorBackground[]={0.2,0.2,0.2,0.89999998};
                };
                class AttributeEnable: ctrlCheckbox {
                    w="5 * (pixelW * pixelGrid *     0.50)";
                    h="5 * (pixelH * pixelGrid *     0.50)";
                    tooltip="$STR_3DEN_Display3DENEditAttributes_AttributeEnable_tooltip";
                };
            };
        };
    };
};
