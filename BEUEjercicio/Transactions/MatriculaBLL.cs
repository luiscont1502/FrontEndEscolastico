using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class MatriculaBLL
    {
        public static void Create(Matricula m)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Materia mt = db.Materia.Find(m.idmateria);
                        Config(m, mt);
                        db.Matricula.Add(m);
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
        private static void Config(Matricula a, Materia mt)
        {
            a.fecha = DateTime.Now;
            a.estado = "1";//Creado
            if (a.tipo.Equals("P"))
            {
                a.costo = 0;
            }
            else if (a.tipo.Equals("S"))
            {
                a.costo = (decimal)(12.25 * mt.creditos);

            }
            else
            {
                a.costo = (decimal)(24.50 * mt.creditos);
            }
        }
        public static Materia Get(int? id)
        {
            Entities db = new Entities();
            return db.Materia.Find(id);
        }
        public static void Update(Matricula matricula)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Materia mt = db.Materia.Find(matricula.idmateria);
                        Config(matricula, mt);
                        db.Matricula.Attach(matricula);
                        db.Entry(matricula).State = System.Data.Entity.EntityState.Modified;
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
                        Matricula matricula = db.Matricula.Find(id);
                        db.Entry(matricula).State = System.Data.Entity.EntityState.Deleted;
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
        public static List<Matricula> List()
        {
            Entities db = new Entities();
            return db.Matricula.ToList();
        }

        public static List<Matricula> List(int id)
        {
            Entities db = new Entities();
            return db.Matricula.Where(x => x.Alumno.idalumno == id).ToList();
        }


    }
}
