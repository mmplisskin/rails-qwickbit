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
//= require materialize-sprockets
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

  $("#name").focus(function() {

    }).blur(function() {
      // validation length between 1 and 30 characters
        var len = {min:1,max:30};
        var nameInput = document.getElementsByTagName("input")[2].value.length

        if ( nameInput >= len.min && nameInput <=len.max ){
          console.log("valid")
        }
        else{
          $("#name").select()
          console.log("name invalid")
          Materialize.toast('Busssiness name is not valid', 4000)
        }
    });

    $("#email").focus(function() {

      }).blur(function() {
        // validation length between 1 and 30 characters
          var emailInput = document.getElementsByTagName("input")[3].value
          var emailRegex = /([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)/
          var validateEmail = emailInput.match(emailRegex)

          if ( validateEmail && validateEmail[0] == emailInput){
            console.log("valid")
          }
          else{
            $("#email").select()
            Materialize.toast('Please use a valid email :)', 4000)
          }
      });

      $("#address").focus(function() {

        }).blur(function() {

            var addressInput = document.getElementsByTagName("input")[4].value
            var addressRegex = /[0-9]{1,7}.*\s(?:Street|street|St.|St|Road|Rd|Pl|AVE|st|ct|Rd.)/
            var validateAddress = addressInput.match(addressRegex)

            if ( validateAddress && validateAddress[0] == addressInput ){
              console.log("valid")
            }
            else{
              $("#address").select()
              Materialize.toast('Invalid Address', 4000)
            }
        });

        $("#city").focus(function() {

          }).blur(function() {
            // validation length between 1 and 30 characters
              var cityInput = document.getElementsByTagName("input")[5].value
              var cityRegex = /[a-zA-Z]+(?:[\s-][a-zA-Z]+)*/
              var validateCity = cityInput.match(cityRegex)

              if (validateCity && validateCity[0] == cityInput){
                console.log("valid")
              }
              else{
                Materialize.toast('Invalid City', 4000)
                $("#city").select()
              }
          });

          $("#zip").focus(function() {

            }).blur(function() {
              // validation length between 1 and 30 characters
                var ZipInput = document.getElementsByTagName("input")[6].value
                var zipRegex = /((\d{5}-\d{4})|(\d{5})|([A-Z]\d[A-Z]\s\d[A-Z]\d))/
                var validateZip = ZipInput.match(zipRegex)

                if (validateZip && validateZip[0] == ZipInput){
                  console.log("valid")
                }
                else{
                  Materialize.toast('Invalid Zipcode', 4000)
                  $("#zip").select()
                }
            });


            $("#description").focus(function() {

              }).blur(function() {
                // validation length between 1 and 30 characters
                  var textInput = document.getElementsByTagName("textarea")[0].value

                 if(textInput.length > 15 && textInput.length < 500){

                    console.log("valid")
                  }
                  else{
                    $("#description").select()
                    Materialize.toast('Please enter a description (between 15 and 500 characters)', 4000)
                  }
              });


              $("#phone").focus(function() {

                }).blur(function() {
                  // validation length between 1 and 30 characters
                  var phoneInput = document.getElementsByTagName("input")[7].value
                  var phoneRegex = /\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/
                  var validatePhone = phoneInput.match(phoneRegex)

                   if(validatePhone && validatePhone[0] == phoneInput){

                      console.log("valid")
                    }
                    else{
                      $("#phone").select()
                      Materialize.toast('Phone number is not valid', 4000)
                    }
                });


                $("#password").focus(function() {

                  }).blur(function() {
                    var passwordInput = document.getElementsByTagName("input")[8].value
                    var passwordRegex = /^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S$/
                    var validatePassword = passwordInput.match(passwordRegex)

                     if(validatePassword && validatePassword[0] == passwordInput){
                        console.log("valid")
                      }
                      else{
                        $("#password").select()
                        Materialize.toast('Password must be at least 6 characters and have different cases', 4000)
                      }
                  });

                  $("#passwordconf").focus(function() {


                      var passwordInput = document.getElementsByTagName("input")[8].value
                      var passwordConfInput = document.getElementsByTagName("input")[9].value

                       if(passwordInput == passwordConfInput){
                          console.log("valid")
                        }
                        else{
                          Materialize.toast('Password confirmation must match', 4000)
                        }
                    });

  });
}


$('.static_pages.landing').ready(signup)


//   index = 0
// function get_rates(){
//
//   console.log("get rates running")
//   $.ajax({
//           type: "GET",
//           dataType: "json",
//           url: "/rates",
//           success: function(data){
//           var rates = data[0]
//           var colors = ["#61B329", "#A6D785"]
//
//
//
//           document.getElementsByClassName("item rate")[0].innerHTML = rates.average_rate + "<br>  Average"
//           document.getElementsByClassName("item rate")[1].innerHTML = rates.coinbase_rate + "<br> Coinbase"
//           document.getElementsByClassName("item rate")[2].innerHTML = rates.okcoin_rate + "<br> Ok Coin"
//           document.getElementsByClassName("item rate")[3].innerHTML = rates.bitfinex_rate + "<br> Bitfinex"
//
//           document.getElementsByClassName("item rate")[0].style.color = colors[index]
//           document.getElementsByClassName("item rate")[1].style.color = colors[index]
//           document.getElementsByClassName("item rate")[2].style.color = colors[index]
//           document.getElementsByClassName("item rate")[3].style.color = colors[index]
//
//           if (index == 0){
//             index += 1
//           }
//           else{ index = 0
//           }
//
//           }
//       });
//
// }




$(document).ready(function(){
  // setInterval(function(){get_rates()},3000)
  $(".button-collapse").sideNav();
  $('.modal-trigger').leanModal();


})
