using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Script;
namespace eMovieProject
{   
    public partial class _Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager scriptEngine = Master.FindControl("ScriptController") as ScriptManager;
            scriptEngine.RegisterAsyncPostBackControl(selectCategory);
            scriptEngine.RegisterAsyncPostBackControl(selectOrderBy);
            scriptEngine.RegisterAsyncPostBackControl(display_mode_grid);
            scriptEngine.RegisterAsyncPostBackControl(display_mode_list);
        }

        protected void onSelectCategoryChanged(object sender, EventArgs e)
        {
            int idCategoria = Convert.ToInt32((sender as DropDownList).Text);
            using(var context = new eMovieProjectDBEntities()){
                var query = from movie in context.Pelicula
                                where movie.idCategoria == idCategoria
                                select movie;
                MovieGrid.DataSourceID = null;
                MovieGrid.DataSource = query.ToList();
                MovieGrid.DataBind();
                UpdateMovieContainer.Update();
            }
        }

        protected void OnClickDisplayModeGrid(object sender, EventArgs e)
        {
            UpdateMovieContainer.Update();
        }

        protected void OnClickDisplayModeList(object sender, EventArgs e)
        {
            MovieGrid.DataSourceID = MovieEntityDataSource.ID;
            MovieGrid.DataBind();
            UpdateMovieContainer.Update();
        }

        protected void OnSelectedOrderByChanged(object sender, EventArgs e)
        {
            String orderMode = (sender as DropDownList).SelectedValue;
            MovieGrid.sort
            UpdateMovieContainer.Update();
            
        }
    }
}
