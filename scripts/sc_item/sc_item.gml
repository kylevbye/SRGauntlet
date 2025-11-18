function item_to_string(_item) {
    return_str = "---";
    if (_item != ITEM.NONE) {
        if (!instance_exists(_item)) {
            instance_create_layer(0,0,"Instances",_item);
        }
        return_str = variable_instance_get(instance_find(_item, 0), "name");
    }
    return return_str;
}
function use_postcard(){

}