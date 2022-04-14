 $(document).ready(function(){

   /* Change formatting of model vendor buttons */
  $("#btn_air").on("click", function() {

     /* Change class of AIR button */
     $(this).removeClass("is-outlined");
     $(this).addClass("is-active");

     /* Change class of RMS button */
     $('#btn_rms').removeClass("is-active");
     $('#btn_rms').addClass("is-outlined");
   });

  $("#btn_rms").on("click", function() {

     /* Change class of AIR button */
     $(this).removeClass("is-outlined");
     $(this).addClass("is-active");

     /* Change class of RMS button */
     $('#btn_air').removeClass("is-active");
     $('#btn_air').addClass("is-outlined");
   });

   /* Reveals DOM for server selection */
   $(".button").one("click", function() {
     $('#header_server.hidden').removeClass("hidden").hide().fadeIn(1000);
     $('#select_server_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);
   })

    var change_count = 0
   /* Reveals DOM for database selection */
   $("#select_server").on("change", function() {
     change_count++

     $('#header_database.hidden').removeClass("hidden").hide().fadeIn(1000);
     $('#select_database_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);

     if (change_count > 1) {
       $('#select_database_wrapper').addClass("is-loading");
       $('#select_database').prop('disabled', true);
       $('#header_database').addClass('animate-flicker');
       $('#header_database').text('Loading the database...');
     };
   });
 })



