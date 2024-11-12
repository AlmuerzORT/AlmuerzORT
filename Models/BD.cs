using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

static class BD{
    private static string _ConnectionString = @"Server=localhost; DataBase=AlmuerzORT; Trusted_Connection=True";
    
    public static bool UsuarioValido(int dni){
        string SQL = "SELECT * FROM Usuario WHERE dni = @pdni";
        Usuario usuarioBase = null;
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            usuarioBase = db.QueryFirstOrDefault<Usuario>(SQL,new{pdni = dni});
        }

        return usuarioBase == null;
    }
    public static void GuardarRegistro(Usuario user){
        string SQL = "INSERT INTO Usuario(nombre, apellido, mail, usuario, contraseña, dni, descripcion) VALUES(@pnombre, @papellido, @pmail, @pusuario, @pcontraseña, @pdni, @pdescripcion)";
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            db.Execute(SQL,new{pnombre = user.nombre, papellido = user.apellido, pmail=user.mail, pusuario=user.usuario, pcontraseña = user.contraseña, pdni = user.dni, pdescripcion=user.descripcion});
        }
    }

    public static bool UsuarioRegistrado(int dni, string contraseña){
        string SQL = "SELECT * FROM Usuario WHERE dni = @pdni AND contraseña = @pcontraseña";
         Usuario usuarioBase = null;
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            usuarioBase = db.QueryFirstOrDefault<Usuario>(SQL,new{pdni = dni, pcontraseña = contraseña});
        }
        return usuarioBase == null;
    }

    public static bool DatosValidos(int dni, string mail){
         string SQL = "SELECT * FROM Usuario WHERE dni = @pdni AND mail = @pmail";
         Usuario usuarioBase = null;
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            usuarioBase = db.QueryFirstOrDefault<Usuario>(SQL,new{pdni = dni, pmail = mail});
        }
        return usuarioBase == null;
    }

    public static bool ContraNuevaValida(string contraseñaNueva){
        string SQL = "SELECT * FROM Usuario WHERE @pcontraseña = contraseña";
        Usuario usuarioBase = null;
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            usuarioBase = db.QueryFirstOrDefault<Usuario>(SQL,new{pcontraseña = contraseñaNueva});
        }
        return usuarioBase == null;
    }

    public static void ActualizarContraseña(string contraseñaNueva, int dni){
        string SQL = "UPDATE Usuario SET contraseña = @pcontraseña WHERE dni = @pdni";
        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            db.Execute(SQL,new{pcontraseña = contraseñaNueva, pdni = dni});
        }
        
    }

    public static List<Establecimiento> ObtenerLugares(){
        string SQL = "SELECT * FROM Establecimientos";
        List <Establecimiento> listaLugares = new List<Establecimiento>();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            listaLugares = db.Query<Establecimiento>(SQL).ToList();
        }

        return listaLugares;
    }

    public static Establecimiento ObtenerLugar(int idEstablecimiento){
        string SQL = "SELECT * FROM Establecimientos WHERE id_lugar = @pidEstablecimiento";
        Establecimiento lugar = new Establecimiento();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            lugar = db.QueryFirstOrDefault<Establecimiento>(SQL, new{@pidEstablecimiento = idEstablecimiento});
        }

        return lugar;
    }

    public static List<Restricciones> ObtenerRestricciones(){
        string SQL = "SELECT * FROM Restricciones";
        List <Restricciones> listaRestriccion = new List<Restricciones>();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            listaRestriccion = db.Query<Restricciones>(SQL).ToList();
        }

        return listaRestriccion;
    }
    
    public static Restricciones ObtenerRestriccion(int idRestriccion){
        string SQL = "SELECT * FROM Restricciones WHERE id_restriccion = @pIdRestriccion";
        Restricciones restriccion = new Restricciones();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            restriccion = db.QueryFirstOrDefault<Restricciones>(SQL, new{@pIdRestriccion = idRestriccion});
        }

        return restriccion;
    }

    public static List<Establecimiento> ObtenerLugaresRestriccion(Restricciones restric){
        string SQL = "SELECT Establecimientos.nombre, Establecimientos.direccion, Establecimientos.id_lugar, Establecimientos.telefono, Establecimientos.calificacion, Establecimientos.horarios FROM Establecimientos INNER JOIN PlatoxLugar ON PlatoxLugar.id_lugar = Establecimientos.id_lugar INNER JOIN ComidaxMenu ON ComidaxMenu.id_plato = PlatoxLugar.id_plato INNER JOIN Restricciones ON Restricciones.id_restriccion = ComidaxMenu.id_restriccion WHERE Restricciones.id_restriccion = @pid_restriccion";
        List <Establecimiento> listaLugares = new List<Establecimiento>();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            listaLugares = db.Query<Establecimiento>(SQL, new{@pid_restriccion = restric.id_restriccion}).ToList();
        }

        return listaLugares;

    }

    public static List<Establecimiento> ObtenerMejoresCalificados(){
        string SQL = "SELECT TOP 5 * FROM Establecimientos WHERE calificacion > 3";
        List <Establecimiento> listaLugares = new List<Establecimiento>();

        using(SqlConnection db=new SqlConnection(_ConnectionString)){
            listaLugares = db.Query<Establecimiento>(SQL).ToList();
        }

        return listaLugares;
    }

}
