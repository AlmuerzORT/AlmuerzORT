public class Establecimiento{
    public int id_lugar{get; set;}
    public string nombre {get; set;}
    public string direccion {get; set;}
    public string telefono {get; set;}
    public int calificacion {get; set;}
    public string horarios {get; set;}

    public Establecimiento(){}

    public Establecimiento(string nom, string dire, string telef, int cali, string horar){
        nombre = nom;
        direccion = dire;
        telefono = telef;
        calificacion = cali;
        horarios = horar;
    }


}