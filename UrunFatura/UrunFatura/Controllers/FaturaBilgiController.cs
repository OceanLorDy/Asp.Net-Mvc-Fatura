using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UrunFatura.Models;
using UrunFatura.Models.Entity;

namespace UrunFatura.Controllers
{
    public class FaturaBilgiController : Controller
    {
        // GET: FaturaBilgi
        FaturalandirmaEntities1 db = new FaturalandirmaEntities1();
        public ActionResult Index()
        {
            var deger = db.tbl_FaturaBilgi.ToList();
            return View(deger);
        }
        [HttpGet]
        public ActionResult FaturaBilgiEkle()
        {
            DataContext _db = new DataContext();
            F_U_ViewModel f_u = new F_U_ViewModel();
            //f_u.Fatura = _db.Fatura.ToList();
            //f_u.Urun = _db.Urun.ToList();

            List<SelectListItem> urunler = (from i in db.tbl_Urun.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.UrunAdi,
                                                Value = i.UrunId.ToString()
                                            }).ToList();
            Debug.Write(urunler);
            ViewBag.dgr = urunler;

            //List<SelectListItem> faturalar = (from j in db.tbl_Fatura.ToList()
            //                                  select new SelectListItem
            //                                  {
            //                                      Text = j.FaturaNo.ToString(),
            //                                      Value = j.FaturaNo.ToString()
            //                                  }).ToList();
            //Debug.Write(faturalar);
            //ViewBag.ass = faturalar;

            return View();
        }

        [HttpPost]
        public ActionResult FaturaBilgiEkle(tbl_FaturaBilgi fb1)
        {
            DataContext dtb = new DataContext();
            tbl_Urun Fb = db.tbl_Urun.Where(k => k.UrunId == fb1.UrunId).FirstOrDefault();
            fb1.tbl_Urun = Fb;

            db.tbl_FaturaBilgi.Add(fb1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}