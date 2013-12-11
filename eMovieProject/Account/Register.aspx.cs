using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eMovieProject.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void OnClickRegisterUser(object sender, EventArgs e)
        {
            String nombreCompleto = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("nombreCompleto") as TextBox).Text;
            String apellidoCompleto = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("apellidoCompleto") as TextBox).Text;
            String loginUser = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("UserName") as TextBox).Text;
            String email = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("Email") as TextBox).Text;
            String contraseña = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("Password") as TextBox).Text;
            
            String numeroTarjeta = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("numeroTarjeta") as TextBox).Text;
            String pinTarjeta = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("pinTarjeta") as TextBox).Text;
            
            String fotografia = "";
            FileUpload imagen = (RegisterUserWizardStep.ContentTemplateContainer.FindControl("uploadImage") as FileUpload);
            
             if( (imagen.PostedFile != null ) && ( imagen.PostedFile.ContentLength > 0 ) ) {
                 string fn = System.IO.Path.GetFileName(imagen.PostedFile.FileName);
                 string SaveLocation = Server.MapPath("../Resources/UserData") + "/" +  fn;
                 fotografia = SaveLocation;
                 try { 
                     imagen.PostedFile.SaveAs(SaveLocation);
                     //Response.Write("El archivo ha sido cargado."); 
                 } catch ( Exception ex ) { 
                     Response.Write("Error: " + ex.Message);
                 } 
             } else { //Response.Write("Seleccione un archivo que cargar."); 
             }

            using(var context = new eMovieProjectDBEntities()){
                Usuario usuario = new Usuario()
                {
                    nombreCompleto = nombreCompleto,
                    apellidoCompleto = apellidoCompleto,
                    loginUser = loginUser,
                    contraseña = contraseña,
                    fotografia = fotografia
                };
                Cliente cliente = new Cliente()
                {
                    idUsuario = usuario.idUsuario,
                    numeroTarjetaCredito = numeroTarjeta,
                    pinTarjetaCredito = pinTarjeta,
                    email = email
                };
                context.Usuario.AddObject(usuario);
                context.Cliente.AddObject(cliente);
                context.SaveChanges();
                Response.Redirect("Login.aspx");
            }
        }

    }
}
