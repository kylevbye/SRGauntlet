function menu_range_check(_value_to_check, _min_value, _max_value, _do_wrapping) {
    
    return_value = _value_to_check;
    // Range Check
    if (_value_to_check > _max_value) {
        if (_do_wrapping) return_value = _min_value;
        else return_value = _max_value;
    }
    else if (_value_to_check < _min_value) {
        if (_do_wrapping) return_value = _max_value
        else return_value = _min_value;
    }

    return return_value;
}