public class Favoritos 
{
    public int id_favorito { get; set; }
    public int dni_usuario { get; set; }
    
    public int id_lugar { get; set; }

    public Favoritos() { }

    public Favoritos(int idFav, int dni, int idLug)
    {
        id_favorito = idFav;
        dni_usuario = dni;
        id_lugar = idLug;
    }
}