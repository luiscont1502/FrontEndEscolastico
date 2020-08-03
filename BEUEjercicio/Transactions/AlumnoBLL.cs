using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class ClubBLL
    {
        //BLL Bussiness logic Layer
        //Capa de Logica del Negocio
        public static void Create(Club a)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Club.Add(a);
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
        public static Club Get(int? id)
        {
            Entities db = new Entities();
            return db.Club.Find(id);
        }
        public static void Update(Club club)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Club.Attach(club);
                        db.Entry(club).State = System.Data.Entity.EntityState.Modified;
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
                        Club club = db.Club.Find(id);
                        db.Entry(club).State = System.Data.Entity.EntityState.Deleted;
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
        public static List<Club> list()
        {
            Entities db = new Entities();
            return db.Club.ToList();
        }
       
        public static List<Club> GetClubs(string criterio)
        {
            Entities db = new Entities();
            return db.Club.Where(x => x.administrador.ToLower().Contains(criterio)).ToList();
        }
        public static List<Club> List(string criterio)
        {
            Entities db = new Entities();
            return db.Club.Where(x => x.categoria.Contains(criterio)).ToList();
        }
        private static Club GetClub(string cedula)
        {
            Entities db = new Entities();
            return db.Club.FirstOrDefault(x => x.nombre == cedula);
        }
    }
}
