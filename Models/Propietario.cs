using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace inmoWebApiLab3.Models;

public partial class Propietario
{
    [Key]  // Esto marca IdContrato como la clave primaria
    public int Id_Propietario { get; set; }

    public int? Dni { get; set; }

    public string? Apellido { get; set; }

    public string? Nombre { get; set; }

    public string? Direccion { get; set; }

    public string? Telefono { get; set; }

    public string? Email { get; set; }

    public int? Estado_Propietario { get; set; }

    public string? Clave { get; set; }


}
