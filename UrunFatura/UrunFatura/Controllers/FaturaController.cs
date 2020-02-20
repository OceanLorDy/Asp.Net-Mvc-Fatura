using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class FaturaController : Controller
    {
        // GET: Fatura
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        public ActionResult Index()
        {
            var deger = db.tbl_Fatura.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult FaturaEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FaturaEkle(tbl_Fatura f1)
        {
            db.tbl_Fatura.Add(f1);
            db.SaveChanges();
            return View();
        }
    }
}