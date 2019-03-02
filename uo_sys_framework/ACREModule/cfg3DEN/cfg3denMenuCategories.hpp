class EGVAR(ACRE,MainSettings) {
    displayName = "Main ACRE Settings";
    class AttributeCategories {
        #include "ACRE\MainSettings.hpp"
    };
};

class EGVAR(ACRE,Blufor) {
    displayName = "Blufor ACRE Configuration";
    class AttributeCategories {
        #include "ACRE\Blufor.hpp"
    };
};

class EGVAR(ACRE,Opfor) {
    displayName = "Opfor ACRE Configuration";
    class AttributeCategories {
        #include "ACRE\Opfor.hpp"
    };
};

class EGVAR(ACRE,Indfor) {
    displayName = "Indfor ACRE Configuration";
    class AttributeCategories {
        #include "ACRE\Indfor.hpp"
    };
};

class EGVAR(ACRE,Civilian) {
    displayName = "Civilian ACRE Configuration";
    class AttributeCategories {
        #include "ACRE\Civ.hpp"
    };
};
