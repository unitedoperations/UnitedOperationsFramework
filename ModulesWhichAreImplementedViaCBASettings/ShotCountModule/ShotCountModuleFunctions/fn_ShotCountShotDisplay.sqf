_this spawn
{

    _arrayBLU = param [0];
    _arrayRED = param [1];
    _arrayRES = param [2];
    aCount_textBLU = "BLUFOR Munitions Expended:<br/>";
    aCount_textRED = "REDFOR Munitions Expended:<br/>";
    aCount_textRES = "RESISTANCE Munitions Expended:<br/>";
    for [{ _i = 0}, {_i < count _arrayBLU}, {_i = _i + 2}] do
    {
        _label = _arrayBLU select (_i);
        _count = _arrayBLU select (_i + 1);
        aCount_textBLU = aCount_textBLU + _label + ": " + str(_count) + " Rounds" + "<br/>";
    };

    for [{ _i = 0}, {_i < count _arrayRED}, {_i = _i + 2}] do
    {
        _label = _arrayRED select (_i);
        _count = _arrayRED select (_i + 1);
        aCount_textRED = aCount_textRED + _label + ": " + str(_count) + " Rounds" + "<br/>";
    };

    for [{ _i = 0}, {_i < count _arrayRES}, {_i = _i + 2}] do
    {
        _label = _arrayRES select (_i);
        _count = _arrayRES select (_i + 1);
        aCount_textRES = aCount_textRES + _label + ": " + str(_count) + " Rounds" + "<br/>";
    };

};
