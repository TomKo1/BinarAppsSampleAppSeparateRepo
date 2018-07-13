$(function() {
    $('.new-author').on('ajax:send', function(){
        $('.new-author').append('<img class="loader" src="https://media.giphy.com/media/N256GFy1u6M6Y/giphy.gif"/>');
    });

    $('.new-author').on('ajax:complete', function(){
        $('.loader').remove();    
    });

} );
// ta funkcja jest zeby opoznic 