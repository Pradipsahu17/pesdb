
function showMessage(message, type) {
        $(function () {
            $('#message-show').show();
            if (type == "danger") {
                $('#message-show').css("background-color", "red");
                $('#message-show').css("color", "White");
                $('#message-show').removeClass('alert-*').addClass('alert alert-' + type).find('.session-msg').html("<i class='fa fa-times'></i>&nbsp;" + message);
            }
            else if (type == "success") {
                $('#message-show').css("background-color", "green");
                $('#message-show').css("color", "White");
                $('#message-show').removeClass('alert-*').addClass('alert alert-' + type).find('.session-msg').html("<i class='fa fa-check'></i>&nbsp;" + message);
            }
            else if (type == "info") {
                $('#message-show').css("background-color", "yellow");
                $('#message-show').css("color", "White");
                $('#message-show').removeClass('alert-*').addClass('alert alert-' + type).find('.session-msg').html("<i class='fa fa-exclamation-triangle'></i>&nbsp;" + message);
            }
            else {

                $('#message-show').css("background-color", "Black");
                $('#message-show').css("color", "White");
                $('#message-show').removeClass('alert-*').addClass('alert alert-' + type).find('.session-msg').html("<i class='fa fa-spinner'></i>&nbsp;" + message);
            }

            setTimeout(function () {
                $('#message-show').hide('slow');
            }, 8000);
        });
    };
    $(function () {
        $('#message-show').hide();
    });
