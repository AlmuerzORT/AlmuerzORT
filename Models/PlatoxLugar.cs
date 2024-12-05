public class PlatoxLugar 
{
    public int id_lugar { get; set; }
    public int id_plato { get; set; }

    public PlatoxLugar() { }

    public PlatoxLugar(int idLugar, int idPlato)
    {
        id_lugar = idLugar;
        id_plato = idPlato;
    }
}