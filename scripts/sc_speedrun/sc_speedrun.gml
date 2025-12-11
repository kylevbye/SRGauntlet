function ellapsed_time_to_string(){
    
    
    // Convert to timer format: 
    // MM:SS:CS
    var minutes = floor(global.time_elapsed/60);
    var seconds = floor(global.time_elapsed - (60*minutes));
    var centiseconds = floor((global.time_elapsed - floor(global.time_elapsed))*100);

    var time_format = "{0}:{1}:{2}";

    // minutes 
    var minutes_str = string(minutes);
    if (string_length(minutes_str) == 1) {
        minutes_str = "0" + minutes_str;
    }

    var seconds_str = string(seconds);
    if (string_length(seconds_str) == 1) {
        seconds_str = "0" + seconds_str;
    }

    var centiseconds_str = string(centiseconds);
    if (string_length(centiseconds_str) == 1) {
       centiseconds_str = "0" + centiseconds_str;
    }

    var time_str = string(time_format, minutes_str, seconds_str, centiseconds_str);
    
    return time_str;
}