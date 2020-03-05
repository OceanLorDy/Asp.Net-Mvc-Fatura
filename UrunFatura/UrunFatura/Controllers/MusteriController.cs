using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class MusteriController : Controller
    {
        // GET: Musteri
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        public ActionResult Index()
        {
            var deger = db.tbl_Musteri.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult MusteriEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult MusteriEkle(tbl_Musteri m1)
        {
            db.tbl_Musteri.Add(m1);
            db.SaveChanges();
            return View();
        }
        public ActionResult MusteriSil(int id)
        {
            var musteri = db.tbl_Musteri.Find(id);
            db.tbl_Musteri.Remove(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}