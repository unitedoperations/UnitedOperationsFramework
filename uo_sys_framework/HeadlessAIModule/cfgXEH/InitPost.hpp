class UO_FW_AI_InitPost {
    init = "\
        if (isPlayer _this) then {\
            _this call UO_FW_HC_playerInit;\
        };\
    ";
};

//class UO_FW_AI_InitPost {
//    init = "\
//        if (isPlayer _this) then {\
//            _this call UO_FW_HC_playerInit;\
//        } else {\
//            _this call UO_FW_HC_onInit;\
//        };\
//    ";
//};
