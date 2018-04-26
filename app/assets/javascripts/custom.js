$(document).on('turbolinks:load', function() {
    $(".tablinks").click(function(e){
        var element = $(e.target).text();
        $(".tabcontent").hide();
        $("#"+element).show();
        console.log(element);
    })
});

// function productInfo(event, category) {
//     var i, tabcontent, tablinks;
//
//     tabcontent = document.getElementsByClassName("tabcontent");
//     for (i = 0; i < tabcontent.length; i++) {
//         tabcontent[i].style.display = "none";
//     }
//
//     tablinks = document.getElementsByClassName("tablinks");
//     for (i = 0; i < tablinks.length; i++) {
//         tablinks[i].className = tablinks[i].className.replace(" active", "");
//     }
//
//     document.getElementById(category).style.display = "block";
//     event.currentTarget.className += " active";
// }