
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace inmoWebApiLab3.Models;
public class LoginView
{
    public string? Usuario { get; set; }
    public string? Clave { get; set; }
}