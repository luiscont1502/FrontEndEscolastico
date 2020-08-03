using BEUEjercicio;
using BEUEjercicio.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WepApiEscolastico.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class MatriculasController : ApiController
    {
        
        public IHttpActionResult Post(Materia materia)
        {
            try
            {
                MateriaBLL.Create(materia);
                return Content(HttpStatusCode.Created, "Materia creado correctamente");
            }
            catch (Exception ex)
            {
                
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Get(int id)
        {
            try
            {
                List<Matricula> todos = MatriculaBLL.List(id);
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
