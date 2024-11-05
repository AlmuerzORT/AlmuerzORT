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
        return View();
    }

    public IActionResult VerEstablecimiento(int idEstablecimiento)
    {
        ViewBag.Lugar = BD.ObtenerLugar(idEstablecimiento);
        return View("Establecimiento");
    }

    public IActionResult VerLugaresXRestriccion(int idRestriccion){
        ViewBag.Restriccionn = BD.ObtenerRestriccion(idRestriccion); //HACER FUNCION EN BD
        return View("LugaresRestriccion");
    }
}
