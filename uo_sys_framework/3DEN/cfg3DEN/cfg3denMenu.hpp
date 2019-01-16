class UO_FW_Export_Menu {
	displayName = "Export Settings";
	display = "Display3DENEditAttributesPreviewHalfSized";
	class AttributeCategories {
		class UO_FW_ExportAttributes {
			displayName = "Export Mission Settings";
			collapsed = 0;
			class Attributes {
				class UO_FW_EXPORT_ExportToClipboard {
					property = "UO_FW_EXPORT_ExportToClipboard";
					displayName = "Export to Clipboard";
					tooltip = "Export framework settings to Clipboard";
					control = "UO_FW_ExportToClipboardAttribute";
					expression = "";
					defaultValue = "[]";
				};
				class UO_FW_EXPORT_ExportToProfile {
					property = "UO_FW_EXPORT_ExportToProfile";
					displayName = "Export to Profile";
					tooltip = "Enter the name of the settings preset that will be saved to your profile";
					control = "UO_FW_ExportToProfileAttribute";
					expression = "";
					defaultValue = "''";
				};
			};
		};
	};
};

class UO_FW_Import_Menu {
	displayName = "Import Settings";
	display = "Display3DENEditAttributesPreviewHalfSized";
	class AttributeCategories {
		class UO_FW_ImportAttributes {
			displayName = "Import Mission Settings";
			collapsed = 0;
			class Attributes {
				class UO_FW_Import_ImportFromClipboard {
					property = "UO_FW_Import_ImportFromClipboard";
					displayName = "Import from Clipboard";
					tooltip = "Import framework settings from Clipboard";
					control = "UO_FW_ImportFromClipboardAttribute";
					expression = "";
					defaultValue = "[]";
				};
				class UO_FW_IMPORT_ImportfromProfile {
					property = "UO_FW_IMPORT_ImportfromProfile";
					displayName = "Import from Profile";
					tooltip = "Enter the name of the settings preset that will be loaded from your profile";
					control = "UO_FW_ImportFromProfileAttribute";
					expression = "";
					defaultValue = "''";
				};
			};
		};
	};
};
