using Microsoft.AspNetCore.Mvc;
using inmoWebApiLab3.Models;
using Microsoft.EntityFrameworkCore;  
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System.Text;

namespace inmoWebApiLab3.Controllers.API  // Asegúrate que el namespace coincida con el del proyecto
{

   [Route("api/[controller]")]
	[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
	[ApiController]

    
    public class PropietariosController : ControllerBase
    {
        private readonly DataContext _context;  // Utilizamos tu DataContext aquí
	    private readonly IConfiguration config;
		private readonly IWebHostEnvironment environment;

        public PropietariosController(DataContext context, IConfiguration config, IWebHostEnvironment environment)
        {
            this._context = context;
            this.config = config;
            this.environment = environment;

        }

        // Método para obtener todos los propietarios
        
        
      
        [HttpGet]
        public async Task<IActionResult> GetPropietarios()  // Se usa async porque es una consulta a una base de datos asíncronamente
        {
            var propietarios =await _context.Propietario.ToListAsync();  // Recupera todos los propietarios de la base de datos
           
            return Ok(propietarios);  // Devuelve los propietarios en formato JSON
        }

        //Método para obtener un propietario por su ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPropietario(int id)
        {
            var propietario =await _context.Propietario.FirstOrDefaultAsync(p => p.Id_Propietario == id);  // Busca un propietario por ID

            if (propietario == null)
            {
                return NotFound();  // Si no se encuentra, devuelve un error 404
            }

            return Ok(propietario);  // Devuelve el propietario en formato JSON
        }    
    

   // Método para crear un nuevo propietario
        [HttpPost]
        public async Task<IActionResult>PostPropietario([FromBody] Propietario propietario)
        {
            if (ModelState.IsValid) 
            {
                _context.Propietario.Add(propietario);  // Añade el nuevo Propietario a la base de datos
               await _context.SaveChangesAsync();  // Guarda los cambios en la base de datos
                return CreatedAtAction(nameof(GetPropietario), new { id = propietario.Id_Propietario }, propietario);  // Devuelve el Propietario creado con un código 201
            }

            return BadRequest(ModelState);  // Devuelve un error si el modelo es inválido
        }
[HttpPut("{id}")]
public async Task<IActionResult> UpdatePropietario(int id, Propietario propietario)
{
    // Verificar que el ID proporcionado coincide con el del modelo
    if (id != propietario.Id_Propietario)
    {
        return BadRequest("El ID proporcionado no coincide con el ID del Propietario.");  // Devuelve un error 400 si los IDs no coinciden
    }

    // Verificar si el propietario existe en la base de datos
    var existingPropietario = await _context.Propietario.FindAsync(id);
    if (existingPropietario == null)
    {
        return NotFound("El Propietario con el ID especificado no existe.");  // Devuelve un error 404 si no existe
    }

    // Actualizar las propiedades del propietario existente
    existingPropietario.Nombre = propietario.Nombre;  // Asigna los valores que quieres actualizar
    existingPropietario.Apellido = propietario.Apellido;// Asegúrate de incluir todas las propiedades necesarias
    existingPropietario.Direccion = propietario.Direccion;
    existingPropietario.Telefono = propietario.Telefono;
    existingPropietario.Email = propietario.Email;
    existingPropietario.Dni = propietario.Dni;
    existingPropietario.Estado_Propietario = propietario.Estado_Propietario;
    
     

    if (ModelState.IsValid)
    {
        try
        {
            await _context.SaveChangesAsync();  // Guarda los cambios
            return NoContent();  // Éxito, devuelve 204
        }
        catch (Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException)
        {
            // Verificar si el propietario sigue existiendo
            if (!_context.Propietario.Any(e => e.Id_Propietario == id))
            {
                return NotFound("El Propietario con el ID especificado ya no existe.");
            }
            else
            {
                throw;  // Si ocurre algún otro error, lanzarlo
            }
        }
    }

    return BadRequest(ModelState);  // Devuelve un error si el modelo es inválido
}





        // Método para eliminar un Propietario
        [HttpDelete("{id}")]
        public async Task <IActionResult> DeletePropietario(int id)
        {
            var propietario =await _context.Propietario.FindAsync(id);  // Busca el Propietario por ID

            if (propietario == null)
            {
                return NotFound();  // Si no se encuentra, devuelve un error 404
            }

                 _context.Propietario.Remove(propietario);  // Elimina el Propietario de la base de datos
           await _context.SaveChangesAsync();  // Guarda los cambios en la base de datos
            return NoContent();  // Devuelve un código 204 para indicar éxito
        }

[HttpPost("login")]
[AllowAnonymous]
public async Task<IActionResult> Login([FromBody] LoginView loginView)
{
    try
    {
        // Verifica si el modelo es válido
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        // Hash de la contraseña ingresada
        string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
            password: loginView.Clave,
            salt: System.Text.Encoding.ASCII.GetBytes(config["Salt"]),
            prf: KeyDerivationPrf.HMACSHA1,
            iterationCount: 1000,
            numBytesRequested: 256 / 8));

        // Busca al propietario en la base de datos
        var propietario = await _context.Propietario.FirstOrDefaultAsync(x => x.Email == loginView.Usuario);
        if (propietario == null || propietario.Clave != hashed)
        {
            return BadRequest("Nombre de usuario o clave incorrecta");
        }

        // Genera el token JWT
        var key = new SymmetricSecurityKey(System.Text.Encoding.ASCII.GetBytes(config["TokenAuthentication:SecretKey"]));
        var credenciales = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, propietario.Email),
            new Claim("FullName", propietario.Nombre + " " + propietario.Apellido),
            new Claim(ClaimTypes.Role, "Propietario"),
        };

        var token = new JwtSecurityToken(
            issuer: config["TokenAuthentication:Issuer"],
            audience: config["TokenAuthentication:Audience"],
            claims: claims,
            expires: DateTime.Now.AddMinutes(60),
            signingCredentials: credenciales
        );

        // Registra el token generado
        var tokenString = new JwtSecurityTokenHandler().WriteToken(token);
        Console.WriteLine("Token generado: " + tokenString); // Agrega esta línea para depurar

        return Ok(new { Token = tokenString });
    }
    catch (Exception ex)
    {
        return BadRequest(ex.Message);
    }
}


    }
    
}



