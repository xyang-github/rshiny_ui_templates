 $(document).ready(function(){

   var btn_model_click = 0;
   /* Change formatting of model vendor buttons */
  $("#btn_air").on("click", function() {
     btn_model_click++;

     /* Change class of AIR button */
     $(this).removeClass("is-outlined");
     $(this).addClass("is-active");

     /* Change class of RMS button */
     $('#btn_rms').removeClass("is-active");
     $('#btn_rms').addClass("is-outlined");

      /* Change the step formatting; tracks number of clicks to make sure this
      only happens once*/
      if (btn_model_click == 1) {
         $('#step-model').removeClass("is-active is-dashed");
         $('#marker-model.is-hollow').removeClass("is-hollow").append("<span class='icon'><i class='fa fa-check'></i></span>");
         $('#step-server').addClass("is-active");
         $('#marker-server').addClass("is-hollow is-info");
      }
   });

  $("#btn_rms").on("click", function() {
      btn_model_click++;

     /* Change class of AIR button */
     $(this).removeClass("is-outlined");
     $(this).addClass("is-active");

     /* Change class of RMS button */
     $('#btn_air').removeClass("is-active");
     $('#btn_air').addClass("is-outlined");

      /* Change the step formatting; tracks number of clicks to make sure this
      only happens once*/
      if (btn_model_click == 1) {
         $('#step-model').removeClass("is-active is-dashed");
         $('#marker-model.is-hollow').removeClass("is-hollow").append("<span class='icon'><i class='fa fa-check'></i></span>");
         $('#step-server').addClass("is-active");
         $('#marker-server').addClass("is-hollow is-info");
      }
   });

   /* Reveals DOM for server selection */
   $(".button").one("click", function() {
     $('#header_server.hidden').removeClass("hidden").hide().fadeIn(1000);
     $('#select_server_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);
   })

   /* Reveals DOM for database selection */
   $("#select_server").on("change", function() {

     $('#header_database.hidden').removeClass("hidden").hide().fadeIn(1000);
     $('#select_database_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);

      var server = $('#select_server option:selected').text();
      if (server !== "") {
         $('#select_database').prop('disabled', true);
         $('#header_database').addClass('animate-flicker');
         $('#header_database').text('Loading the database...');

      /* Change the step formatting */
         $('#step-server').removeClass("is-active is-dashed");
         $('#marker-server.is-hollow').removeClass("is-hollow").append("<span class='icon'><i class='fa fa-check'></i></span>");
         $('#step-database').addClass("is-active");
         $('#marker-database').addClass("is-hollow is-info");
     };
   });

   $('#btn_submit').on('click', function() {
     $(this).addClass("is-loading")
   });

   $('#select_database').on("change", function() {
      var database = $('#select_database option:selected').text();
      if (database !== "") {
         $('#header_portfolio.hidden').removeClass("hidden").hide().fadeIn(1000);
         $('#select_portfolio_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);
      }
   });

   $('#select_portfolio').on("change", function() {
      $('#header_peril.hidden').removeClass("hidden").hide().fadeIn(1000);
      $('#select_peril_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);
   });

   $('#select_peril').on("change", function() {
      $('#header_bob.hidden').removeClass("hidden").hide().fadeIn(1000);
      $('#select_bob_wrapper.hidden').removeClass("hidden").hide().fadeIn(1000);
   });

 })



