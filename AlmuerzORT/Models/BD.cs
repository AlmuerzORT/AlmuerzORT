using System.Data.SqlClient;
using Dapper;

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
}
