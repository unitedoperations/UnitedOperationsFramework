class UO_FW_ACRE_ChannelSelect: Title
		{
			attributeLoad="		(_this controlsGroupCtrl 100) ctrlSetText str _value;	";
			attributeSave="		parsenumber ctrlText (_this controlsGroupCtrl 100),	";
			class Controls: Controls
			{
				class Title: Title
				{
				};
				class TitleZ: ctrlStatic
				{
					text="Channel";
					style=2;
					shadow=0;
					x="48 * (pixelW * pixelGrid * 	0.50)";
					w="(	14) * (pixelW * pixelGrid * 	0.50)";
					h="5 * (pixelH * pixelGrid * 	0.50)";
					colorText[]={1,1,1,1};
					colorBackground[]={0.25999999,0.51999998,0.92000002,1};
				};
				class ValueZ: ctrlEdit
				{
					idc=100;
					text="0";
					x="(	48 + 	(	14)) * (pixelW * pixelGrid * 	0.50)";
					w="(	82 / 3 - 	14) * (pixelW * pixelGrid * 	0.50)";
					h="5 * (pixelH * pixelGrid * 	0.50)";
					font="EtelkaMonospacePro";
					sizeEx="3.875 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
				};
			};
		};
