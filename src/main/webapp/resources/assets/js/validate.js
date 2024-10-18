function validate(form_id, check_target_id, msg) {
    console.log('check for ', check_target_id, 'in', form_id);
    
    $(document).ready(function() {
        $("#" + form_id).on('submit', function(e) {
            if (!$("#" + check_target_id).val()) {
                e.preventDefault();
                alert("Please enter " + msg + ".");
            }
        });
    });
}