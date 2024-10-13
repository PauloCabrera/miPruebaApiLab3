using System.ComponentModel.DataAnnotations;

namespace inmoWebApiLab3.Models;

public class Inquilino
{
    [Key]  // Esto marca IdContrato como la clave primaria
    public int Id_Inquilino { get; set; }

    [Required(ErrorMessage = "El Dni es obligatorio.")]
    [Range(11111111, 99999999, ErrorMessage = "El Dni debe estar entre 11111111 y 99999999.")]
    public int Dni { get; set; }

    [Required(ErrorMessage = "El Apellido es obligatorio.")]
    public string? Apellido { get; set; }
    [Required(ErrorMessage = "El Nombre es obligatorio.")]
    public string? Nombre { get; set; }
    [Required(ErrorMessage = "El Telefono es obligatorio.")]

    public string? Telefono { get; set; }

    [Required(ErrorMessage = "El Email es obligatorio.")]
    public string? Email { get; set; }

    public int Estado_Inquilino { get; set; }

}