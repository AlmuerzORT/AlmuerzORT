public class Usuario{
    public int dni {get; set;}
    public string nombre {get; set;}
    public string apellido {get; set;}
    public string mail {get; set;}
    public string usuario {get; set;}
    public string descripcion {get; set;}
    public string contraseña {get; set;}


    public Usuario(){}

    public Usuario(string nom, string ap, string mai, string us, string con, int d, string desc){
        dni = d;
        nombre = nom;
        apellido = ap;
        mail = mai;
        usuario = us;
        contraseña = con;
        descripcion = desc;
    }

}
