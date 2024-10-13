using Microsoft.AspNetCore.Mvc;
using inmoWebApiLab3.Models; // Asegúrate de que el modelo Inquilino esté en este namespace
using Microsoft.EntityFrameworkCore;  
using System.Linq;

namespace inmoWebApiLab3.Controllers.API  // Asegúrate que el namespace coincida con el del proyecto
{
    [ApiController]
    [Route("api/[controller]")]
    public class InquilinosController : ControllerBase
    {
        private readonly DataContext _context;  // Utilizamos tu DataContext aquí
        private readonly IConfiguration config;
        private readonly IWebHostEnvironment environment;

        public InquilinosController(DataContext context, IConfiguration config, IWebHostEnvironment environment)
        {
            this._context = context;
            this.config = config;
            this.environment = environment;
        }

        // Método para obtener todos los inquilinos
        [HttpGet]
        public async Task<IActionResult> GetInquilinos()  // Se usa async porque es una consulta a una base de datos asíncronamente
        {
            var inquilinos = await _context.Inquilino.ToListAsync();  // Recupera todos los inquilinos de la base de datos
            return Ok(inquilinos);  // Devuelve los inquilinos en formato JSON
        }

        // Método para obtener un inquilino por su ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetInquilino(int id)
        {
            var inquilino = await _context.Inquilino.FirstOrDefaultAsync(i => i.Id_Inquilino == id);  // Busca un inquilino por ID

            if (inquilino == null)
            {
                return NotFound();  // Si no se encuentra, devuelve un error 404
            }

            return Ok(inquilino);  // Devuelve el inquilino en formato JSON
        }

        // Método para crear un nuevo inquilino
        [HttpPost]
        public async Task<IActionResult> PostInquilino([FromBody] Inquilino inquilino)
        {
            if (ModelState.IsValid) 
            {
                _context.Inquilino.Add(inquilino);  // Añade el nuevo Inquilino a la base de datos
                await _context.SaveChangesAsync();  // Guarda los cambios en la base de datos
                return CreatedAtAction(nameof(GetInquilino), new { id = inquilino.Id_Inquilino }, inquilino);  // Devuelve el Inquilino creado con un código 201
            }

            return BadRequest(ModelState);  // Devuelve un error si el modelo es inválido
        }

        // Método para actualizar un inquilino existente
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateInquilino(int id, Inquilino inquilino)
        {
            // Verificar que el ID proporcionado coincide con el del modelo
            if (id != inquilino.Id_Inquilino)
            {
                return BadRequest("El ID proporcionado no coincide con el ID del Inquilino.");  // Devuelve un error 400 si los IDs no coinciden
            }

            // Verificar si el inquilino existe en la base de datos
            var existingInquilino = await _context.Inquilino.FindAsync(id);
            if (existingInquilino == null)
            {
                return NotFound("El Inquilino con el ID especificado no existe.");  // Devuelve un error 404 si no existe
            }

            // Actualizar las propiedades del inquilino existente
            existingInquilino.Nombre = inquilino.Nombre;  // Asigna los valores que quieres actualizar
            existingInquilino.Apellido = inquilino.Apellido; // Asegúrate de incluir todas las propiedades necesarias
            existingInquilino.Telefono = inquilino.Telefono;
            existingInquilino.Email = inquilino.Email;
            existingInquilino.Dni = inquilino.Dni;
            existingInquilino.Estado_Inquilino = inquilino.Estado_Inquilino; // Si existe esta propiedad
            
            if (ModelState.IsValid)
            {
                try
                {
                    await _context.SaveChangesAsync();  // Guarda los cambios
                    return NoContent();  // Éxito, devuelve 204
                }
                catch (Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException)
                {
                    // Verificar si el inquilino sigue existiendo
                    if (!_context.Inquilino.Any(e => e.Id_Inquilino == id))
                    {
                        return NotFound("El Inquilino con el ID especificado ya no existe.");
                    }
                    else
                    {
                        throw;  // Si ocurre algún otro error, lanzarlo
                    }
                }
            }

            return BadRequest(ModelState);  // Devuelve un error si el modelo es inválido
        }

        // Método para eliminar un inquilino
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInquilino(int id)
        {
            var inquilino = await _context.Inquilino.FindAsync(id);  // Busca el Inquilino por ID

            if (inquilino == null)
            {
                return NotFound();  // Si no se encuentra, devuelve un error 404
            }

            _context.Inquilino.Remove(inquilino);  // Elimina el Inquilino de la base de datos
            await _context.SaveChangesAsync();  // Guarda los cambios en la base de datos
            return NoContent();  // Devuelve un código 204 para indicar éxito
        }
    }
}
