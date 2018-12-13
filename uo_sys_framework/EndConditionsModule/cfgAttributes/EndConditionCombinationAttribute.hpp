//radio selection dialog
//name radio channels dialog?

class UO_FW_ENDCONDITIONS_SELECT: Title {
	idc=100;
	h="12 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls
	{
		class Title: Title
		{
			style=1;
			h="12 * (pixelH * pixelGrid * 	0.50)";
		};
		class EndCondNum1: ctrlStatic 
		{
			idc=101;
			text= "1";
			x="(46) * (pixelW * pixelGrid * 	0.50)";
			style=2;
			shadow=0;
			w="(12) * (pixelW * pixelGrid * 	0.50)";
			h="12 * (pixelH * pixelGrid * 	0.50)";
			colorText[]={1,1,1,1};
		};
		class EndCondBox1: ctrlCheckbox
		{
			idc=102;
			x="(46 + 8) * (pixelW * pixelGrid * 	0.50)";
			y="(4) * (pixelW * pixelGrid * 	0.50)";
			w="6 * (pixelW * pixelGrid * 	0.50)";
			h="6 * (pixelH * pixelGrid * 	0.50)";
		};
		//46 54 58 66 70
		class EndCondNum2: EndCondNum1 
		{
			idc=103;
			text= "2";
			x="(46 + 8 + 4) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondBox2: EndCondBox1 
		{
			idc=104;
			x="(46 + 8 + 4 + 8) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondNum3: EndCondNum1 
		{
			idc=105;
			text= "3";
			x="(46 + 8 + 4 + 8 + 4) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondBox3: EndCondBox1
		{
			idc=106;
			x="(46 + 8 + 4 + 8 + 4 + 8) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondNum4: EndCondNum1 
		{
			idc=107;
			text= "4";
			x="(46 + 8 + 4 + 8 + 4 + 8 + 4) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondBox4: EndCondBox1
		{
			idc=108;
			x="(46 + 8 + 4 + 8 + 4 + 8 + 4 + 8) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondNum5: EndCondNum1 
		{
			idc=109;
			text= "5";
			x="(46 + 8 + 4 + 8 + 4 + 8 + 4 + 8 + 4) * (pixelW * pixelGrid * 	0.50)";
		};
		class EndCondBox5: EndCondBox1
		{
			idc=110;
			x="(46 + 8 + 4 + 8 + 4 + 8 + 4 + 8 + 4 + 8) * (pixelW * pixelGrid * 	0.50)";
		};
	};
};
