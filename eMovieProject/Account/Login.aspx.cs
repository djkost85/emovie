using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace eMovieProject.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void OnClickLogin(object sender, EventArgs e) {
            String nombreUsuario = (LoginUser.FindControl("UserName") as TextBox).Text;
            String contraseña = (LoginUser.FindControl("Password") as TextBox).Text;
            Boolean rememberMe = (LoginUser.FindControl("RememberMe") as CheckBox).Checked;
            using(var context = new eMovieProjectDBEntities()){
                Usuario user = (from u in context.Usuario
                            where u.loginUser == nombreUsuario &
                            u.contraseña == contraseña
                            select u).FirstOrDefault();
                if (user != null)
                {
                    FormsAuthentication.SetAuthCookie(nombreUsuario, rememberMe);
                    this.Context.Session.Add("idUsuario", user.idUsuario);
                    Response.Redirect("/");
                }
                else {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}
