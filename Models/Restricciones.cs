public class Restricciones{
    public int id_restriccion {get; set;}
    public string nombre{get; set;}
    public string foto{get; set;}

  public Restricciones(){} 

    public Restricciones(string nom, string fot){
        nombre =  nom;
        foto = fot;
    }
 
}