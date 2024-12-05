public class ComidaxMenu
{
    public int id_plato { get; set; }
    public string nombre_plato { get; set; }
    public string descripcion { get; set; }
    public float precio { get; set; }
    public int id_restriccion { get; set; }

    public ComidaxMenu() { }

    public ComidaxMenu(int idPlato, string nombrePlato, string desc, float prec, int idRestriccion)
    {
        id_plato = idPlato;
        nombre_plato = nombrePlato;
        descripcion = desc;
        precio = prec;
        id_restriccion = idRestriccion;
    }
}

