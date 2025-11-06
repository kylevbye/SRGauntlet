function ChangeVolume(_delta, _VOLUME_CHOICE){
    var new_volume_val = GetVolumeValue(_VOLUME_CHOICE) + _delta;
    if (CheckVolumeValue(new_volume_val)) {
        SetVolumeValue(new_volume_val, _VOLUME_CHOICE);
    }
}

function GetVolumeValue(_VOLUME_CHOICE) {
    var return_value = 0.0;
    
    switch (_VOLUME_CHOICE) {
        case VOLUME_CHOICES.SFX:
            return_value = global.snd_volume;
            break;
        case VOLUME_CHOICES.MUSIC:
            return_value = global.mus_volume;
            break;
    }
    
    return return_value;
}

function SetVolumeValue(_value, _VOLUME_CHOICE) {
    switch (_VOLUME_CHOICE) {
        case VOLUME_CHOICES.SFX:
            global.snd_volume = _value;
            break;
        case VOLUME_CHOICES.MUSIC:
            global.mus_volume = _value;
            break;
    }
}

function CheckVolumeValue(_value) {
    return (_value >= 0.0) && (_value <= 1.0);
}