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
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
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
    public int GuardarMeGusta(int id_lugar)
    {
        int MG = BD.GuardarMeGusta(id_lugar);
        return MG;
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
        return View();
    }

    public IActionResult TodosEstablecimientos(){
        
        if (HttpContext.Session.GetString("user")!=null)
        {
            ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        }
        
        ViewBag.listaEstablecimientos = BD.ObtenerLugares();
        return View ();
    }

    
}
    
