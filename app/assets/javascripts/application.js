// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery

//= require map.js
//= require qrcode.js
//= require bootstrap-sprockets
//= require turbolinks
//= require wallets.js


/*
make two separate functions called render_pub and render_priv and put render_priv into a conditional.
*/
function walletIndexLoad() {
  function render_QR(divClass, inputClass) {
    for (var i = 0; i < $(inputClass).length; i++) {
      if ($(inputClass)[i].value.length !== 0) {
        var qrVar = new QRCode(divClass, i)
        qrVar.makeCode($(inputClass)[i].value)
      }
    }
  }
  (function loadqrpub() {
    render_QR("pub-qrcode", ".pub_ad")
    render_QR("priv-qrcode", ".priv_ad")
  })()


  var private_key = $(".private_key_wrapper")
  var button = $(".private_key_button")
  $(".private_key_button").click(function () {
    $(this).next().toggle("slow")
  })
}

$('.wallets.index').ready(walletIndexLoad)


var signup

signup = function(){
  $(document).ready(function(){
      $("#signupbtn").click(function(){
          $("#sign_up1").fadeIn("slow");

      });

      $(document).mouseup(function (e)
      {
          var container = $("#sign_up1");

          if (!container.is(e.target) // if the target of the click isn't the container...
              && container.has(e.target).length === 0) // ... nor a descendant of the container
          {
              container.hide(500);
          }
      });

      $("#nextbtn").click(function(){

        if ( $(".sign_upfields2").css('display') == 'none' && $(".sign_upfields1").css('display') !== 'none'  ){
            $(".sign_upfields2").slideDown("slow");
            $(".sign_upfields1").hide(500);
        }
      })
        $("#nextbtn2").click(function(){
        $(".sign_upfields3").fadeIn("slow");
        $(".sign_upfields2").hide(500);

      });
      // console.log($("#backbtn1")[0])
      $("#backbtn1").click(function(){
        $(".sign_upfields1").fadeIn("slow");
        $(".sign_upfields2").hide(500);

      });

      $("#backbtn2").click(function(){
        $(".sign_upfields2").fadeIn("slow");
        $(".sign_upfields3").hide(500);

    });

    $("#loginbtn").click(function(){
      $("#login").fadeIn("slow");
      $("#signupbtn").fadeOut(200);
      $(document).mouseup(function (e)
      {
          var container = $("#login");

          if (!container.is(e.target) // if the target of the click isn't the container...
              && container.has(e.target).length === 0) // ... nor a descendant of the container
          {
              container.hide(500);
                $("#signupbtn").fadeIn(400);
          }
      });
      // $(".sign_upfields2").fadeIn("slow");
      // $(".sign_upfields3").hide(500);

  });


  });

}


$('.static_pages.landing').ready(signup)
