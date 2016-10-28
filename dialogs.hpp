 ////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by C222, v1.063, #Qugube)
////////////////////////////////////////////////////////

class RscTitles
{
	class player_HUD
	{
		idd = -1;
		fadeout=0;
		fadein=0;
		duration = 20;
		name= "player_HUD";
		onLoad = "uiNamespace setVariable ['player_HUD', _this select 0]";
		
		class controlsBackground {
			class major_HUD:RscText
			{
				idc = 1700;
				type = CT_STRUCTURED_TEXT;
				size = 0.080;
				x = safeZoneX + (safeZoneW * (1 - (0.30 / SafeZoneW)));
				y = safeZoneY + (safeZoneH * (1 - (0.163 / SafeZoneH)));
				w = 0.28; h = 0.40;
				colorText[] = {1,1,1,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "--- SIDE";
				shadow = 2;
				class Attributes {
					align = "right";
				};
			};
			class bl_HUD:RscText
			{
				idc = 1701;
				type = CT_STRUCTURED_TEXT;
				size = 0.040;
				x = safeZoneX + (safeZoneW * (1 - (0.30 / SafeZoneW)));
				y = safeZoneY + (safeZoneH * (1 - (0.089 / SafeZoneH)));
				w = 0.14; h = 0.20;
				colorText[] = {1,1,1,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "--- SIDE";
				shadow = 2;
				class Attributes {
					align = "right";
				};
			};
			class br_HUD:RscText
			{
				idc = 1702;
				type = CT_STRUCTURED_TEXT;
				size = 0.040;
				x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
				y = safeZoneY + (safeZoneH * (1 - (0.089 / SafeZoneH)));
				w = 0.14; h = 0.20;
				colorText[] = {1,1,1,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "--- SIDE";
				shadow = 2;
				class Attributes {
					align = "right";
				};
			};
			/*class money_HUD:RscText
			{
				idc = 1703;
				type = CT_STRUCTURED_TEXT;
				size = 0.040;
				x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
				y = safeZoneY + (safeZoneH * (1 - (0.089 / SafeZoneH)));
				w = 0.14; h = 0.20;
				colorText[] = {0,1,0,1};
				lineSpacing = 3;
				colorBackground[] = {0,0,0,0};
				text = "";
				shadow = 2;
				class Attributes {
					align = "right";
				};
			};*/
		};
	};
};