class EGVAR(AI,InitPost) {
    init = "_this call UO_FW_AI_playerInit;";
};

//class EGVAR(AI,InitPost) {
//    init = "\
//        if (isPlayer _this) then {\
//            _this call UO_FW_AI_playerInit;\
//        } else {\
//            _this call UO_FW_AI_onInit;\
//        };\
//    ";
//};
