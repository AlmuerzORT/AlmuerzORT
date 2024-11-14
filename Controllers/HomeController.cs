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
        ViewBag.listaEstablecimientos = BD.ObtenerLugares();
        ViewBag.listaRestricciones = BD.ObtenerRestricciones();
        ViewBag.listaMejoresCalificados = BD.ObtenerMejoresCalificados();
        return View();
    }

    public IActionResult VerEstablecimiento(int idEstablecimiento)
    {
        ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
        return View("Establecimiento");
    }

    public IActionResult VerLugaresXRestriccion(int idRestriccion){
        Restricciones Restriccionn = BD.ObtenerRestriccion(idRestriccion);
        ViewBag.Restri = Restriccionn;
        ViewBag.ListaLugaresRestriccion = BD.ObtenerLugaresRestriccion(Restriccionn);   
        return View("LugaresRestriccion");
    }

    public IActionResult lugaresMejoresCalifiados(int idEstablecimiento){
        ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
        return View("Establecimiento");
    }
    [HttpPost]
    public int GuardarMeGusta(int id_lugar)
    {
        int MG = BD.GuardarMeGusta(id_lugar);
        return MG;
    }

    public bool ActualizarCalificacion(int id_estrella, int calificacion){
        return BD.actualizarCalificacion(id_estrella, calificacion);
    }
}
