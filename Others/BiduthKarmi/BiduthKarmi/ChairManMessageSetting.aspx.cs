using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using CommonLayer;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class ChairManMessageSetting : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            var CheckForEdit = IsEdit.Value.ToBool();
            if(CheckForEdit)
            {
                var ID = MessageID.Value;
                var model = new ClassCollection()
                {
                    ChairManMessageInfo = new ChairManMessageDetails()
                    {
                        Id = ID.ToInt(),
                        Message = MessageTextBox.Text.Trim(),
                    }
                };
                int i = ChairManMessageService.UpdateChairManMessage(model);
                if (i > 0)
                {
                    MessageTextBox.Text = string.Empty;
                    ShowMessage("Save Successfullly", new Success());
                    IsEdit.Value = "false";
                    MessageID.Value = "0";

                    Response.Redirect("ChairManMessageSetting.aspx");

                }
            }
            else
            {
                var model = new ClassCollection()
                {
                    ChairManMessageInfo = new ChairManMessageDetails()
                    {
                        Message = MessageTextBox.Text.Trim(),
                    }
                };
                int i = ChairManMessageService.SaveChairManMessage(model);
                if (i > 0)
                {
                    MessageTextBox.Text = string.Empty;
                    ShowMessage("Save Successfullly", new Success());
                    Response.Redirect("ChairManMessageSetting.aspx");
                }
            }

        }

        [WebMethod]
        public static JSONObject LoodChairManMessageDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = ChairManMessageService.GetChairManMessageLists();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr id='a" + dr["Id"] + "'>" +
                        "<td style='text-align:center'>" + dr["Id"] + "</td><td style='text-align:justify;'>" + dr["Message"] + "</td><td style='text-align:center;'>" + dr["IsActive"] + "</td>"
                       + "<td style='text-align:center; width:18%' ><button id='c" + dr["Id"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;&nbsp;<button id='b" + dr["Id"] + "' onclick=Edit(this) class='btn btn-primary' type='button' style='font-size:14px; padding:7px 12px '><i class='fas fa-edit fa-xs'></i></button>&nbsp;&nbsp;<button id='b" + dr["Id"] + "' onclick=Delete(this) class='btn btn-danger' type='button'><i class='fa fa-trash fa-xs'></i></button></td>" +
                       "</tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject MakeInactive(string CID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = ChairManMessageService.MakeInactive(CID.ToInt());
            if (dt.Rows.Count > 0)
            {

                result.Success = true;
                result.Data = NewsList;
            }
            else
            {
                result.Success = false;
            }

            return result;
        }

        [WebMethod]
        public static JSONObject EditChairManMesssage(string CID)
        {
            var result = new JSONObject();
            var dt = ChairManMessageService.GetChairManMessageById(CID.ToInt());
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                result.Message = dt.Rows[0]["Message"].ToText();

            }
            else
            {
                result.Success = false;
            }


            return result;
        }


        [WebMethod]
        public static JSONObject DeleteChairManMesssage(string CID)
        {
            var result = new JSONObject();
            var dt = ChairManMessageService.DeleteChairManMessage(CID.ToInt());
            if (dt > 0)
            {
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }


            return result;
        }
    }
}