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
//= require map.js
//= require qrcode.js
//= require bootstrap-sprockets
//= require turbolinks
//= require wallets.js



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

    $(this).parent().parent().next(".private_key_wrapper").toggle("fast")
    console.log($(this).parent().parent().next(".private_key_wrapper"));
    // $(this).parent().parent().next(".private_key_wrapper").toggleClass("private_key_hide private_key_show")
    $(this).parent().parent().next(".private_key_wrapper").removeClass("hide")

  })
}

$('.wallets.index').ready(walletIndexLoad)



var signup

signup = function(){
  $(document).ready(function(){

      $("#signupbtn, #signupbtnm").click(function(){
        // alert()
          $("#sign_up1").fadeIn("slow");
          $("#signupbtn, #signupbtnm").fadeOut(400);

      });

      $(document).mouseup(function (e)
      {
          var container = $("#sign_up1");

          if (!container.is(e.target) // if the target of the click isn't the container...
              && container.has(e.target).length === 0) // ... nor a descendant of the container
          {
              container.hide(500);
              $("#signupbtn").fadeIn(400);
              $("#signupbtnm").fadeIn(400);
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

      $("#signupbtn, #signupbtnm").fadeOut(400);
      $(document).mouseup(function (e)
      {
          var container = $("#login");

          if (!container.is(e.target)
              && container.has(e.target).length === 0)
          {
              container.hide(500);
                $("#signupbtn").fadeIn(400);
                $("#signupbtnm").fadeIn(400);
                $(".sign_upfields1").hide(0);
          }
      });
      $(".sign_upfields2").fadeIn("slow");
      $(".sign_upfields3").hide(500);

  });


  });

}


$('.static_pages.landing').ready(signup)

function get_rates(){

  console.log("get rates running")
  $.ajax({
          type: "GET",
          dataType: "json",
          url: "/rates",
          success: function(data){
          var rates = data[0]
          document.getElementsByClassName("item rate")[0].innerHTML = rates.average_rate + "<br>  Average"
          document.getElementsByClassName("item rate")[1].innerHTML = rates.coinbase_rate + "<br> Coinbase"
          document.getElementsByClassName("item rate")[2].innerHTML = rates.okcoin_rate + "<br> Ok Coin"
          document.getElementsByClassName("item rate")[3].innerHTML = rates.bitfinex_rate + "<br> Bitfinex"
          // var hue = 'rgb(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ')';
          // jQuery('.rate')[0].fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100);

        //   var colors = ["green", "blue"]
         //
        //   function changeColor(){
        //     var colorIndex = 0
        //     colorIndex += 1
        //     document.getElementsByClassName("item rate")[0].style.color = colors[colorIndex]
        //     document.getElementsByClassName("item rate")[1].style.color = colors[colorIndex]
        //     document.getElementsByClassName("item rate")[2].style.color = colors[colorIndex]
        //     document.getElementsByClassName("item rate")[3].style.color = colors[colorIndex]
        //     console.log(colorIndex)
        //     colorIndex = 0
        //  }
         //
        //  changeColor()


          }
      });
}


$(document).ready(function(){
  setInterval(function(){get_rates()},3000)
  // setInterval(function()changeColor()},3000)



})
