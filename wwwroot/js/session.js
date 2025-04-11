// wwwroot/js/session.js

function guardarUsuarioSesion(usuario) {
    localStorage.setItem("usuarioLogueado", JSON.stringify(usuario));
}

function obtenerUsuarioSesion() {
    const usuario = localStorage.getItem("usuarioLogueado");
    return usuario ? JSON.parse(usuario) : null;
}

function cerrarSesion() {
    localStorage.removeItem("usuarioLogueado");
    window.location.href = "/Account/IniciarSesion";
}

function chequearSesionActiva() {
    const usuario = obtenerUsuarioSesion();
    const ruta = window.location.pathname.toLowerCase();

    const rutasPrivadas = [
        "/home/index",
        "/home/establecimiento",
        "/home/favoritos",
        "/home/todosestablecimientos",
        "/home/lugaresrestriccion",
        "/home/resultadobusqueda"
    ];

    const requiereLogin = rutasPrivadas.some(r => ruta.startsWith(r));

    if (requiereLogin && !usuario) {
        window.location.href = "/Account/IniciarSesion";
    }
}


document.addEventListener("DOMContentLoaded", chequearSesionActiva);
