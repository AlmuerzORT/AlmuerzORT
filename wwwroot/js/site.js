// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function VerificarContraseña(){
    let password = document.getElementById("contraseña").value;
    let Mas8 = document.getElementById("Mas8");
    let Mayusculas = document.getElementById("Mayusculas");
    let Especiales = document.getElementById("Especiales");
    let caracteresEspeciales = /[^a-zA-Z0-9]/;
    let Mas8Bool = 0;
    let MayusculasBool = 0;
    let especialesBool = 0;

    if(password.length < 8) Mas8.style.color = "red"
    else{
        Mas8.style.color = "green";
        Mas8Bool = 1;
    }
     
    if(password === password.toLowerCase()) Mayusculas.style.color = "red"
    else{
        Mayusculas.style.color = "green"
        MayusculasBool = 1;
    }
    
    if(caracteresEspeciales.test(password)){
        Especiales.style.color = "green"
        especialesBool = 1;
    }
    else Especiales.style.color = "red"
    console.log(Mas8Bool + MayusculasBool + especialesBool)

    return(Mas8Bool + MayusculasBool + especialesBool == 3)

}

function VerificarForm(){
    console.log(VerificarContraseña());
    if (VerificarContraseña())
        return true;
    else{
        let contraseñaNoValida = document.getElementById("contraseñaNoValida")
        contraseñaNoValida.innerHTML = "Es necesario completar los 3 campos para guardar la contraseña";
        return false;
    }
}

function GuardarMeGusta(id)
{
    $.ajax(
        {
            url: '/Home/GuardarMeGusta',
            type: 'POST',
            dataType: 'JSON',
            data: {id_lugar: id},
            success: function (response)
            {
                $("#MeGusta").html("Me Gusta:" + response);
                //inabiolitar boton parano dar mas de un like
            }
        }
    );
}

function ActualizarCalificacion (id, calificacion){
    const filledStar = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkgELUJ0b4w4ijfiEZeLhokUSjaa3g3Kds9g&s"
    const outlinedStar = "https://th.bing.com/th/id/R.ce494a4fe33aa36b7b3171c7a8ba7aac?rik=LqEK6sk5c9OzkQ&pid=ImgRaw&r=0"
    console.log("estoy")
    $.ajax({
        url: '/Home/ActualizarCalificacion',
        type: 'GET',
        dataType: 'JSON',
        data: {id_estrella: id, calificacion},
        success: function(response){
         const estrellas = $(".img-estrella")
         
         for (let index = 0; index < estrellas.length; index++) {
            const element = estrellas[index];
            element.src = outlinedStar
         }

         for (let index = 0; index < response; index++) {
            const element = estrellas[index];
            element.src = filledStar
            
         }
        }
    });
}

$('#recipeCarousel').carousel({
    interval: 10000
  })
  
  $('.carousel .carousel-item').each(function(){
      var minPerSlide = 3;
      var next = $(this).next();
      if (!next.length) {
      next = $(this).siblings(':first');
      }
      next.children(':first-child').clone().appendTo($(this));
      
      for (var i=0;i<minPerSlide;i++) {
          next=next.next();
          if (!next.length) {
              next = $(this).siblings(':first');
            }
          
          next.children(':first-child').clone().appendTo($(this));
        }
  });


