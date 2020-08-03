using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class MateriaBLL
    {
        //BLL Bussiness logic Layer
        //Capa de Logica del Negocio
        public static void Create(Materia a)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materia.Add(a);
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
        public static Materia Get(int? id)
        {
            Entities db = new Entities();
            return db.Materia.Find(id);
        }
        public static void Update(Materia materia)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materia.Attach(materia);
                        db.Entry(materia).State = System.Data.Entity.EntityState.Modified;
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
                        Materia materia = db.Materia.Find(id);
                        db.Entry(materia).State = System.Data.Entity.EntityState.Deleted;
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
        public static List<Materia> List()
        {
            Entities db = new Entities();
            return db.Materia.ToList();
        }
        public static List<Materia> ListToNames()
        {
            Entities db = new Entities();
            List<Materia> result = new List<Materia>();
            db.Materia.ToList().ForEach(x => result.Add(
                new Materia
                {
                    nombre = x.nrc + "-" + x.nombre,
                    idmateria = x.idmateria
                }
                ));
            return result;
        }

    }
}
