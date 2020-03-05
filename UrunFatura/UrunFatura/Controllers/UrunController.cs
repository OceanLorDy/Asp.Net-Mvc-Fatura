using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class UrunController : Controller
    {
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        // GET: Urun
        public ActionResult Index()
        {
            var deger = db.tbl_Urun.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult UrunEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UrunEkle(tbl_Urun u1)
        {
            if (!ModelState.IsValid)
            {
                
                return View("Index");
            }
            db.tbl_Urun.Add(u1);
            db.SaveChanges();
            return View("UrunEkle");
        }
        public ActionResult UrunSil(int id)
        {
            var urun = db.tbl_Urun.Find(id);
            db.tbl_Urun.Remove(urun);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunGetir(int id)
        {
            var urun = db.tbl_Urun.Find(id);
            return View("UrunGetir", urun);
        }
        public ActionResult UrunGuncelle(tbl_Urun p1)
        {
            var urun = db.tbl_Urun.Find(p1.UrunId);
            urun.UrunNo = p1.UrunNo;
            urun.UrunAdi = p1.UrunAdi;
            urun.UrunFiyat = p1.UrunFiyat;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
