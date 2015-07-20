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
          $("#sign_up1").fadeIn("slow");
          $("#signupbtn, #signupbtnm").fadeOut(400);
            $('#sinUpAlert').hide()

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
        var messagesArray = []
      // validation regex matches 0-5 lower or uppercase words between 1 and 11 characters
        var businessRegex = /[a-zA-Z\-0-9]{1,11}(\s[a-zA-Z\-0-9]{1,11}){0,5}/
        var emailRegex = /([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)/

        var nameInput = document.getElementsByTagName("input")[2].value
        var emailInput = document.getElementsByTagName("input")[3].value

        var validateName = nameInput.match(businessRegex)
        var validateEmail = emailInput.match(emailRegex)
        document.getElementById("new_business").removeAttribute("data-remote")
        // document.getElementById("new_business").removeAttribute("method")
      // document.getElementById("new_business").attributes[5].value = false


        if ( validateName && validateName[0] == nameInput ){


          if ( validateEmail && validateEmail[0] == emailInput ){
            $(".sign_upfields2").slideDown("slow");
            $(".sign_upfields1").hide(500);
            $('#sinUpAlert').hide()
          }

          else{
            var notice = "Email is not Valid"
            messagesArray.push(notice)
            $('#sinUpAlert').text(messagesArray)
            $('#sinUpAlert').show(100)
          }
        }

        else{
          var notice = "Busssiness name is not valid"
          messagesArray.push(notice)
          $('#sinUpAlert').text(messagesArray)
          $('#sinUpAlert').show(100)
        }


      })



        $("#nextbtn2").click(function(){
          var addressRegex = /[0-9]{1,7}.*\s(?:Street|street|St.|St|Road|Rd|Rd.)/
          var cityRegex = /[a-zA-Z]+(?:[\s-][a-zA-Z]+)*/
          var zipRegex = /((\d{5}-\d{4})|(\d{5})|([A-Z]\d[A-Z]\s\d[A-Z]\d))/

          var addressInput = document.getElementsByTagName("input")[4].value
          var cityInput = document.getElementsByTagName("input")[5].value
          var ZipInput = document.getElementsByTagName("input")[6].value

          var validateAddress = addressInput.match(addressRegex)
          var validateCity = cityInput.match(cityRegex)
          var validateZip = ZipInput.match(zipRegex)
          var messagesArray = []

          if ( validateAddress && validateAddress[0] == addressInput ){

            if(validateCity && validateCity[0] == cityInput){
              if(validateZip && validateZip[0] == ZipInput){
                $(".sign_upfields3").fadeIn("slow");
                $(".sign_upfields2").hide(500);
                $('#sinUpAlert').hide()
              }
              else{
                var notice = "Zip code is not valid"
                messagesArray.push(notice)
                $('#sinUpAlert').text(messagesArray)
                $('#sinUpAlert').show(100)
              }
            }
            else{
              var notice = "City name is not valid"
              messagesArray.push(notice)
              $('#sinUpAlert').text(messagesArray)
              $('#sinUpAlert').show(100)
            }
          }
          else{
            var notice = "Address is not valid"
            messagesArray.push(notice)
            $('#sinUpAlert').text(messagesArray)
            $('#sinUpAlert').show(100)
          }

      });


      setInterval(function(){
        
          var textInput = document.getElementsByTagName("textarea")[0].value
          var phoneInput = document.getElementsByTagName("input")[7].value
          var passwordInput = document.getElementsByTagName("input")[8].value
          var passwordConfInput = document.getElementsByTagName("input")[9].value

          var messagesArray = []

          var phoneRegex = /\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/
          var passwordRegex = /^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S$/

          var validatePhone = phoneInput.match(phoneRegex)
          var validatePassword = passwordInput.match(passwordRegex)

          if(textInput.length > 15 && textInput.length < 500){
            if(validatePhone && validatePhone[0] == phoneInput){
              if(validatePassword && validatePassword[0] == passwordInput){
                if(passwordInput == passwordConfInput){
                  console.log("some thing")
                  // document.getElementById("new_business").setAttribute("data-remote", true)
                  $('.new_business').submit()

                }
                else{
                  var notice = "Passwords do not match :("
                  messagesArray.push(notice)
                  $('#sinUpAlert').text(messagesArray)
                  $('#sinUpAlert').show(100)
                }

              }
              else{
                var notice = "Password must be at least 6 characters and have different cases"
                messagesArray.push(notice)
                $('#sinUpAlert').text(messagesArray)
                $('#sinUpAlert').show(100)
              }


            }
            else {
              var notice = "Phone Number is not valid"
              messagesArray.push(notice)
              $('#sinUpAlert').text(messagesArray)
              $('#sinUpAlert').show(100)
            }

          }
          else{
            var notice = "Description should be between 15 and 500 characters"
            messagesArray.push(notice)
            $('#sinUpAlert').text(messagesArray)
            $('#sinUpAlert').show(100)
          }
        }, 3000);






      // console.log($("#backbtn1")[0])
      $("#backbtn1").click(function(){
        $('#sinUpAlert').hide()
        $(".sign_upfields1").fadeIn("slow");
        $(".sign_upfields2").hide(500);


      });

      $("#backbtn2").click(function(){
        $('#sinUpAlert').hide()
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
  // setInterval(function(){get_rates()},3000)
  // setInterval(function()changeColor()},3000)



})
