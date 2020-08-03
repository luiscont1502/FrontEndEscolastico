using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class AlumnoBLL
    {
        //BLL Bussiness logic Layer
        //Capa de Logica del Negocio
        public static void Create(Alumno a)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Alumno.Add(a);
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }
        public static Alumno Get(int? id)
        {
            Entities db = new Entities();
            return db.Alumno.Find(id);
        }
        public static void Update(Alumno alumno)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Alumno.Attach(alumno);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;

                    }

                }
            }
        }
        public static void Delete(int? id)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Alumno alumno = db.Alumno.Find(id);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Deleted;
                        db.SaveChanges();
                        transaction.Commit();

                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }
        public static List<Alumno> list()
        {
            Entities db = new Entities();
            return db.Alumno.ToList();
        }
        public static List<Alumno> ListToNames()
        {
            Entities db = new Entities();
            List<Alumno> result = new List<Alumno>();
            db.Alumno.ToList().ForEach(x => result.Add(
                new Alumno
                {
                    nombres = x.nombres + " " + x.apellidos,
                    idalumno = x.idalumno
                }));
            return result;
        }

        public static List<Alumno> GetAlumnos(string criterio)
        {
            Entities db = new Entities();
            return db.Alumno.Where(x => x.apellidos.ToLower().Contains(criterio)).ToList();
        }
        public static List<Alumno> List(string criterio)
        {
            Entities db = new Entities();
            return db.Alumno.Where(x => x.cedula.Contains(criterio)).ToList();
        }
        private static Alumno GetAlumno(string cedula)
        {
            Entities db = new Entities();
            return db.Alumno.FirstOrDefault(x => x.cedula == cedula);
        }
    }
}
