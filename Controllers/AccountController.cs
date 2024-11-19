using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using AlmuerzORT.Models;

namespace AlmuerzORT.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult IniciarSesion(){
        return View();
    }
    public IActionResult CerrarSesion(){
        HttpContext.Session.Remove("user");
        return RedirectToAction("Index", "Home");
    }

    public IActionResult Registrarse(){
        return View();
    }

    [HttpPost]
    public IActionResult GuardarRegistro(Usuario user){ 
        if(BD.UsuarioValido(user.dni)) {
            BD.GuardarRegistro(user);
            ViewBag.user = user;
            return View("PostLogin");
        }
        else{
            ViewBag.mensajeError = "ERROR! El usuario ya existe";
            return View("Registrarse");
        }
        
    }
    
    [HttpPost]
    public IActionResult VerificarInicioSesion(int dni, string contraseña){
        
        if(BD.UsuarioValido(dni)){
            ViewBag.mensajeError = "ERROR! El usuario no existe. ¿Desea registrarse?";
            return View ("IniciarSesion");
        }
        else{
            Usuario userlogin = BD.UsuarioRegistrado(dni, contraseña);
            if(userlogin == null){
            ViewBag.mensajeError = "ERROR! Contraseña Incorrecta";
            return View("IniciarSesion");
            }
            else {

                // Aca vamos a guardar el usuario en sesion
                HttpContext.Session.SetString("user", userlogin.ToString());

                return RedirectToAction("Index", "Home");
            }
        }
    }

    public IActionResult Olvide(){
        return View();
    }

    public IActionResult OlvideContraseña(int dni, string mail){
        if(BD.UsuarioValido(dni)){
           ViewBag.mensajeError = "ERROR! El usuario es incorrecto!";
           return View ("Olvide");
        }
        else{
            if(BD.DatosValidos(dni, mail)){
                ViewBag.mensajeError = "ERROR! el mail es incorrecto!";
                return View ("Olvide");
            }
            else{
                ViewBag.RecupereContra = "Ingrese su nueva contraseña";
                ViewBag.dni = dni;
                return View ("Olvide");

            }
        }
        
    }

    [HttpPost]
    public IActionResult VerificarNuevaContraseña(string contraseña, int dni){
        if(BD.ContraNuevaValida(contraseña)){
            BD.ActualizarContraseña(contraseña, dni);
            ViewBag.ContraActualizada = "Tu contraseña se actualizó correctamente";
            return View ("Olvide");
        }
        else{
            ViewBag.ContraNoActualizada = "Tu nueva contraseña no puede ser igual a la anterior";
            return View ("Olvide");
        }
    }
}