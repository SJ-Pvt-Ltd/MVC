using System.Linq;
using System.Web.Mvc;
using Aktel.Domain;
using Aktel.Mvc.Models;
using NHibernate;
using Persistance;

namespace Aktel.Mvc.Controllers
{
    public class CartController : Controller
    {
        protected CartViewModel Cart;
        protected new ISession Session;

        public CartController()
        {
            Cart = (CartViewModel)System.Web.HttpContext.Current.Application["Cart"];
            Session = MvcApplication.SessionFactory.GetCurrentSession();
        }

        public ActionResult AddToCart(int id, int qty)
        {
            if (Cart.Cart == null)
                Cart.Cart = new Cart();
            if (!Cart.Cart.IsItemAlreadyInCart(id) && qty > 0)
            {
                Product product = new ProductService(Session).GetProductsById(id).First();
                Cart.Cart.AddItem(new CartItem {Product = product, Qty = qty, Subtotal=qty*19.99});
                return Redirect(Request.UrlReferrer.ToString());
            }
            return Redirect(Request.UrlReferrer.ToString()); //RedirectToAction("UpdateCart", name, qty);
        }

        public ActionResult RemoveFromCart(int Id)
        {
            if (Cart.Cart.IsItemAlreadyInCart(Id))
                Cart.Cart.RemoveItem(Id);
            return RedirectToAction("ViewCart");
        }

        public ActionResult UpdateCart(int Id, int qty)
        {
            if (Cart.Cart.IsItemAlreadyInCart(Id))
                Cart.Cart.UpdateItemQuantity(Id, qty);     
            return RedirectToAction("ViewCart");
        }

        public ActionResult ViewCart()
        {
            var cartModel = new CartViewModel
                                {
                                    HeaderandFooter = new HeaderAndFooterViewModel(),
                                    Cart = Cart.Cart
                                };
            var result = new ViewResult
                             {
                                 ViewData = {Model = cartModel}
                             };
            return result;
        }
    }
}