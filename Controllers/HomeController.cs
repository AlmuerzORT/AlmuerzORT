using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using AlmuerzORT.Models;

namespace AlmuerzORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        
        ViewBag.listaEstablecimientos = BD.ObtenerLugares();
        ViewBag.listaRestricciones = BD.ObtenerRestricciones();
        ViewBag.listaMejoresCalificados = BD.ObtenerMejoresCalificados();
        return View();
    }

    public IActionResult VerEstablecimiento(int idEstablecimiento)
{
    var userStr = HttpContext.Session.GetString("user");
    if (userStr != null)
    {
        ViewBag.User = Usuario.FromString(userStr);
    }
    else
    {
        ViewBag.User = null; // Lo seteás para evitar errores
    }

    ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
    ViewBag.Menu = BD.ObtenerMenuPorLugar(idEstablecimiento);
    return View("Establecimiento");
}


    public IActionResult VerLugaresXRestriccion(int idRestriccion){
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }

        Restricciones Restriccionn = BD.ObtenerRestriccion(idRestriccion);
        ViewBag.Restri = Restriccionn;
        ViewBag.ListaLugaresRestriccion = BD.ObtenerLugaresRestriccion(Restriccionn);   
        return View("LugaresRestriccion");
    }

    public IActionResult lugaresMejoresCalifiados(int idEstablecimiento){
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
        return View("Establecimiento");
    }
 
    [HttpPost]
    public IActionResult GuardarFavorito(int id_lugar)
    {
        int dni_usuario = HttpContext.Session.GetInt32("DNI").GetValueOrDefault();

        if (dni_usuario == 0)
        {
            return RedirectToAction("Registrarse", "Account");
        }
        BD.GuardarFavorito(dni_usuario, id_lugar);
        return Json(new { success = true });
    }


    public int ActualizarCalificacion(int id_estrella, int calificacion){
        
        return BD.actualizarCalificacion(id_estrella, calificacion);
     }

    public IActionResult Busqueda(string busqueda){
        
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        
        ViewBag.Resultado = BD.Busqueda(busqueda);

        if(ViewBag.Resultado == null){
            ViewBag.NoHayResultado = busqueda + " no fue encontrado";
        }
        ViewBag.Busqueda = busqueda;
        return View("ResultadoBusqueda");
    }

    public IActionResult TodosEstablecimientos(){
        
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        
        ViewBag.listaEstablecimientos = BD.ObtenerLugares();
        return View ();
    }
    [HttpGet] //REVISAR ESTE GET PARA VER PORQUE NO ANDA LA SESION EN FAVORITOS
    public IActionResult Favoritos()
    {
         if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        return View();
    }

    public IActionResult Perfil()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            Usuario user = Usuario.FromString(HttpContext.Session.GetString("user"));
            ViewBag.User = user;
            ViewBag.MisReseñas = BD.ObtenerReseñasPorUsuario(user.dni);
        }
        return View();
    }


    [HttpPost]
    public IActionResult GuardarReseña(string reseña, int id_lugar, int userdni)
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }

        ViewBag.Lugar = BD.ObtenerLugar(id_lugar);
        ViewBag.Menu = BD.ObtenerMenuPorLugar(id_lugar); 

        BD.GuardarReseña(reseña, id_lugar, userdni);
        ViewBag.mensajeReseñaExitosa = "Reseña enviada con éxito 😎";

        return View("Establecimiento");
    }


}


    

    
